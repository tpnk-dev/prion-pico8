--player {x,y,z} is the target for zarchy_engine
test_ay = 0
test_ax = 0
player = {}
enemies = {}
testers = 0

-- these are the object ids in the scene, use return_model with the correct memory position to add new models
OBJS_DATA = {decode_model(0), decode_model(45), decode_model(114), decode_model(147),decode_model(114)}

colors_explosion = {12,4,10,3}


--COLORS
pal(1, 140, 1)
pal(13, 134,1)
pal(15, 138,1)
-- 192 = 12 and 0 checkerboard - 0xc0

function game_init()
    init_terrain()

    main_update_draw = draw_update
    main_update = logic_update

    player = create_object3d(2, 120*TILE_SIZE,0,120*TILE_SIZE,0,0,0,function(object3d) gravity(object3d, false,0.1)  end)   
    player.is_crash = function(object3d) 
                        if(sqrt(object3d.vx^2+object3d.vy^2+object3d.vz^2) > 3) then
                            explode(object3d)
                        end        
                    end

    spawn_seeder()
    
end

function destroy(object)
    object.remove=true object.shadow.remove=true
end

function explode(object)
    --smoke
    for i=0,40 do
        srand(i)
        add(game_objects3d, create_sprite3d(
                object.x+rnd(10)-4,object.y+10+rnd(8),object.z+rnd(10)-4,
                nil,nil,nil,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 5) end,
                function(sprite) sprite.y+=rnd(0.4) sprite.x+=rnd(0.4)-0.2 sprite.z+=rnd(0.4)-0.2 end,
                NOP, 
                4
        ))
    end 

    for i=0,40 do
        srand(i)
        add(game_objects3d, create_sprite3d(object.x,object.y,object.z+5,
                rnd(4)-2 + object.vx/rnd(9),rnd(3)+3 + object.vy/rnd(9),rnd(4)-2 + object.vz/rnd(9),
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, colors_explosion[flr(rnd(4))+1]) end,
                function(sprite) gravity(sprite, true,0.4) end,
                NOP, 
                2
        ))
    end 

    destroy(object)
end

function thrust(ship) 
    --ship.y += ship.vy ship.x += ship.vx ship.z += ship.vz
    player.vy += 0.3*cos(player.ax)*cos(player.az)
    player.vx += 0.3*sin(player.ay)*-sin(player.ax)
    player.vz += 0.3*-cos(player.ay)*sin(player.ax)

    local dy = cos(player.ax)*cos(player.az)
    local dx = sin(player.ay)*-sin(player.ax)
    local dz = -cos(player.ay)*sin(player.ax)

    for i=0,2 do
        srand(i*time())
        local thrust_part = add(game_objects3d, create_sprite3d(
                ship.x+rnd(8)-4,ship.y,ship.z+ rnd(8)-4,
                -dx*9 + rnd(2)-1,-dy*9+ rnd(4)-2,-dz*9 + rnd(2)-1,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, max(min(10, sprite.life_span+9)-rnd(3), 7+rnd(1)) ) end,
                function(sprite) gravity(sprite, true,1) end,
                function(sprite) sprite.y=ship.y+0.001  end,
                0.3
        ))
    end
end


function shoot(ship) 
    --ship.y += ship.vy ship.x += ship.vx ship.z += ship.vz
    --sin(player.ay)*-sin(player.ax)
    local dy = sin(player.ax)
    local dx = sin(player.ay)*cos(player.ax)
    local dz = cos(player.ay)*cos(player.ax)

    add(game_objects3d, create_sprite3d(
                ship.x,ship.y,ship.z,
                10*-dx,10*-dy,10*-dz,       
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0,1) end,
                function(sprite) gravity(sprite, false,0) 
                    for i=#enemies,1,-1 do 
                        if(sqrt(abs((enemies[i].d_x - sprite.d_x)+(enemies[i].y - sprite.y)+(enemies[i].d_z - sprite.d_z))) < 0.5) then
                            enemies[i].vx = sprite.vx  enemies[i].vz = sprite.vz enemies[i].vy = sprite.vy
                            explode(enemies[i])
                        end
                    end 
                end,
                NOP,
                0.2
        ))

end

function spawn_seeder()
    local new_seeder = create_object3d(4,56,44,44,0,0,0,
        function(object3d) 
            object3d.y = get_height_smooth(object3d) + 20
            object3d.z += 2
            object3d.x +=  2
            object3d.ay +=  0.01
            if(time()%2 == 0) then
                for i=0,7 do
                    srand(i+time())
                    local virus = add(game_objects3d, create_sprite3d(
                        object3d.x,object3d.y,object3d.z,
                        rnd(4)-2,rnd(4),rnd(4)-2,
                        function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 8 ) end,
                        function(sprite) gravity(sprite, true,0.1) end,
                        NOP,
                        10
                    ))

                    virus.is_crash = function(sprite) 
                        sprite.remove=true 
                        add_virus_level_pos(sprite.x,sprite.z)
                    end
                end
            end
        end)  
    
    add(enemies, new_seeder)
end

function logic_update()
    if(player.y > t_height_player)then
        if(btn(0)) player.ay += 0.03
        if(btn(1)) player.ay -= 0.03
        if(btn(2)) then if(abs(player.ax-0.02) < 0.2) then player.ax -= 0.02 end end
        if(btn(3)) then if(abs(player.ax+0.02) < 0.2) then player.ax += 0.02 end end

        if(time()%0x0000.0001 == 0) then
            if(player.y > 200)then
                srand(time())
                add(game_objects3d, create_sprite3d(
                        player.x+rnd(200)-100,player.y+rnd(200)-50,player.z+rnd(200)-100,
                        0,0,0,
                        function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 7 ) end,
                        function(sprite) gravity(sprite, true,0.05) end,
                        NOP,
                       3
                ))
            end
        end
    end

    if(btn(4))then
        thrust(player)
    end

    if(btn(5))then
        shoot(player)
    end

    --if(player.ax < 0.04) player_shadow.ax = player.ax
    
    -- logic update objects in terrain
    

    for i=#enemies,1,-1 do
        local enemy = enemies[i]
        if(enemy.remove) then
            deli(enemies, i)
            deleted=true
        end
    end

    update_terrain()
    lasttime = time()

    cam_x = player.x
    cam_z = player.z - CAM_DIST_TERRAIN
    cam_y = 25 + player.y
end

function draw_update()
    -- must call to render terrain + objects
    render_terrain()

    -- must call to render map
    render_gui()
    print(stat(1).."   "..stat(0),40,1,6)
end



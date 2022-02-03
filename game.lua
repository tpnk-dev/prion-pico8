--player {x,y,z} is the target for zarchy_engine
test_ay = 0
test_ax = 0
player = {}
enemies = {}

wave=1
score = 0
fuel = 100
best = 0
lives = 3

shooting_cooldown = time()

wave_completed_timer = 0
damaged_counter = 0
damaged = false

infectable_areas = 0
infected_area = 0

rnd_dirt = {3,4,13,15}


function spawn_wave_1() 
    srand(7)
    spawn_seeder(flr(rnd(terrain_size)), 30, flr(rnd(terrain_size))) 
    spawn_seeder(flr(rnd(terrain_size)), 30, flr(rnd(terrain_size))) 
    spawn_seeder(flr(rnd(terrain_size)), 30, flr(rnd(terrain_size))) 
end

waves = {spawn_wave_1}

-- these are the object ids in the scene, use return_model with the correct memory position to add new models
OBJS_DATA = {decode_model(0), decode_model(45), decode_model(114), decode_model(147),decode_model(247)}

colors_explosion = {2,4,10,3,5}

--COLORS
pal(1, 140, 1)
pal(13, 134,1)
pal(15, 138,1)
pal(2, 131,1)
-- 192 = 12 and 0 checkerboard - 0xc0

-- 16 colors
-- needed colors 3,4,5,7,8,10,11,12,14,131,134,138,140


function game_init()
    init_terrain()

    main_update_draw = draw_update
    main_update = logic_update

    reset_player()

    waves[1]()
end

function get_color_id(idx,idz,flip)
    local height = get_height_id(idx, idz)
    local virus_level = (terrainmesh[idx][idz]&0x6000)>>13

    srand(idx*idz)
    local diversity = (idx%4+idz%4+flr((rnd(4))))%4 +1

    local color=1
    if(height>0) color=10
    if(height>5) color=rnd_dirt[diversity]

    if(virus_level > 0) then 
        if(virus_level==1) color|=0x80 
        if(virus_level>=2) color=0x88 
    end

    local flip = flip or false
    if(flip) then if(virus_level > 0) then fillp(0b1010010110100101) else fillp() end end

    return color
end

function add_virus_level_pos(posx,posz)
    local posx, posz = posx%terrain_size, posz%terrain_size
    local height = terrainmesh[(posx)\TILE_SIZE][posz\TILE_SIZE]
    local virus_level = (terrainmesh[posx\TILE_SIZE][posz\TILE_SIZE]&0x6000)>>13
    if(virus_level < 2 and height&0x00ff.ffff > 0) then
        terrainmesh[posx\TILE_SIZE][posz\TILE_SIZE] += 0x2000
        sset(minimap_memory_start+(posx\(sector_numfaces*TILE_SIZE)),(minimap_memory_start+NUMSECTS)-(posz\(sector_numfaces*TILE_SIZE)),4)

        if(virus_level == 1) infected_area += 0x0.0001
    end
end

function damage_player()
    damaged = true
    lives -=1
    damaged_counter = time()
end

function destroy(object)
    object.remove=true object.shadow.remove=true
end

function wave_completed_draw()
    print("attack Wave  "..wave.." completed",18,60,7)
    print("area infected  . . .     "..tostr(infected_area, 0x2),7,80,7)
    print("area uninfected  . . .   "..tostr(infectable_areas, 0x2),7,90,7)
end

function wave_completed_update()
    if(time()-wave_completed_timer > 5) then
        main_update_draw = draw_update
        main_update = logic_update

        wave += 1 
        destroy(player)
        reset_player()
        waves[(wave%#waves)+1]()
    end
end

function check_wave_end()
    if(#enemies == 0) then
        main_update_draw = wave_completed_draw
        main_update = wave_completed_update
        wave_completed_timer = time()
    end  
end

function explode(object)
    local h = get_height_pos(object.x,object.z)

    --smoke
    sfx(3, 3)
    for i=0,15 do
        srand(i)
        create_sprite3d(
                object.x+rnd(10)-4,object.y+10+rnd(8),object.z+rnd(10)-4,
                nil,nil,nil,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 5) end,
                function(sprite) sprite.y+=rnd(0.4) sprite.x+=rnd(0.4)-0.2 sprite.z+=rnd(0.4)-0.2 end,
                NOP, 
                4
        )
    end 

    for i=0,30 do
        srand(i)

        local color = 12 - flr(rnd(2))*5
        if(h > 0) color = colors_explosion[flr(rnd(5))+1]

        create_sprite3d(object.x,object.y,object.z+5,
                rnd(1)-.5,rnd(1)+.5,rnd(1)-.5,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, color) end,
                function(sprite) gravity(sprite, true,0.02) end,
                NOP, 
                10
        )
    end 

    destroy(object)
end

function thrust(ship) 
    --ship.y += ship.vy ship.x += ship.vx ship.z += ship.vz
    if(fuel > 0) then
        fuel-=0.1
        player.vy += 0.2*cos(player.ax)*cos(player.az)
        player.vx += 0.2*sin(player.ay)*-sin(player.ax)
        player.vz += 0.2*-cos(player.ay)*sin(player.ax)

        local dy = cos(player.ax)*cos(player.az)
        local dx = sin(player.ay)*-sin(player.ax) 
        local dz = -cos(player.ay)*sin(player.ax) 

        srand(time())
        local thrust_part = create_sprite3d(
                ship.x+rnd(2)-1,ship.y,ship.z+ rnd(2)+1,
                -dx*3+rnd(1)-.5,-dy*3+ rnd(1)-.5,-dz*3+rnd(1)-.5,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, max(min(10, sprite.life_span+9)-rnd(3), 7+rnd(1)) ) end,
                function(sprite) gravity(sprite, true,.05) end,
                function(sprite) sprite.y=ship.y+0.001  end,
                0.8
        )
    end
end

function shoot(ship) 
    local dy = sin(player.ax)
    local dx = sin(player.ay)*cos(player.ax)
    local dz = cos(player.ay)*cos(player.ax)

    score -= 0x0.0001
    sfx( 1, 2)
    local projectile = create_sprite3d(
            ship.x,ship.y,ship.z,
            9*-dx,9*-dy,9*-dz,       
            function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0,7) end,
            function(sprite) gravity(sprite, false,0) 
                for i=#enemies,1,-1 do 
                    if(sqrt(abs(sprite.d_x-enemies[i].d_x)+abs(sprite.y-enemies[i].y)+abs(sprite.d_z-enemies[i].d_z)) < 5) then
                        enemies[i].vx = sprite.vx  enemies[i].vz = sprite.vz enemies[i].vy = sprite.vy
                        score+=0x0.0064
                        add(game_objects3d, create_sprite3d(enemies[i].x,enemies[i].y,enemies[i].z,
                                nil,nil,nil,
                                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) print(100,sx,sy,7) end,
                                function(sprite) sprite.y += 0.1 end,
                                NOP,
                                5
                        ))
                        explode(enemies[i])
                        deli(enemies,i)
                        check_wave_end()
                    end
                end 
            end,
            NOP,
            1
    )

    projectile.is_crash = function(sprite) 
        sfx(2, 1)
        sprite.remove=true 
        
        local h = get_height_pos(sprite.x,sprite.z)


        for i=0, 10 do
            srand(i* time())

            local color = 12 - flr(rnd(2))*5
            if(h > 0) color = colors_explosion[flr(rnd(5))+1]

            create_sprite3d(
                    sprite.x,sprite.y,sprite.z,
                    rnd(2)-1,rnd(2),rnd(2)-1,
                    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, color) end,
                    function(sprite) gravity(sprite, true,0.1) end,
                    NOP, 
                    1
            )
        end
    end

end

function spawn_seeder(x,y,z)
    local new_seeder = create_object3d(4,x,y,z,0,0,0,
        function(object3d) 
            local current_height = get_height_pos(object3d.x,object3d.z)
            local current_height_smooth = get_height_smooth(object3d)
    
            object3d.ay +=  0.01

            if(object3d.landed)then
                if(object3d.y - 1 > current_height_smooth + 20) object3d.y -=  1

                if(object3d.seed_count>30) then
                    for i=0,3 do
                        object3d.landing_gears[i].draw = NOP 
                    end
                
                    object3d.landed = false object3d.dir={rnd(2)-1,rnd(2)-1}
                end
            else
                if(abs(current_height+50-object3d.y) > 1) object3d.y+=sgn(current_height+50-object3d.y)*.5

                object3d.z += object3d.dir[1]
                object3d.x += object3d.dir[2]

                if(time()%30 == 0) then
                    if(current_height > 20) then
                        object3d.landed=true
                        object3d.seed_count = 0

                        for i=0,3 do
                            object3d.landing_gears[i].draw = function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) line(sx, sy, sx+sgn(i-2)*3, sy+5, 10) end
                        end
                    end
                end
            end

            if(current_height > 0) then
                if(time()%0.5 == 0) then
                    object3d.seed_count += 1
                    if(object3d.is_visible) then
                        for i=0,7 do
                            srand(i*time())
                            local virus = create_sprite3d(
                                object3d.x,object3d.y,object3d.z,
                                rnd(4)-2,rnd(4),rnd(4)-2,
                                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 8 ) end,
                                function(sprite) gravity(sprite, true,0.1) end,
                                NOP,
                                10
                            )

                            virus.is_crash = function(sprite) 
                                sprite.remove=true 
                                add_virus_level_pos(sprite.x,sprite.z)
                            end
                        end
                    else    
                        for i=0,7 do    
                            srand(i*time())
                            add_virus_level_pos(object3d.x+(rnd(14)-7)*TILE_SIZE,object3d.z+(rnd(14)-7)*TILE_SIZE)
                        end
                        -- 7 each direction
                    end
                end
            end


        end,
        function(object3d) 
            object3d.landing_gears={} 
            for i=0,3 do
                local landing_gear = create_sprite3d(
                    object3d.x,object3d.y,object3d.z,
                    0,0,0,
                    NOP,
                    function(sprite) sprite.x=object3d.x + sgn(i-2)*10 sprite.y=object3d.y-8 sprite.z=object3d.z+((i%2) - 1)*10 end,
                    NOP
                )

                object3d.landing_gears[i] = landing_gear
            end 
            
            object3d.landed=false object3d.seed_count=0 object3d.dir={rnd(2)-1,rnd(2)-1} end)  
    
    add(enemies, new_seeder)
end

function reset_player()
    player = create_object3d(2, 120*TILE_SIZE,0,50*TILE_SIZE,0,0,0,
            function(object3d) 
                gravity(object3d, false,0.05)  

                if(object3d.y > t_height_player)then
                    if(btn(0)) object3d.ay += 0.03
                    if(btn(1)) object3d.ay -= 0.03
                    if(btn(2)) then if(abs(object3d.ax-0.02) < 0.2) then object3d.ax -= 0.02 end end
                    if(btn(3)) then if(abs(object3d.ax+0.02) < 0.2) then object3d.ax += 0.02 end end

                    if(time()%0x0000.0001 == 0) then
                        if(object3d.y > 200)then
                            srand(time())
                            create_sprite3d(
                                    object3d.x+rnd(200)-100,object3d.y+rnd(200)-50,object3d.z+rnd(200)-100,
                                    0,0,0,
                                    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 7 ) end,
                                    function(sprite) gravity(sprite, true,0.001) end,
                                    NOP,
                                    3,
                                    true
                            )
                        end
                    end
                end

                if(btn(4))then
                    sfx( 0, 1)
                    thrust(object3d)
                end

                if(btn(5))then
                    if(time() - shooting_cooldown > .2) shoot(object3d) shooting_cooldown=time()
                end
            end)   
            player.is_crash = function(object3d) 
                if(sqrt(object3d.vx^2+object3d.vy^2+object3d.vz^2) > 3) then
                    explode(object3d)
                    damage_player()
                end        
            end
end

function logic_update()

    if(damaged) then
        if(time() - damaged_counter > 5) damaged=false reset_player()
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
    if(player.y > t_height_player_smooth + 50) then
        cam_y = player.y - 20
    else
        cam_y = t_height_player_smooth + 30
    end
end

function render_gamegui()
    rectfill(NUMSECTS+1,0,128,12,6)

    --x[[
    print("score",NUMSECTS+1+1,1,7)
    print(tostr(score,0x2),NUMSECTS+1+1,7,7)

    --print("prion",NUMSECTS+1+30,1,8)
    for i=1,lives do spr( 64, 58 + i*5, 1) end
    

    print("wave",NUMSECTS+1+58,1,7)
    print(wave,NUMSECTS+1+58,7,7)

    print("best",NUMSECTS+1+78,1,7)
    print(best,NUMSECTS+1+78,7,7)
    --]]

    --x[[
    print(tostr(infectable_areas, 0x2), 31, 15,7)
    print(tostr(infected_area, 0x2), 60, 15,7)
    print(stat(1),90,15,7)
    --]]
    rectfill(NUMSECTS,13,fuel+NUMSECTS,13,10)
    
end


function draw_update()
    -- must call to render terrain + objects
    render_terrain()


    render_gamegui()
    -- must call to render map
    render_minimap()
    --print(stat(1).."   "..stat(0),40,1,6)
end



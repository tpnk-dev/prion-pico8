-- 4317 tokens
-- tpnk_dev

orig_srand = peek(0x5f44)

test_ay, test_ax, player, enemies, envir = 0, 0, {}, {}, {}

wave, fivek_counter, score, bonus_score, fuel, best, lives, missiles=1,1,0,0,100,0,3,3

shooting_cooldown,time_last_shot,shoot_btn_last,shoot_btn_current = time(),time(),false,false

wave_completed_timer, damaged_counter, damaged = 0,0,false

infectable_areas, infected_area = 0, 0

rnd_dirt, rnd_cement, colors_explosion = {11,4,15,10}, {6,7}, {2,4,10,3,5}

spawn_funcs, waves = {}, {}

-- vertex data (s=nusign, v=virus level, t=type of object, h=height)
-- vvvttttthhhhhhhh hhhhhhhhhhhhhhhh
-- 1111111111111111.1111111111111111

-- these are the object ids in the scene, use return_model with the correct memory position to add new models
-- 1: tree 1
-- 2: player
-- 3: player shadow
-- 4: seeder
-- 5: seeder shadow
-- 6: drone
-- 7: drone shadow
-- 8: tree destroyed
-- 9: radar
-- 10: radar shadow
-- 11: radar tower
-- 12: fish
-- 13: bush
-- 14: bush destroyed
-- 15: infected tree 1
-- 16: mutated drone
-- 17: mutated drone shadow
-- 18: infected bush
-- 19: bomber
-- 20: bomber shadow
-- 21: fighter
-- 22: fighter shadow,
-- 23: fighter weak
-- 24: homing missile
-- 24: homing missile shadow

-- load object data 1386 = 1337 + 47-> num_models*2-1
OBJS_DATA = {[0]={{{0,0,0}},{}}}
for i=1337, 1386, 2 do  
    add(OBJS_DATA, decode_model(%i))
end

ENV_FUNC = {
    [8] = function(object) 
        if(time()%3 == 0) then
            create_sprite(
                object.x+rnd(10)-4,object.y+10+rnd(8),object.z+rnd(10)-4,
                0,0,0,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 5) end,
                function(sprite) sprite.y+=rnd(0.4) sprite.x+=rnd(0.4)-0.2 sprite.z+=rnd(0.4)-0.2 end,
                NOP, 
                4,
                false,
                true
            )
        end
    end
    , 
    [9] = function(object) 
        object.lock_verts={1,2,3,4} 
        object.ay = time() 
        create_object3d(10, object.x, object.y, object.z,object.ay,nil,nil,nil,nil,nil,nil,nil,true,true)
    end,
    [12] = function(object) 
        --object.lock_verts={1,2,3,4} 
        --gravity(object, true,0.2)
        srand(object.x * object.z)
        local x = (rnd(10)+time())%(2 + rnd(10) )
        object.y = (-5*(x^2) + 5*x)* 20
        if(x >= 1) object.y = -10
        --if(time()%flr(rnd(20) + 5) > 1) object.y = 0
        object.x += (time()%10)* (rnd(500) - 250)

        if(object.y <= 0) then
            if(time()%1==0) then
                srand(time())

                local color = 12 - flr(rnd(2))*5

                create_sprite(
                    object.x,1,object.z,
                    rnd(2)-1,rnd(2),rnd(2)-1,
                    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, color) end,
                    function(sprite) gravity(sprite, true,0.1) end,
                    NOP, 
                    1
                )
            end
        end
        reset_srand()
        --object.z += (time()%10)* 50
        --create_object3d(10, object.x, object.y, object.z,object.ay,nil,nil,nil,nil,nil,nil,nil,true,true)
    end
}

--COLORS
pal(1, 140, 1)
pal(13, 134,1)
pal(15, 138,1)
pal(2, 131,1)
-- 192 = 12 and 0 checkerboard - 0xc0

-- 16 colors
-- needed colors 3,4,5,7,8,10,11,12,14,131,134,138,140

function reset_srand() poke(0x5f44, orig_srand) end
   
function v_len(obj1, obj2, y_not_zeroed)
    -- y_not_zeroed usually false, because most of the times only the the 2d dist
    local x,y,z = obj1.x-obj2.x, 0, obj1.z-obj2.z
    if (y_not_zeroed) y = obj1.y-obj2.y 
    local ax=atan2(x,y)
    local d2=x*cos(ax)+y*sin(ax)
    local az=atan2(d2,z)
    return d2*cos(az)+z*sin(az)
end

function game_init()
    init_terrain()

    main_update_draw = draw_update
    main_update = logic_update

    reset_player()
    waves[1]()
end

function get_color_id(idx,idz,flip)
    local height = get_height_id(idx, idz)
    local virus_level = get_virus_level_id(idx,idz)

    srand(idz*idx)
    local diversity = (idx%4+idz%4+flr((rnd(6))))%4 +1

    local color=1
    if(height>0) color=10
    if(height>15) color=rnd_dirt[diversity]
    if(height==68) color = rnd_cement[(idx%2+idz%2+flr((rnd(2))))%2+1]

    if(virus_level >= 1) then
        fillp(0b1010010110100101)
        --11(bright green) -> (brown/gray,brown,gray) -> 0x45, 0x44, 0x55
        --4 (brown) -> red
        --15 (dark green) -> (brown,gray,red) -> 0x44,0x55,0x88
        --10 (yellow) -> (yellow/red) -> 0x8a
        local rdmn_light_green={0x46, 0x44, 0x66}
        if(color==11) color=rdmn_light_green[flr(rnd(3))+1]
        if(color==4) color=0x88
        local rdmn_dark_green={0x44,0x66,0x88}
        if(color==15) color=rdmn_dark_green[flr(rnd(3))+1]
        if(color==10) color=0x8a
    else
        fillp()
    end

    --if(virus_level > 0) then 
    --    if(virus_level==1) color|=0x80 
    --    if(virus_level>=2) color=0x88 
    --end

    --local flip = flip or false
    --if(flip) then if(virus_level > 0) then fillp(0b1010010110100101) else fillp() end end
    reset_srand()
    return color
end

function get_virus_level_id(idx,idz)
    return (terrainmesh[idx][idz]&0xc000)>>>14
end

function add_virus_level_pos(posx,posz)
    local posx, posz = posx%terrain_size, posz%terrain_size
    local idx, idz = posx\TILE_SIZE, posz\TILE_SIZE
    local height = get_height_pos(posx,posz) 

    local virus_level = get_virus_level_id(idx,idz)
    if(virus_level == 0 and height > 0 and height != 0x0044) then
        terrainmesh[idx][idz] += 0x4000
        sset(minimap_memory_start+(posx\(sector_numfaces*TILE_SIZE)),(minimap_memory_start+NUMSECTS)-(posz\(sector_numfaces*TILE_SIZE)),4)

        local env_type = get_type_id(idx, idz)
        if(env_type==1) then terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | 0x0F00 end
        if(env_type==13) then terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | 0x1200 end

        infected_area += 0x0.0001
    end
end

function damage_player() 
    explode(player)
    damaged = true
    lives -=1
    damaged_counter = time()
end

function destroy(object)
    object.remove=true if(object.shadow!=nil) object.shadow.remove=true
end

function wave_completed_draw()
    print("Attack Wave  "..wave.." completed",18,60,7)
    print("Area infected  . . .     "..tostr(infected_area, 0x2),7,80,7)
    print("Area uninfected  . . .   "..tostr(infectable_areas, 0x2),7,90,7)
    print("Bonus uninfected area .  "..tostr(bonus_score, 0x2),7,105,7)
end

function wave_completed_update()
    if(time()-wave_completed_timer > 5) then
        main_update_draw = draw_update
        main_update = logic_update

        game_objects3d = {}
        wave += 1 
        destroy(player)
        reset_player()
        waves[wave%(#waves+1)]()
    end
end

function check_wave_end()
    if(#enemies == 0) then
        bonus_score = max(0,(infectable_areas-infected_area - infected_area)/(max(32/wave, 4)))
        score += bonus_score
        main_update_draw = wave_completed_draw
        main_update = wave_completed_update
        wave_completed_timer = time()
    end  
end

function explode(object, idx_enemy)
    local h = get_height_pos(object.x,object.z)

    --smoke
    sfx(3, 3)
    for i=0,7 do
        srand(i)
        create_sprite(
            object.x+rnd(10)-4,object.y+10+rnd(8),object.z+rnd(10)-4,
            0,0,0,
            function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) for z=0,5 do srand(z * i) circfill(sx+rnd(5)-4, sy+rnd(5)-4, 0, 5) end end,
            function(sprite) sprite.y+=rnd(0.4) sprite.x+=rnd(0.4)-0.2 sprite.z+=rnd(0.4)-0.2 end,
            NOP, 
            4,
            false,
            true
        )
    end 

    for i=0,15 do
        srand(i)

        local color = colors_explosion[flr(rnd(5))+1]
        if(h == 0 and object.y <= 1) color = 12 - flr(rnd(2))*5

        create_sprite(object.x,object.y,object.z+5,
                rnd(2)-1,rnd(4)+2,rnd(2)-1,
                function(sprite)
                    local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) 
                    circfill(sx, sy, 0, color) 
                    --[[for z=0,0 do
                        srand(z * i) 
                        local color = colors_explosion[flr(rnd(5))+1]
                        if(h == 0 and object.y <= 1) color = 12 - flr(rnd(2))*5
                        circfill(sx+rnd(30)-20, sy+rnd(10)-5, 0, color) 
                    end--]]
                end,
                function(sprite) gravity(sprite, true,0.2) end,
                NOP, 
                10,
                false,
                true
        )
    end 
    reset_srand()
    destroy(object)
    deli(enemies, idx_enemy)
    check_wave_end()
end

function play_audio_vicinity(emitter, n, channel)
    if(emitter.is_visible) then sfx(n,channel) end
end


function thrust(ship,intensity,is_player) 
    local is_player = is_player or false
    local intensity = intensity or 0.2

    if((fuel > 0 and is_player) or not is_player) then 
        if (fuel > 0 and is_player) then fuel-=0.05 end

        ship.vy += intensity*cos(ship.ax)*cos(ship.az)
        ship.vx += intensity*sin(ship.ay)*-sin(ship.ax)
        ship.vz += intensity*-cos(ship.ay)*sin(ship.ax)

        local dy = cos(ship.ax)*cos(ship.az)
        local dx = sin(ship.ay)*-sin(ship.ax) 
        local dz = -cos(ship.ay)*sin(ship.ax) 

        play_audio_vicinity(ship, 0, 1)

        if(ship.is_visible) then
            srand(time())
            for i=0,1 do
                srand(i * time())
                local thrust_part = create_sprite(
                    ship.x+rnd(8)-4,ship.y+rnd(8)-4,ship.z+rnd(8)+4 + 20,
                    -dx*4+rnd(2)-1+ship.vx,-dy*4+ship.vy+ rnd(2)-1,-dz*4+rnd(2)-1+ship.vz,
                    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) local color=7+rnd(1)*3 if(sprite.life_span < 0.2) then color=8 end  circfill(sx, sy, 0, color) end,
                    function(sprite) gravity(sprite, true,0.1) end,
                    function(sprite) sprite.y=ship.y+0.001  end,
                    0.4
                )
            end
            reset_srand()
        end
    end
end

--is inverted is temporary fix
function shoot(ship) 
    local is_inverted = is_inverted or false
    local dy = sin(ship.ax)
    local dx = sin(ship.ay)*cos(ship.ax)
    local dz = cos(ship.ay)*cos(ship.ax)
    local speed = 10

    play_audio_vicinity(ship, 1, 2)
    local projectile = create_sprite(
        ship.x,ship.y,ship.z,
        speed*-dx+ship.vx,speed*-dy+ship.vy,speed*-dz+ship.vz,       
        function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0,7) end,
        function(sprite) 
            gravity(sprite, false,0) 

            if(collide_enemies(sprite, ship)) then
                sprite.life_span=-1
            end  

            collide_env(sprite)
        end,
        NOP,
        1
    )

    projectile.is_crash = function(sprite)
        play_audio_vicinity(sprite, 2, 1) 
        sprite.remove=true 
        
        local h = get_height_pos(sprite.x,sprite.z)

        for i=0, 5 do
            srand(i* time())

            local color = 12 - flr(rnd(2))*5
            if(h > 0) color = colors_explosion[flr(rnd(5))+1]

            create_sprite(
                sprite.x,sprite.y,sprite.z,
                rnd(2)-1,rnd(2),rnd(2)-1,
                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, color) end,
                function(sprite) gravity(sprite, true,0.1) end,
                NOP, 
                1,
                false,
                true
            )
        end
        reset_srand()
    end

end

function attack_player(object3d, current_height, x_z_distance_to_player)
    local x_z_distance_to_player = x_z_distance_to_player or v_len(player, object3d)
    gravity(object3d, false,0.05)     

    -- move towards player when within distance
    local destination_angle_y = -atan2(player.x - object3d.x, player.z - object3d.z)
    local destination_angle_x = -atan2(x_z_distance_to_player, player.y - object3d.y)

    if(x_z_distance_to_player > 100) then
        thrust(object3d,0.4)
        if(object3d.y - player.y < 20 or current_height < 40)  destination_angle_x=-0.15 else destination_angle_x=-0.25
    else
        if(object3d.y - player.y < 20) thrust(object3d,0.2)
        if(time() - object3d.shooting_cooldown > object3d.shooting_interval) shoot(object3d) object3d.shooting_cooldown=time()
    end

    object3d.ay += (destination_angle_y+.25-object3d.ay)*0.3
    object3d.ax += (destination_angle_x-object3d.ax)*0.5
end

--seeder
add(spawn_funcs, function (x,y,z)
    local landing_gears={} 
    for i=0,3 do
        landing_gears[i] = create_sprite(
            x,y,z,
            0,0,0
        )
    end

    local new_seeder = create_object3d(4,x,y,z,0,0,0,
        function(object3d) 
            local current_height = get_height_pos(object3d.x,object3d.z)
    
            object3d.ay +=  0.01

            if(object3d.landed)then
                if(object3d.y - 1 > current_height + 20) object3d.y -=  1

                if(object3d.seed_count>30) then
                    for i=0,3 do
                        object3d.landing_gears[i].draw = NOP 
                    end
                
                    object3d.landed = false object3d.dir={rnd(2)-1,rnd(2)-1}
                end
            else
                play_audio_vicinity(object3d, 4, -1)

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
                            local virus = create_sprite(
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
            reset_srand()
        end,
        function(object3d) 
            object3d.return_blip_color=function() return 12 end 
            object3d.return_death_score=function() for i=0,3 do destroy(object3d.landing_gears[i]) end if(object3d.landed) then return 50 end return 100 end
            object3d.landing_gears=landing_gears
            for i=0,3 do
                --local landing_gear = create_sprite(
                --    object3d.x,object3d.y,object3d.z,
                --    0,0,0,
                --    NOP,
                --    function(sprite) sprite.x=object3d.x + sgn(i-2)*10 sprite.y=object3d.y-8 sprite.z=object3d.z+((i%2) - 1)*10 end,
                --    NOP
                --)

                object3d.landing_gears[i].update_func = function(sprite) sprite.x=object3d.x + sgn(i-2)*10 sprite.y=object3d.y-8 sprite.z=object3d.z+((i%2) - 1)*10 end

               --local temp = game_objects3d[#game_objects3d]
                --game_objects3d[#game_objects3d] = game_objects3d[#game_objects3d-1]
                --game_objects3d[#game_objects3d - 1] = temp

                --object3d.landing_gears[i] = landing_gear
            end 
            
            object3d.landed=false object3d.seed_count=0 object3d.dir={rnd(2)-1,rnd(2)-1} 
        end)  
    
    add(enemies, new_seeder)
end)

--drone
add(spawn_funcs,function (x,y,z)
    local new_drone = create_object3d(6,x,y,z,.25,0,0,
        function(object3d)             
            local current_height = get_height_pos(object3d.x%terrain_size,object3d.z%terrain_size)

            srand(time())

            local x_z_distance_to_player = v_len(player, object3d)

            if(x_z_distance_to_player < 600 or object3d.is_mutated) then    
                attack_player(object3d, current_height, x_z_distance_to_player)                
            else
                -- only search for mutated bushes if not mutated
                -- if on virused square, become mutated 1/5 times
                if(time() - object3d.shooting_cooldown > .7) then 
                    local posx, posz = object3d.x%terrain_size, object3d.z%terrain_size
                    local v_level = sget(minimap_memory_start+(posx\(sector_numfaces*TILE_SIZE)),(minimap_memory_start+NUMSECTS)-(posz\(sector_numfaces*TILE_SIZE)))
                    if(v_level == 4) then
                        if flr(rnd(10)) == 1 then
                            object3d.tris = OBJS_DATA[16][2]
                            shooting_interval = 0.14
                            object3d.is_mutated = true
                        end
                    end
                end

                -- move to random direction
                object3d.ay += (object3d.dir-object3d.ay)*0.02 +rnd(0.01)-0.02
                object3d.x -= sin(object3d.ay) * 3
                object3d.z -= cos(object3d.ay) * 3
                if(time()%10 == 0) then
                    object3d.dir=rnd(1)
                end
            end
            reset_srand()
            clamp_speed(object3d, 4)

        end,
        function(object3d) 
            object3d.is_mutated = false
            object3d.shooting_interval = 0.7
            object3d.return_death_score=function() if(object3d.is_mutated) return 500 else return 300 end 
            object3d.return_blip_color=function() if(object3d.is_mutated) if(time()%0.5 == 0) return 8 else return 9 else return 9 end 
            object3d.shooting_cooldown = time()
        
            object3d.dir=rnd(1)
        end
    )

    add(enemies, new_drone)

    new_drone.is_crash = function(object3d) 
        explode(new_drone, #enemies)     
    end
    --player = new_drone
    --player = new_drone
end)

--bomber
add(spawn_funcs,function (x,y,z)
    local new_bomber = create_object3d(19,x,y,z,.25,0,0,
        function(object3d)             
            local current_height = get_height_pos(object3d.x, object3d.z)
            local shooting_interval = 0.7

            object3d.ay += (object3d.dir-object3d.ay)*0.02
            object3d.y = current_height + 100
            object3d.x -= sin(object3d.ay) * 3
            object3d.z -= cos(object3d.ay) * 3

            if(time()%1 == 0) then
                local bomb = create_sprite(
                    object3d.x,object3d.y,object3d.z,
                    0,0,0,
                    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) spr(67, sx, sy) end,
                    function(sprite) gravity(sprite, true,0.2) end
                )
                bomb.is_crash = function(sprite) 
                    sprite.remove=true 
                    local radius_in_tiles = 3
                    local num_viruses_per_side = radius_in_tiles * 2 
                    for i=-radius_in_tiles,radius_in_tiles do  
                        for j=-radius_in_tiles,radius_in_tiles do
                            local dx = i * TILE_SIZE 
                            local dz = j * TILE_SIZE 
                            add_virus_level_pos(bomb.x + dx, bomb.z + dz)
                        end
                    end
                end
            end
        end,
        function(object3d) 
            object3d.return_death_score=function() return 800 end 
            object3d.return_blip_color=function() if(time()%.5 < 0.25) return 12 else return 0 end
        
            object3d.dir=rnd(1)
        end
    )

    add(enemies, new_bomber)

    new_bomber.is_crash = function(object3d) 
        explode(new_bomber, #enemies)     
    end
end)

-- fighter
add(spawn_funcs,function (x,y,z)
    local new_fighter = create_object3d(21,x,y,z,.25,0,0,
        function(object3d)             
            local current_height = object3d.y - get_height_pos(object3d.x, object3d.z)
            local shooting_interval = 0.3

            test_var = current_height
            attack_player(object3d, current_height)

            clamp_speed(object3d, 4)
        end,
        function(object3d) 
            object3d.shooting_interval = 0.3
            object3d.hit_points = 2
            object3d.return_death_score=function() if (object3d.hit_points==0) return 700 else object3d.tris = OBJS_DATA[23][2] object3d.shooting_interval = 0.6 return 200 end 
            object3d.return_blip_color=function() if(time()%.5 < 0.25) return 10 else return 0 end
            object3d.shooting_cooldown = time()
        
            object3d.dir=rnd(1)
        end
    )

    add(enemies, new_fighter)

    new_fighter.is_crash = function(object3d) 
        explode(object3d, #enemies)    
    end
end)

local counts_lvl = {}
for i=1387, 1400, 7 do -- 1401 = 1387+7*2
    local counts_lvl = {}
    for z = 0, 7 do
        counts_lvl[z+1] = @(i+z)
    end

    add(waves,
        function()
            srand(7)
            for z = 1, 5 do
                for amount = 1, counts_lvl[z] do
                    spawn_funcs[z](flr(rnd(terrain_size)),100,flr(rnd(terrain_size))) 
                end
            end   
        end
    )
end


function collide_enemies(object, emitter, damage)
    damage = damage or 1
    emitter = emitter or object 
    local all_ships = enemies
    all_ships[0] = player

    for i=#all_ships,0,-1 do 
        if(all_ships[i].y != emitter.y and all_ships[i].x != emitter.x) then
            if(v_len(object,all_ships[i],true) < 20) then
                --all_ships[i].vx = object.vx  all_ships[i].vz = object.vz all_ships[i].vy = object.vy
                if(i > 0) then
                    if(enemies[i].hit_points) enemies[i].hit_points -= damage
                    death_score = enemies[i].return_death_score()
                    add_score(death_score>>16)
                    create_sprite(enemies[i].x,enemies[i].y,enemies[i].z,
                            0,0,0,
                            function(object) local sx,sy=project_point(object.t_x,object.t_y,object.t_z) print(death_score,sx,sy,7) end,
                            function(object) object.y += 0.1 end,
                            NOP,
                            5,
                            false,
                            true
                    )
                    if(not enemies[i].hit_points or enemies[i].hit_points <= 0) then
                        explode(enemies[i], i)
                    end
                else
                    fuel-=20
                end

                return true
            end
        end
    end 

    return false
end

function collide_env(object)
    for i=#envir,1,-1 do 
        if(sqrt(abs(object.d_x-envir[i].d_x)+abs(object.y-envir[i].y)+abs(object.d_z-envir[i].d_z)) < 5) then
            envir[i].vx = object.vx  envir[i].vz = object.vz envir[i].vy = object.vy

            local idx, idz = get_tileid(envir[i].d_x%terrain_size), get_tileid(envir[i].d_z%terrain_size)
            local env_type = get_type_id(idx, idz)


            if(env_type==1 or env_type==15) then 
                explode(envir[i]) terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | 0x0800 
                if(env_type==15) then
                    add_score(40>>16)
                    create_sprite(object.x,object.y,object.z,
                            0,0,0,
                            function(object) local sx,sy=project_point(object.t_x,object.t_y,object.t_z) print(40,sx,sy,7) end,
                            function(object) object.y += 0.1 end,
                            NOP,
                            5,
                            false,
                            true
                    )
                end
                
            end
            if(env_type==6) then add_score(0x0.0028) explode(envir[i]) terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | 0x0800 end
            if(env_type==9) then explode(envir[i]) terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | 0x0b00 end 
            if(env_type==13) then explode(envir[i]) terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | 0x0E00 end 

            return true
        end
    end 

    return false
end

function add_score(amount)
    score += amount
    -- 0x0000.1388 = 5000
    if(score > (fivek_counter * 0x0000.1388)) then
        fivek_counter += 1
        lives += 1
        missiles += 1
    end
end

function reset_player()
    player = create_object3d(2, 118*TILE_SIZE,0,118.5*TILE_SIZE,.25,0,0,
        function(object3d) 
            gravity(object3d, false,0.12)  

            if(collide_enemies(object3d)) then
                damage_player() 
            end 

            if(collide_env(object3d)) then
                damage_player() 
            end 

            if(object3d.y > t_height_cam_target)then
                if(btn(0)) object3d.ay += 0.03
                if(btn(1)) object3d.ay -= 0.03
                if(btn(2)) then if(abs(object3d.ax-0.02) < 0.2) then object3d.ax -= 0.02 end end
                if(btn(3)) then if(abs(object3d.ax+0.02) < 0.2) then object3d.ax += 0.02 end end

                if(time()%0x0000.0001 == 0) then
                    if(object3d.y > 200)then
                        srand(time())
                        create_sprite(
                                object3d.x+rnd(200)-100,object3d.y+rnd(200)-50,object3d.z+rnd(200)-100,
                                0,0,0,
                                function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, 7 ) end,
                                NOP,
                                NOP,
                                3,
                                true,
                                true
                        )
                    end
                end
            else
                if(t_height_cam_target == 68) fuel=100
            end


            if(object3d.y < 1200) then
                if(btn(4))then
                    thrust(object3d, 0.5, true)
                end
            end

            clamp_speed(object3d, 8)

            poke(0x5f5d,5)

            if(btn(5))then
                if(time() - shooting_cooldown > .1) shoot(object3d) add_score(-0x0.0001) shooting_cooldown=time()
                if(not shoot_btn_last) then

                    if(time() - time_last_shot < .2) then
                        -- double click x
                        missiles-=1
                        if(missiles >= 0) then
                            local new_missile = create_object3d(
                                24,
                                object3d.x,object3d.y,object3d.z,
                                .25,0,0,
                                function(missile3d)  
                                    gravity(missile3d, false,0)  
                                    local x_z_distance_to_target = v_len(missile3d, missile3d.target)

                                    local destination_angle_y = -atan2(missile3d.d_x - missile3d.target.d_x, missile3d.d_z - missile3d.target.d_z)
                                    local destination_angle_x = atan2(x_z_distance_to_target, missile3d.y - missile3d.target.y)

                                    missile3d.ay += (destination_angle_y-.25-missile3d.ay)
                                    missile3d.ax += (destination_angle_x-missile3d.ax)

                                    missile3d.vx -= sin(missile3d.ay) 
                                    missile3d.vy -= sin(missile3d.ax) * 5
                                    missile3d.vz -= cos(missile3d.ay)

                                    -- add later
                                    -- create_sprite(
                                    --    missile3d.x+rnd(10)-4,missile3d.y+10+rnd(8),missile3d.z+rnd(10)-4,
                                    --    0,0,0,
                                    --    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) for z=0,5 do srand(z * i) circfill(sx+rnd(5)-4, sy+rnd(5)-4, 0, 5) end end,
                                    --    function(sprite) sprite.y+=rnd(0.4) sprite.x+=rnd(0.4)-0.2 sprite.z+=rnd(0.4)-0.2 end,
                                    --    NOP, 
                                    --    4,
                                    --    false,
                                    --    true
                                    --)

                                    if(collide_enemies(missile3d, object3d, 2)) explode(missile3d)     
                                    clamp_speed(missile3d,10)
                                end,
                                function(missile3d) 
                                    missile3d.life_span = 10
                                    local closest_enemy_id, closest_enemy_distance = 0, 32767
                                    for i=1, #enemies do
                                        
                                        local x_z_distance_to_player = v_len(missile3d, enemies[i])
                                        
                                        if(x_z_distance_to_player < closest_enemy_distance) closest_enemy_id=i closest_enemy_distance=x_z_distance_to_player
                                    end

                                    missile3d.target = enemies[closest_enemy_id]
                                end,
                                object3d.vx - sin(object3d.ay) * 5, object3d.vy - sin(object3d.ax) * 5, object3d.vz - cos(object3d.ay) * 5
                            )
                            new_missile.is_crash = function(object3d) 
                                explode(new_missile)     
                            end
                        end
                    end

                    time_last_shot, shoot_btn_last = time(), true
                end
            else
                if(shoot_btn_last) shoot_btn_last = false
            end
            reset_srand()
        end)   
        player.is_crash = function(object3d) 
            if(sqrt(object3d.vx^2+object3d.vy^2+object3d.vz^2) > 3 or abs(object3d.ax) > 0.03) damage_player()    
        end
        cam_target = player
end

function clamp_speed(object3d, max_speed)
    local n = sqrt(object3d.vx^2+ object3d.vy^2 + object3d.vz^2)
    local f = (n > max_speed) and max_speed / n or 1
    
    object3d.vx, object3d.vy, object3d.vz = f*object3d.vx, f*object3d.vy, f*object3d.vz
end

function destroy_player()
    explode(player)
    damage_player()
end

function logic_update()

    if(damaged) then
        if(time() - damaged_counter > 5) damaged=false reset_player()
    end

    for i=#enemies,1,-1 do
        local enemy = enemies[i]
        if(enemy.remove) deli(enemies, i) deleted=true
    end

    update_terrain()
    lasttime = time()

    envir={}

    cam_x, cam_z = cam_target.x, cam_target.z - CAM_DIST_TERRAIN
    if(cam_target.y > t_height_cam_target + 50) cam_y = cam_target.y - 20 else cam_y = t_height_cam_target + 30
end

function render_gamegui()
    rectfill(NUMSECTS+1,0,128,12,6)

    --x[[
    print("score",NUMSECTS+1+1,1,7)
    print(tostr(score,0x2),NUMSECTS+1+1,7,7)

    --print("prion",NUMSECTS+1+30,1,8)
    for i=1,missiles do spr( 65, 58 + i*5 + 3, 5) end
    for i=1,lives do spr( 64, 58 + i*5, 0) end
    
    print("wave",NUMSECTS+1+58,1,7)
    print(wave,NUMSECTS+1+58,7,7)

    print("best",NUMSECTS+1+78,1,7)
    print(best,NUMSECTS+1+78,7,7)
    --]]

    --x[[
    print(tostr(infectable_areas, 0x2), 31, 18,7)
    print(tostr(infected_area, 0x2), 60, 18,7)
    print(stat(),90,18,7)
    --]]
    rectfill(NUMSECTS,14,fuel+NUMSECTS,14,10)

    rectfill(NUMSECTS,16,(player.y)/7+NUMSECTS,16,11)
    
end

function draw_update()
    -- must call to render terrain + objects
    render_terrain()

    render_gamegui()
    -- must call to render map
    render_minimap()
    --print(stat(1).."   "..stat(0),40,1,6)
end
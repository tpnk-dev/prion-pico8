

--player {x,y,z} is the target for zarchy_engine
test_ay = 0
test_ax = 0
player = {}

-- these are the object ids in the scene, use return_model with the correct memory position to add new models
OBJS_DATA = {decode_model(6685), decode_model(6730), decode_model(6799)}

function game_init()
    init_engine()


    main_update_draw = draw_update
    main_update = logic_update

    player = create_object3d(2, 0,0,1,0,0,0,function(object3d) gravity(object3d, false,0.1)  end)         
    player_shadow = create_object3d(3, 0,0,-0.1,0,0,0,function(object3d) gravity(object3d, false,0.1)  end)            
    add(game_objects3d, player)
    add(game_objects3d, player_shadow)
end

function thrust(ship) 
    --ship.y += ship.vy ship.x += ship.vx ship.z += ship.vz
end

function logic_update()
    if(player.y >= t_height_player)then
        if(btn(0)) player.ay += 0.03
        if(btn(1)) player.ay -= 0.03
        if(btn(2)) player.ax -= 0.02
        if(btn(3)) player.ax += 0.02
    end

    if(btn(4))then
        --sprites3d[2] = player_thruster_object_origin
        player.vy += 0.3*cos(player.ax)*cos(player.az)
        player.vx += 0.3*sin(player.ay)*-sin(player.ax)
        player.vz += 0.3*-cos(player.ay)*sin(player.ax)
    end


    if(btn(4))then
        if(time()&0x0000.1000 == 0) then
            add(game_objects3d, create_sprite3d(player.x,player.y,player.z,
                                    function(sprite) local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z) circfill(sx, sy, 0, sprite.life_span + 9) end,
                                    function(sprite) gravity(sprite, true,1) end,
                                    function(sprite) srand(time()) sprite.y=player.y+0.001 sprite.vy=2 sprite.vx=rnd(0.4)-0.2 sprite.vz=rnd(0.4)-0.2 end, 
                                    nil, nil, nil,
                                    10))
        end

    end

    player_shadow.x = player.x
    player_shadow.z = player.z + 1
    player_shadow.y = t_height_player_smooth
    player_shadow.ay = player.ay
    if(player.ax < 0.04) player_shadow.ax = player.ax
    
    -- logic update objects in terrain
    
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
end



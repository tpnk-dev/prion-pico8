
mov_starting, cam_y,cam_target,ship_index,ships, loading = 10, 0, player, 1
timer=time()

pal(0, 129, 1)
pal(1, 140, 1)
pal(13, 134,1)
pal(15, 138,1)
pal(2, 131,1)

function starting_screen_init()   
    ships = {{2,"player"},{4,"seeder"},{6,"drone"},{19,"bomber"},{21,"fighter"},{26,"pest"},{28,"attractor"},{30,"-"}}
    player = create_object3d(ships[ship_index][1], 60,0,40,0,0,0)
    --game_objects3d = {player}
end

function update_starting_screen()

    if(time()-timer < 3)then
        if(player.x != 0) player.x-=5
    else
        player.x-=5
        if(player.x<-60)then
            ship_index+=1
            player = create_object3d(ships[ship_index][1], 60,0,40,0,0,0)
            timer=time()
            cls()
        end
    end

    for i=#game_objects3d,1,-1 do
        local object=game_objects3d[i]
        local deleted=false
        if object.life_span != nil then
            object.life_span -= time() - lasttime
            if(object.life_span < 0) deleted=true
        end
        if object.remove != nil then
            if object.remove then
                deleted=true
            end
        end
        if not deleted then
        else
            deli(game_objects3d, i)
        end
    end

    player.ay -= 0.01
    player.ax = -0.025

    if(player.z-mov_starting > 40) player.z -= mov_starting
    if(player.z>1000) game_init()

    if(btn(5))then
        mov_starting = -40
        loading = true
    end
end

function draw_starting_screen()
    rectfill(0,0,128,128,0)

    order_objects()
    render_all_objects()
    clear_depth_buffer()

    rectfill( 0, 0, 128, 8, 7 ) 
    local clr = 8
    if(ships[ship_index][2]=="player") clr=3
    print(ships[ship_index][2],64-(#ships[ship_index][2]*2),2,clr) 

    if(loading) rectfill( 0, 80, 128, 128, 0 ) print('loading terrain...',30,110,7)
end
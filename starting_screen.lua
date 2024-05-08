mov_starting, cam_y,cam_target, loading = 10, 0, player
function starting_screen_init()
    player = create_object3d(2, 0,0,500,0,0,0)   
    --game_objects3d = {player}
end

function update_starting_screen()
    player.ay -= 0.02
    player.ax += 0.05

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

    rectfill( 0, 0, 128, 8, 6 ) 
    print('prion',12,2,8) 
    print('marcospiv 2021',47,2,7) 
    print('🅾️thrust',20,100,8) 
    print('❎ cannon',56,97,8) 
    print('❎+❎ missile',56,103,8) 
    print('<press ❎ to continue>',20,110,7)

    if(loading) rectfill( 0, 80, 128, 128, 0 ) print('loading terrain...',30,110,7)
end
mov_starting = 10
function starting_screen_init()
    cam_y = 0
    player = create_object3d(2, 0,0,500,0,0,0,false,false,function(object3d) end)   

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
    render_objects()

    rectfill( 0, 0, 128, 8, 6 ) 
    print('prion',12,2,8) 
    print('marcospiv 2021',47,2,7) 
    print('🅾️ to thrust and ❎ to shoot',8,100,8) 
    print('<press ❎ to continue>',20,110,7)

    if(loading) rectfill( 0, 100, 128, 128, 0 ) print('loading terrain...',30,110,7)
end
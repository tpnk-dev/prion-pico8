mov_starting, cam_y,cam_target, loading = 10, 0, player
function starting_screen_init()
    music(0)
    player = create_object3d(2, 0,0,500,0,0,0)   
    poke(0x5f83,1) -- refresh leaderboard
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
    print('tpnk_dev 2024',47,2,7) 

    if @0x5f81==4 then
        local colors_rank = split "10,6,4,7"
        local y,mem=20,0x5f91
        for i=1,@0x5f90 do
            print((@mem&0x7f)..".\t"..chr(peek(mem+1,16)),1,y,colors_rank[i]) y+=7
            print("\t"..tostr(peek4(mem+17),0x2),1,y,colors_rank[i]) y+=7
            mem+=21
        end
    else
        print("High score: "..tostr(dget(0), 0x2),27,20,10)
    end

    print('🅾️thrust',20,100,8) 
    print('❎ cannon',56,97,8) 
    print('❎+❎ missile',56,103,8) 
    print('<press ❎ to continue>',20,110,7)

    if(loading) rectfill( 0, 80, 128, 128, 0 ) print('loading terrain...',30,110,7)
end
-- Based on @marcospiv's 'ZARCHY' engine 3.0.1 - 2023
-- 2859 tokens
-- tpnk_dev
-- UPPER CASE ARE CONSTANTS. ONLY MODIFY THEM, UNLESS YOU KNOW WHAT YOU ARE DOING. REPLACE WITH FINAL VALUE IN PRODUCTION CODE.

--TIME VARS
lasttime=time()
-- TERRAIN SETTINGS
TERRAIN_NUMVERTS=241 -- HAS TO BE AN ODD NUMBER
terrain_size, terrainmesh, sector_numfaces = 0, {}
-- MESH SETTINGS
mesh_leftmost_x,mesh_rightmost_x,mesh_upmost_z,mesh_downmost_z=-33,33,1000,0
mesh_numfaces=12
mesh_numverts=mesh_numfaces + 1
-- SECTOR SETTINGS
NUMSECTS=30 --terrain_numfaces MUST BE DIVISIBLE BY THIS!
-- MINIMAP SETTINGS
minimap_memory_start = 96
-- TILE SETTING
TILE_SIZE=20
-- PROJECTION SETTINGS
K_SCREEN_SCALE,K_X_CENTER,K_Y_CENTER,Z_CLIP,Z_MAX=80,63,63,-3,-300
-- CAMERA SETTINGS
cam_x,cam_y,cam_z, CAM_DIST_TERRAIN=0,0,0,125
cam_ax,cam_ay,cam_az = 0,0.5,0
-- cam_target GLOBAL PARAMS
cam_target, mov_tiles_x,mov_tiles_z,sub_mov_x,sub_mov_z,t_height_cam_target=nil,0,0,0,0,0
-- RENDER STUFF
depth_buffer, game_objects3d, disposables, disposables_index, disposables_size={},{},{},0,30
-- cam_matrix_transform
cam_sx,cam_sy,cam_sz,cam_cx,cam_cy,cam_cz=sin(cam_ax),sin(cam_ay),sin(cam_az),cos(cam_ax),cos(cam_ay),cos(cam_az)
cam_mat00,cam_mat10,cam_mat20,cam_mat01,cam_mat11,cam_mat21,cam_mat02,cam_mat12,cam_mat22=cam_cz*cam_cy,-cam_sz,cam_cz*cam_sy,cam_cx*cam_sz*cam_cy+cam_sx*cam_sy,cam_cx*cam_cz,cam_cx*cam_sz*cam_sy-cam_sx*cam_cy,cam_sx*cam_sz*cam_cy-cam_cx*cam_sy,cam_sx*cam_cz,cam_sx*cam_sz*cam_sy+cam_cx*cam_cy
-- other
NOP=function()end

function clear_depth_buffer()
    for i=0, mesh_numfaces-1 do depth_buffer[i] = {} end
end

clear_depth_buffer()

function init_terrain()
    -- TERRAIN SETTINGS
    generate_terrain()
    local terrain_numfaces=TERRAIN_NUMVERTS-1
    terrain_size=TERRAIN_NUMVERTS*TILE_SIZE
    -- SECTOR SETTINGS
    sector_numfaces=terrain_numfaces/NUMSECTS
    save_map_memory()
end

function trunc_terrain(object)
    object.x %= (terrain_size)
    object.z %= (terrain_size)
end

function get_tileid(pos) 
    return pos\TILE_SIZE
end

function lerp(tar,pos,perc)
    return (1-perc)*tar + perc*pos;
end

function sub_vec(vec1,vec2)
    return vec1.x-vec2.x, vec1.y-vec2.y, vec1.z-vec2.z
end

---function length_vec(vec)
--    return sqrt(vec.x^2 + vec.y^2 + vec.z^2)
--end 

function get_height_pos(posx,posz)
    return (terrainmesh[(posx%terrain_size)\TILE_SIZE][(posz%terrain_size)\TILE_SIZE]&0x00ff.ffff)--/HEIGHTMULTIPLIER
end

function get_type_id(idx,idz)
    return (terrainmesh[idx][idz]&0x3f00)>>>8
end

function get_height_id(idx,idz)
    return (terrainmesh[idx][idz]&0x00ff.ffff)--/HEIGHTMULTIPLIER
end

function mat_rotate_cam_point(x,y,z)
    return x*cam_mat00+y*cam_mat10+z*cam_mat20,x*cam_mat01+y*cam_mat11+z*cam_mat21,x*cam_mat02+y*cam_mat12+z*cam_mat22
end

function mat_rotate_point(x,y,z,ax,ay,az)
    local x_rot,y_rot,z_rot = x,y*cos(ax)+z*sin(ax),y*-sin(ax)+z*cos(ax) -- x spin
    x_rot,y_rot,z_rot = x_rot*cos(az)+y_rot*sin(az),x_rot*-sin(az)+y_rot*cos(az),z_rot
    return x_rot*cos(ay)+z_rot*sin(ay),y_rot,x_rot*-sin(ay)+z_rot*cos(ay) -- y spin
end

function is_inside_cam_cone_x(posx)
    return posx > mesh_leftmost_x*TILE_SIZE and posx < mesh_rightmost_x*TILE_SIZE
end

function is_inside_cam_cone_z(posz)
    return posz > mesh_downmost_z*TILE_SIZE and posz < mesh_upmost_z*TILE_SIZE
end

function is_inside_cam_cone_y(posy)
    return posy > cam_y - 200 and posy < cam_y + 200
end

function get_draw_x_z(x,z)
    local d_x = x
    if (is_inside_cam_cone_x(x-terrain_size)) d_x = x-terrain_size
    if (is_inside_cam_cone_x(x+terrain_size)) d_x = x+terrain_size
    local d_z = z
    if (is_inside_cam_cone_z(z-terrain_size)) d_z = z-terrain_size
    if (is_inside_cam_cone_z(z+terrain_size)) d_z = z+terrain_size   
    return d_x,d_z
end

-- #electricgryphon's/ trifill method, credits to them
function trifill(x1,y1,x2,y2,x3,y3, color)
	local color1 = color
	local x1_band=band(x1,0xffff)
    local x2_band=band(x2,0xffff)
    local y1_band=band(y1,0xffff)
    local y2_band=band(y2,0xffff)
    local x3_band=band(x3,0xffff)
    local y3_band=band(y3,0xffff)
    
    local nsx,nex
    --sort y1,y2,y3
    if y1_band>y2_band then
        y1_band,y2_band=y2_band,y1_band
        x1_band,x2_band=x2_band,x1_band
    end
    
    if y1_band>y3_band then
        y1_band,y3_band=y3_band,y1_band
        x1_band,x3_band=x3_band,x1_band
    end
    
    if y2_band>y3_band then
        y2_band,y3_band=y3_band,y2_band
        x2_band,x3_band=x3_band,x2_band          
    end
    
    if y1_band!=y2_band then          
        local delta_sx=(x3_band-x1_band)/(y3_band-y1_band)
        local delta_ex=(x2_band-x1_band)/(y2_band-y1_band)

    local max_y, min_y=min(y2_band,128)

    if y1_band>0 then
        nsx=x1_band
        nex=x1_band
        min_y=y1_band
    else 
        nsx=x1_band-delta_sx*y1_band
        nex=x1_band-delta_ex*y1_band
        min_y=0
    end
        
    for y=min_y,max_y-1 do
        rectfill(nsx,y,nex,y,color1)
        nsx+=delta_sx
        nex+=delta_ex
    end

    else 
        nsx=x1_band
        nex=x2_band
    end
   
    if y3_band!=y2_band then
        local delta_sx=(x3_band-x1_band)/(y3_band-y1_band)
        local delta_ex=(x3_band-x2_band)/(y3_band-y2_band)
        
        min_y=y2_band
        max_y=min(y3_band,128)
        if y2_band<0 then
            nex=x2_band-delta_ex*y2_band
            nsx=x1_band-delta_sx*y1_band
            min_y=0
        end
            for y=min_y,max_y do
                rectfill(nsx,y,nex,y,color1)
                nex+=delta_ex
                nsx+=delta_sx
            end
    else
        rectfill(nsx,y3_band,nex,y3_band,color1)
    end

end

function project_point(x,y,z)
    return x*K_SCREEN_SCALE/z+K_X_CENTER,y*K_SCREEN_SCALE/z+K_X_CENTER
end

-- @DRAW GUI
function save_map_memory()
    local y_count = 0
    local x_count = 0
    local sector_slopes = {}

    for y=TERRAIN_NUMVERTS-sector_numfaces,0,-sector_numfaces do
        sector_slopes[y_count] = {}
        for x=0,TERRAIN_NUMVERTS-sector_numfaces,sector_numfaces do
            local h = 2
            local current_sect_height = get_height_id(x+sector_numfaces\2,y+sector_numfaces\2)

            h = sector_slopes[y_count][(x_count-1)%NUMSECTS] and current_sect_height - sector_slopes[y_count][(x_count-1)%NUMSECTS] or current_sect_height

            local color_p = 1

            color_p = h >= 0 and 3 or 11 

            if (current_sect_height == 0) color_p = 1
            

            sector_slopes[y_count][x_count] = current_sect_height

            sset( minimap_memory_start+x_count, minimap_memory_start+y_count, color_p)
            x_count += 1
        end
        x_count = 0
        y_count += 1
    end 


    --draw base
    for j=0,1 do 
        for i=0, 1 do
           sset(minimap_memory_start+i+13,minimap_memory_start+j+14,7)
        end
    end
end
function render_minimap()
    sspr(minimap_memory_start, minimap_memory_start, NUMSECTS, NUMSECTS, 0, 0,NUMSECTS+1,NUMSECTS+1)
    pset(((mov_tiles_x)\(sector_numfaces)),NUMSECTS+((-mov_tiles_z)\sector_numfaces), 7)

    for i=1, #enemies do
        local enemy = enemies[i]
        local enemy_tiles_x,enemy_tiles_z=get_tileid(enemy.x),get_tileid(enemy.z)
        pset(((enemy_tiles_x)\(sector_numfaces)),NUMSECTS+((-enemy_tiles_z)\sector_numfaces), enemy.return_blip_color())
    end

    for j=24,(TERRAIN_NUMVERTS-1)-24,48 do 
        for i=24,(TERRAIN_NUMVERTS-1)-24,48 do
           if get_type_id(i,j) == 11 then   
                rectfill(((i-24)/48) * 6, abs(((j-24)/48) * 6 - NUMSECTS), ((i-24)/48) * 6 + 5 + 1, abs(((j-24)/48) * 6 + 5 - NUMSECTS + 1), 0)
           end
        end
    end
end

-- @DRAW TERRAIN AND DEPTH BUFFER
function render_terrain()
    order_objects()
    update_view()
    rectfill(0,0,128,128,0)
    if is_inside_cam_cone_y((terrainmesh[1][1])&0x00ff.ffff) then
        local trans_proj_verts = {}
        for v=(mesh_numverts)*(mesh_numverts)-1,0,-1 do
            -- instantiate vertices

            local vert_x_id,vert_z_id=(v%mesh_numverts + mesh_leftmost_x)%TERRAIN_NUMVERTS , (v\mesh_numverts + mesh_downmost_z)%TERRAIN_NUMVERTS
            local vert_world_x,vert_world_y,vert_world_z=(v%mesh_numverts)*TILE_SIZE+mesh_leftmost_x*TILE_SIZE,get_height_id(vert_x_id,vert_z_id),v\mesh_numverts*TILE_SIZE + mesh_downmost_z*TILE_SIZE
            local vert_camera_x, vert_camera_y, vert_camera_z = vert_world_x-cam_x,vert_world_y-cam_y,vert_world_z-cam_z
            -- terrain mesh edge handling
            if (v%mesh_numverts == 0) then vert_camera_x+=sub_mov_x*TILE_SIZE  
            elseif (v%mesh_numverts == mesh_numfaces) then vert_camera_x+=sub_mov_x*TILE_SIZE-TILE_SIZE
            elseif (v\mesh_numverts == 0) then vert_camera_z+=sub_mov_z*TILE_SIZE
            elseif (v\mesh_numverts == mesh_numfaces) then vert_camera_z+=sub_mov_z*TILE_SIZE - TILE_SIZE end

            vert_camera_x,vert_camera_y,vert_camera_z=mat_rotate_cam_point(vert_camera_x,vert_camera_y,vert_camera_z)
            local vert_proj_x,vert_proj_y=project_point(vert_camera_x,vert_camera_y,vert_camera_z)
            --[[trans_proj_vert=--]]add(trans_proj_verts,{vert_camera_x,vert_camera_y,vert_world_z,vert_proj_x,vert_proj_y,vert_x_id,vert_z_id})

            if v%mesh_numverts!=0 and v%mesh_numverts<mesh_numverts-1 and v\mesh_numverts!=0 then 
                local type_object3d=get_type_id(vert_x_id,vert_z_id)
                srand(vert_x_id * vert_z_id)
                if(type_object3d > 0) create_object3d(get_type_id(vert_x_id, vert_z_id), vert_world_x, vert_world_y, vert_world_z,nil,nil,nil,nil,ENV_FUNC[type_object3d],nil,nil,nil,true,true)
            end
            
            --[[ DEBUG PRINT VERTEX DATA
                if(v%mesh_numverts == 0)then 
                    print(tostr(vert_z_id), trans_proj_vert[4]-13, trans_proj_vert[5]-2, 11)
                end

                if(v\mesh_numverts == 0)then 
                    print(tostr(vert_x_id), trans_proj_vert[4], trans_proj_vert[5]+6, 11)
                end
            --]]

            --[[ DEBUG PRINT . 
                rect( trans_proj_vert[4], trans_proj_vert[5],trans_proj_vert[4], trans_proj_vert[5], ((terrainmesh[vert_x_id][vert_z_id]&0x3f00)>>4) + 2 )
            --]]

            --print(get_virus_level_id(vert_x_id,vert_z_id), trans_proj_vert[4], trans_proj_vert[5]+3, 5)
            --[[ DEBUG PRINT VERTEX DATA
                print(vert_world_x, trans_proj_vert[4], trans_proj_vert[5]+3, 5)
            --]]
        end

        --[[ DEBUG PRINT POS&COORDS
            print("cam_target_pos: "..cam_target.x..","..cam_target.z,40,10, 6)
            print("mov_tiles: "..mov_tiles_x..","..mov_tiles_z,40,20, 6)
            print("tile_type: "..((terrainmesh[mov_tiles_x][mov_tiles_z]&0x00ff)),40,30, 6)
        --]]

        for v=1,#trans_proj_verts do
            if v%mesh_numverts != 0 and v>mesh_numverts-1 then
                local p1,p2,p3,p4=trans_proj_verts[v+1],trans_proj_verts[v-mesh_numverts+1],trans_proj_verts[v],trans_proj_verts[v-mesh_numverts]
                
                local s1x,s1y = p1[4],p1[5]
                local s2x,s2y = p2[4],p2[5]
                local s3x,s3y = p3[4],p3[5]
                local s4x,s4y = p4[4],p4[5]

                local color = get_color_id(p1[6],p1[7], true)

                --x[[
                if(((s1x-s2x)*(s4y-s2y)-(s1y-s2y)*(s4x-s2x)) < 0) trifill(s1x,s1y,s2x,s2y,s4x,s4y,color) 
                if(((s4x-s3x)*(s1y-s3y)-(s4y-s3y)*(s1x-s3x)) < 0) trifill(s4x,s4y,s3x,s3y,s1x,s1y,color) 
                --]]
                fillp()

                --[[ DEBUG WIREFRAME
                    line(p1[4],p1[5], p2[4],p2[5], 7)
                    line(p2[4],p2[5], p4[4],p4[5], 7)
                    --line(p4[4],p4[5], p1[4],p1[5], 7)

                    line(p4[4],p4[5], p3[4],p3[5], 7)
                    line(p3[4],p3[5], p1[4],p1[5], 7)
                -- line(p1[4],p1[5], p4[4],p4[5], 7)
                --]]
                

                --[[ DEBUG PRINT 
                    rect( p1[4],p1[5],p1[4],p1[5], 8 )
                    print(v, p1[4],p1[5]-3, 8)
                --]]
            else
                if v%mesh_numverts == 0 then
                    local a = abs((v-(mesh_numfaces+1))\mesh_numverts - (mesh_numfaces+1))
                    if a<mesh_numfaces then
                        for z=#depth_buffer[a],1,-1 do
                            depth_buffer[a][z]:draw()
                        end
                    end
                end
            end
        end
    else
        render_all_objects()
    end
    
    --[[ DEBUG PRINT OBJECTS TO DRAW
        print('draw '..#game_objects3d,0,30,8)
    --]]

    clear_depth_buffer()

    --for i=#depth_buffer, 0, -1 do 
    --    for z=1,#depth_buffer[i] do
    --        depth_buffer[i][z]:draw()
    --    end
    --end

    --x[[ PRINT 
        --print("웃", trans_proj_verts[82][4]-3, trans_proj_verts[82][5]-5, 8)
        --print(p1[5], trans_proj_verts[82][4]-3, trans_proj_verts[71][5]+5, 8)
    --]]
end

function render_all_objects()
    for i=#depth_buffer,0,-1 do
        for z=#depth_buffer[i],1,-1 do
            depth_buffer[i][z]:draw()
        end
    end
end

function order_objects()
    for i=#game_objects3d,1,-1 do
        local game_object = game_objects3d[i]
        game_object:transform()
        if(is_inside_cam_cone_z(game_object.d_z) and is_inside_cam_cone_x(game_object.d_x) and is_inside_cam_cone_y(game_object.y)) then game_object.is_visible=true add(depth_buffer[abs(game_object.d_z-mesh_downmost_z*TILE_SIZE)\TILE_SIZE - 1], game_object) else game_object.is_visible=false end  --add(to_draw, game_objects3d[i])
    end
end

function update_view()
    mov_tiles_x,mov_tiles_z=get_tileid(cam_target.x),get_tileid(cam_target.z)
    sub_mov_x,sub_mov_z=(cam_target.x/TILE_SIZE)%1,(cam_target.z/TILE_SIZE)%1 
    t_height_cam_target=get_height_id(mov_tiles_x,mov_tiles_z)
    mesh_leftmost_x,mesh_rightmost_x,mesh_downmost_z,mesh_upmost_z=mov_tiles_x-(mesh_numverts\2-1),mesh_numverts+mesh_leftmost_x-1,mov_tiles_z-(mesh_numverts\2-1),mesh_numverts+mesh_downmost_z-1
end
--

-- @TRANSFORM AND DRAW OBJECTS
function draw_object3d(object)
    for i=1, #object.t_verts do
        local vertex=object.t_verts[i]
        vertex[4],vertex[5] = project_point(vertex[1], vertex[2], vertex[3])
    end

    for i=1,#object.tris do
        local tri=object.tris[i]
        local color=tri[4]
        if((color&0xf0) > 0) fillp(0b1010010110100101) else fillp()

        local p1=object.t_verts[tri[1]]
        local p2=object.t_verts[tri[2]]
        local p3=object.t_verts[tri[3]]
        local p1z,p2z,p3z=p1[3],p2[3],p3[3]

		if p1z>Z_MAX or p2z>Z_MAX or p3z>Z_MAX then
            if p1z< Z_CLIP and p2z< Z_CLIP and p3z< Z_CLIP then
                local s1x,s1y = p1[4],p1[5]
                local s2x,s2y = p2[4],p2[5]
                local s3x,s3y = p3[4],p3[5]
				if max(s3x,max(s1x,s2x))>0 and min(s3x,min(s1x,s2x))<128  then
					if(((s1x-s2x)*(s3y-s2y)-(s1y-s2y)*(s3x-s2x)) < 0) trifill(s1x,s1y,s2x,s2y,s3x,s3y,color)
				end
            end
        end
    end
    fillp()
end

function transform_sprite3d(sprite3d)
    sprite3d.d_x, sprite3d.d_z = get_draw_x_z(sprite3d.x, sprite3d.z)
    local t_x,t_y,t_z=sprite3d.d_x-cam_x,sprite3d.y-cam_y,sprite3d.d_z-cam_z
    sprite3d.t_x,sprite3d.t_y,sprite3d.t_z=mat_rotate_cam_point(t_x, t_y, t_z)
end

function transform_object3d(object3d)
    object3d.d_x, object3d.d_z = get_draw_x_z(object3d.x, object3d.z)
    
    for i=1, #object3d.verts do
        local t_vertex=object3d.t_verts[i]
        local vertex=object3d.verts[i]

        if is_in_table(object3d.lock_verts, i) then
            t_vertex[1],t_vertex[2],t_vertex[3]=mat_rotate_point(vertex[1],vertex[2],vertex[3], 0,0,0)
        else   
            t_vertex[1],t_vertex[2],t_vertex[3]=mat_rotate_point(vertex[1],vertex[2],vertex[3], object3d.ax,object3d.ay,object3d.az)
        end

        t_vertex[1]+=object3d.d_x-cam_x
        t_vertex[2]+=object3d.y-cam_y
        t_vertex[3]+=object3d.d_z-cam_z
        
        t_vertex[1],t_vertex[2],t_vertex[3]=mat_rotate_cam_point(t_vertex[1],t_vertex[2],t_vertex[3])
    end
end
--

-- @UPDATE TERRAIN
function update_terrain()
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
            object:update_func()
            trunc_terrain(object)
        else
            deli(game_objects3d, i)
            if(object.shadow !=nil) object.shadow.remove = true
        end
    end
end
--

-- @HELPER FUNCTIONS
function gravity(object3d, bouncy, strength) 
    local current_height = get_height_pos(object3d.x, object3d.z)
    if object3d.y+object3d.vy>current_height then 
        object3d.y+=object3d.vy object3d.x+=object3d.vx object3d.z+=object3d.vz  object3d.vy-=strength*(gravities[gravity_idx])
    else 
        if (object3d.is_crash!=nil and object3d:is_crash()) return true 
        if bouncy then
            if abs(object3d.vy) < 0.1 then object3d.vy=0 object3d.vx=0 object3d.vz=0 object3d.y =current_height
            else object3d.vy = (-object3d.vy/4) end
        else
            object3d.vy=0 object3d.vx=0 object3d.vz=0 object3d.y=current_height
        end
    end   
end

function is_in_table(tbl, num)
    local exist=false
    for n in all(tbl) do
        if(n==num) exist=true
    end
    return exist
end
--

function create_sprite(x,y,z,vx,vy,vz,draw_func,update_func,start_func,life_span,no_shadow,disposable) 
    return _create_object3d(0,x,y,z,0,0,0,update_func,start_func,draw_func,vx,vy,vz,no_shadow,false,life_span, disposable)
end

function create_object3d(obj_id,x,y,z,ay,ax,az,update_func,start_func,vx,vy,vz,no_shadow,is_terrain) 
    return _create_object3d(obj_id,x,y,z,ay,ax,az,update_func,start_func,NOP,vx,vy,vz,no_shadow,is_terrain)
end

function _create_object3d(obj_id,x,y,z,ay,ax,az,update_func,start_func,draw_func,vx,vy,vz,no_shadow,is_terrain,life_span, disposable)
    local object3d = {
        obj_id=obj_id,
        x = x,
        y = y,
        z = z,
        ax = ax or 0,
        ay = ay or 0,
        az = az or 0,
        update_func=update_func or NOP,
        start_func=start_func or NOP,
        vy = vy or 0,
        vx = vx or 0,
        vz = vz or 0,
        life_span = life_span,
        disposable = disposable,
        verts = OBJS_DATA[obj_id][1],
        tris = OBJS_DATA[obj_id][2],
        t_x = 0,
        t_y = 0,
        t_z = 0,
        d_x = 0,
        d_z = 0,
        t_verts={},
        draw=draw_func or draw_object3d,
        no_shadow = no_shadow
    }
    
    is_terrain = is_terrain

    if obj_id==0  then
        object3d.transform=transform_sprite3d

        if disposable then
            if(disposables[disposables_index] != nil) disposables[disposables_index].remove=true 
            
            disposables[disposables_index] = object3d 
            disposables_index=(disposables_index+1)%disposables_size
        end

        if not object3d.no_shadow then
            object3d.shadow = create_sprite(
                object3d.x,get_height_pos(object3d.x, object3d.z),object3d.z,
                0,0,0,
                function(sprite_shadow) local sx,sy=project_point(sprite_shadow.t_x,sprite_shadow.t_y,sprite_shadow.t_z) circfill(sx, sy, 0, 0 ) end,
                function(sprite_shadow) sprite_shadow.x=object3d.x sprite_shadow.z=object3d.z+0.05 sprite_shadow.y=get_height_pos(object3d.x, object3d.z) if object3d.y <= sprite_shadow.y then sprite_shadow.remove=true end end,
                NOP, 
                life_span, true)
        end
    else
        object3d.transform=transform_object3d
        object3d.draw = draw_object3d   
        
        if not object3d.no_shadow then
            object3d.shadow = create_object3d(
                obj_id + 1, 
                0,0,0,
                0,0,0,
                function(shadow) 
                    shadow.x = object3d.x 
                    shadow.z = object3d.z 
                    shadow.y=get_height_pos(object3d.x, object3d.z) 
                    shadow.ay = object3d.ay 
                end,
                NOP,0,0,0,true
            )  
        end 
    end

    if is_terrain then
        add(envir,object3d)
        add(depth_buffer[abs(object3d.z-mesh_downmost_z*TILE_SIZE)\TILE_SIZE - 1], object3d)
    else
        add(game_objects3d, object3d)
    end

    for i=1,#object3d.verts do
        object3d.t_verts[i]={}
        for j=1,3 do
            object3d.t_verts[i][j] = 0
        end
    end

    object3d:start_func()
    object3d:transform()
    
    return object3d
end
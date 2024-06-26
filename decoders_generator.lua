local terrain_type, terrain_type_count, base_heights = split "50,35,85", 1, split "90,50,180"

function set_env_type_id(idx, idz, env_type)
    terrainmesh[idx][idz] = (terrainmesh[idx][idz]&0xc0ff.ffff) | env_type
end

function generate_terrain()
    infectable_areas = 0
    for y=0,TERRAIN_NUMVERTS-1 do
        cls()
        terrainmesh[y] = {}
        for x=0,TERRAIN_NUMVERTS-1 do
            terrainmesh[y][x] = 0
            local dx = 1
            local dy = 1
 
            local s = x / 240;
            local t = y / 240;
         
            local nx = cos(s) * dx;
            local ny = cos(t) * dy;
            local nz = sin(s) * dx;
            local nw = sin(t) * dy;

            local noise = 0

            local u = nx*cos(0.15) - ny*sin(0.35)
            local v = nx*cos(0.15) - ny*sin(0.15)

            noise =   abs(sin(nx/4 + sin(nz/15)))  * terrain_type[terrain_type_count] -- 50, 25,85
            noise +=  abs(sin(nw/4 + sin(nz/15)))  * 45
            noise +=  abs(sin(u/4 + sin(ny/30))) * 35
            noise +=  abs(sin(v/4 + sin(nz/30))) * terrain_type[terrain_type_count]  -- 50,25,85
            noise +=  abs(sin(v/4 + sin(nx/30))) * 35
            noise +=  abs(sin(v/4 + sin(nw/30))) * terrain_type[terrain_type_count]
            --noise +=  abs(sin(v/4 + sin(w/30))) * 40

            noise -= 145
            if(noise <= 0)  then
                noise = 0 
            else 
                infectable_areas += 0x0.0001
            end

            terrainmesh[y][x] |=  noise&0x00ff.ffff
        end
    end

    -- Generate objs
    for j=0,TERRAIN_NUMVERTS-1 do 
        for i=0, TERRAIN_NUMVERTS-1 do
            srand(i*j)
            if(flr(rnd(22)) == 1 and terrainmesh[i][j] > 4) set_env_type_id(i, j, 0x0100) 
            if(flr(rnd(44)) == 2 and terrainmesh[i][j] > 4) set_env_type_id(i, j, 0x0d00) 
            if(flr(rnd(400)) == 1 and terrainmesh[i][j] > 4) set_env_type_id(i, j, 0x2200) 
        end
    end
    

    -- base
    for j=0,8 do 
        for i=0, 8 do
           terrainmesh[i+114][j+114] = base_heights[terrain_type_count]
           infectable_areas -= 0x0.0001
           --print((0x8033&0x8000)>>15)
           --stop()
        end
    end

    -- generate radio towers
    for j=24,(TERRAIN_NUMVERTS-1)-24,48 do 
        for i=24,(TERRAIN_NUMVERTS-1)-24,48 do
           terrainmesh[i][j] |= 0x900
        end
    end
    
end

function decode_model(memloc)
    --verts
    local v_memloc = memloc + 1
    local size_v = peek(memloc)
    local size_f = peek(v_memloc+size_v)
    local f_memloc = v_memloc+size_v+1
    local x_memloc = f_memloc+ size_f

    local verts = {}
    for p=0, size_v-3, 3 do add(verts, {(peek(v_memloc+p) - peek(x_memloc)) *peek(x_memloc+3) , (peek(v_memloc+p+1) - peek(x_memloc+1)) *peek(x_memloc+3), (peek(v_memloc+p+2) - peek(x_memloc+2))*peek(x_memloc+3)}) end   
    
    local faces = {}
    for p=0, size_f-4, 4 do add(faces, {peek(f_memloc+p), peek(f_memloc+p+1), peek(f_memloc+p+2), peek(f_memloc+p+3)}) end 

    local xtra = {peek(x_memloc), peek(x_memloc+1), peek(x_memloc+2), peek(x_memloc+3)}
    
    return {verts,faces,xtra}
end


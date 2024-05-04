lasttime=time()
𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴=241
terrain_size=0
mesh_leftmost_x,mesh_rightmost_x,mesh_upmost_z,mesh_downmost_z=-33,33,1000,0
mesh_numfaces=12
mesh_numverts=mesh_numfaces+1
𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴=30
minimap_memory_start=128-ceil(𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴/8)*8
𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦=20
𝘬_𝘴𝘤𝘳𝘦𝘦𝘯_𝘴𝘤𝘢𝘭𝘦,𝘬_𝘹_𝘤𝘦𝘯𝘵𝘦𝘳,𝘬_𝘺_𝘤𝘦𝘯𝘵𝘦𝘳,𝘻_𝘤𝘭𝘪𝘱,𝘻_𝘮𝘢𝘹=80,63,63,-3,-300
cam_x,cam_y,cam_z,𝘤𝘢𝘮_𝘥𝘪𝘴𝘵_𝘵𝘦𝘳𝘳𝘢𝘪𝘯=0,0,0,125
cam_ax,cam_ay,cam_az=0,.5,0
cam_target,mov_tiles_x,mov_tiles_z,sub_mov_x,sub_mov_z,t_height_cam_target=nil,0,0,0,0,0
depth_buffer,game_objects3d,disposables,disposables_index,disposables_size={},{},{},0,50
sx,sy,sz,cx,cy,cz=sin(cam_ax),sin(cam_ay),sin(cam_az),cos(cam_ax),cos(cam_ay),cos(cam_az)
cam_mat00,cam_mat10,cam_mat20,cam_mat01,cam_mat11,cam_mat21,cam_mat02,cam_mat12,cam_mat22=cz*cy,-sz,cz*sy,cx*sz*cy+sx*sy,cx*cz,cx*sz*sy-sx*cy,sx*sz*cy-cx*sy,sx*cz,sx*sz*sy+cx*cy
𝘯𝘰𝘱=function()end
function clear_depth_buffer()
for i=0,mesh_numfaces-1do depth_buffer[i]={}end
end
clear_depth_buffer()
function init_terrain()
𝘩𝘦𝘪𝘨𝘩𝘵𝘮𝘶𝘭𝘵𝘪𝘱𝘭𝘪𝘦𝘳,terrainmesh=3,{}
generate_terrain()
terrain_numfaces=𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴-1
terrain_size=𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
sector_numfaces=terrain_numfaces/𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴
save_map_memory()
end
function trunc_terrain(object)
object.x%=terrain_size
object.z%=terrain_size
end
function get_tileid(pos)
return pos\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
end
function lerp(tar,pos,perc)
return(1-perc)*tar+perc*pos
end
function sub_vec(vec1,vec2)
return vec1.x-vec2.x,vec1.y-vec2.y,vec1.z-vec2.z
end
function get_height_pos(posx,posz)
return terrainmesh[posx%terrain_size\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦][posz%terrain_size\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦]&255.99999
end
function get_type_id(idx,idz)
return(terrainmesh[idx][idz]&16128)>>>8
end
function get_height_id(idx,idz)
return terrainmesh[idx][idz]&255.99999
end
function mat_rotate_cam_point(x,y,z)
return x*cam_mat00+y*cam_mat10+z*cam_mat20,x*cam_mat01+y*cam_mat11+z*cam_mat21,x*cam_mat02+y*cam_mat12+z*cam_mat22
end
function mat_rotate_point(x,y,z,ax,ay,az)
local x,y,z=x,y*cos(ax)+z*sin(ax),y*-sin(ax)+z*cos(ax)
x,y,z=x*cos(az)+y*sin(az),x*-sin(az)+y*cos(az),z
return x*cos(ay)+z*sin(ay),y,x*-sin(ay)+z*cos(ay)
end
function is_inside_cam_cone_x(posx)
return posx>mesh_leftmost_x*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦 and posx<mesh_rightmost_x*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
end
function is_inside_cam_cone_z(posz)
return posz>mesh_downmost_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦 and posz<mesh_upmost_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
end
function is_inside_cam_cone_y(posy)
return posy>cam_y-200and posy<cam_y+200
end
function get_draw_x_z(x,z)
local d_x=x
if(is_inside_cam_cone_x(x-terrain_size))d_x=x-terrain_size
if(is_inside_cam_cone_x(x+terrain_size))d_x=x+terrain_size
local d_z=z
if(is_inside_cam_cone_z(z-terrain_size))d_z=z-terrain_size
if(is_inside_cam_cone_z(z+terrain_size))d_z=z+terrain_size
return d_x,d_z
end
function trifill(x1,y1,x2,y2,x3,y3,color)
local color1,x1,x2,y1,y2,x3,y3,nsx,nex=color,band(x1,-1),band(x2,-1),band(y1,-1),band(y2,-1),band(x3,-1),band(y3,-1)
if y1>y2 then
y1,y2=y2,y1
x1,x2=x2,x1
end
if y1>y3 then
y1,y3=y3,y1
x1,x3=x3,x1
end
if y2>y3 then
y2,y3=y3,y2
x2,x3=x3,x2
end
if y1~=y2 then
local delta_sx,delta_ex=(x3-x1)/(y3-y1),(x2-x1)/(y2-y1)
if y1>0then
nsx=x1
nex=x1
min_y=y1
else
nsx=x1-delta_sx*y1
nex=x1-delta_ex*y1
min_y=0
end
max_y=min(y2,128)
for y=min_y,max_y-1do
rectfill(nsx,y,nex,y,color1)
nsx+=delta_sx
nex+=delta_ex
end
else
nsx=x1
nex=x2
end
if y3~=y2 then
local delta_sx,delta_ex=(x3-x1)/(y3-y1),(x3-x2)/(y3-y2)
min_y=y2
max_y=min(y3,128)
if y2<0then
nex=x2-delta_ex*y2
nsx=x1-delta_sx*y1
min_y=0
end
for y=min_y,max_y do
rectfill(nsx,y,nex,y,color1)
nex+=delta_ex
nsx+=delta_sx
end
else
rectfill(nsx,y3,nex,y3,color1)
end
end
function project_point(x,y,z)
return x*𝘬_𝘴𝘤𝘳𝘦𝘦𝘯_𝘴𝘤𝘢𝘭𝘦/z+𝘬_𝘹_𝘤𝘦𝘯𝘵𝘦𝘳,y*𝘬_𝘴𝘤𝘳𝘦𝘦𝘯_𝘴𝘤𝘢𝘭𝘦/z+𝘬_𝘹_𝘤𝘦𝘯𝘵𝘦𝘳
end
function save_map_memory()
local y_count,x_count,sector_slopes=0,0,{}
for y=𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴-sector_numfaces,0,-sector_numfaces do
sector_slopes[y_count]={}
for x=0,𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴-sector_numfaces,sector_numfaces do
local h,current_sect_height=2,get_height_id(x+sector_numfaces\2,y+sector_numfaces\2)
h=sector_slopes[y_count][(x_count-1)%𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴]and current_sect_height-sector_slopes[y_count][(x_count-1)%𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴]or current_sect_height
local color_p=1
color_p=h>=0and 3or 11
if(current_sect_height==0)color_p=1
sector_slopes[y_count][x_count]=current_sect_height
sset(minimap_memory_start+x_count,minimap_memory_start+y_count,color_p)
x_count+=1
end
x_count=0
y_count+=1
end
for j=0,1do
for i=0,1do
sset(minimap_memory_start+i+13,minimap_memory_start+j+14,7)
end
end
end
function render_minimap()
sspr(minimap_memory_start,minimap_memory_start,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴,0,0,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1)
pset(mov_tiles_x\sector_numfaces,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+-mov_tiles_z\sector_numfaces,7)
for i=1,#enemies do
local enemy=enemies[i]
enemy_tiles_x,enemy_tiles_z=get_tileid(enemy.x),get_tileid(enemy.z)
pset(enemy_tiles_x\sector_numfaces,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+-enemy_tiles_z\sector_numfaces,enemy.return_blip_color())
end
for j=24,𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴-1-24,48do
for i=24,𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴-1-24,48do
if get_type_id(i,j)==11then
rectfill((i-24)/48*6,abs((j-24)/48*6-𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴),(i-24)/48*6+5+1,abs((j-24)/48*6+5-𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1),0)
end
end
end
end
function render_terrain()
order_objects()
update_view()
rectfill(0,0,128,128,0)
if is_inside_cam_cone_y(terrainmesh[1][1]&255.99999)then
local trans_proj_verts={}
for v=mesh_numverts*mesh_numverts-1,0,-1do
local vert_x_id,vert_z_id=(v%mesh_numverts+mesh_leftmost_x)%𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴,(v\mesh_numverts+mesh_downmost_z)%𝘵𝘦𝘳𝘳𝘢𝘪𝘯_𝘯𝘶𝘮𝘷𝘦𝘳𝘵𝘴
local vert_world_x,vert_world_y,vert_world_z=v%mesh_numverts*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦+mesh_leftmost_x*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,get_height_id(vert_x_id,vert_z_id),v\mesh_numverts*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦+mesh_downmost_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
local vert_camera_x,vert_camera_y,vert_camera_z=vert_world_x-cam_x,vert_world_y-cam_y,vert_world_z-cam_z
if v%mesh_numverts==0then vert_camera_x+=sub_mov_x*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
elseif v%mesh_numverts==mesh_numfaces then vert_camera_x+=sub_mov_x*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦-𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
elseif v\mesh_numverts==0then vert_camera_z+=sub_mov_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦
elseif v\mesh_numverts==mesh_numfaces then vert_camera_z+=sub_mov_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦-𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦 end
local vert_camera_x,vert_camera_y,vert_camera_z=mat_rotate_cam_point(vert_camera_x,vert_camera_y,vert_camera_z)
local vert_proj_x,vert_proj_y=project_point(vert_camera_x,vert_camera_y,vert_camera_z)
local trans_proj_vert=add(trans_proj_verts,{vert_camera_x,vert_camera_y,vert_world_z,vert_proj_x,vert_proj_y,vert_x_id,vert_z_id})
if v%mesh_numverts~=0and v%mesh_numverts<mesh_numverts-1and v\mesh_numverts~=0then
local type_object3d=get_type_id(vert_x_id,vert_z_id)
srand(vert_x_id*vert_z_id)
if(type_object3d>0)create_object3d(get_type_id(vert_x_id,vert_z_id),vert_world_x,vert_world_y,vert_world_z,nil,nil,nil,nil,𝘦𝘯𝘷_𝘧𝘶𝘯𝘤[type_object3d],nil,nil,nil,true,true)
end
end
for v=1,#trans_proj_verts do
if v%mesh_numverts~=0and v>mesh_numverts-1then
local p1,p2,p3,p4=trans_proj_verts[v+1],trans_proj_verts[v-mesh_numverts+1],trans_proj_verts[v],trans_proj_verts[v-mesh_numverts]
local s1x,s1y,s2x,s2y,s3x,s3y,s4x,s4y,color=p1[4],p1[5],p2[4],p2[5],p3[4],p3[5],p4[4],p4[5],get_color_id(p1[6],p1[7],true)
if((s1x-s2x)*(s4y-s2y)-(s1y-s2y)*(s4x-s2x)<0)trifill(s1x,s1y,s2x,s2y,s4x,s4y,color)
if((s4x-s3x)*(s1y-s3y)-(s4y-s3y)*(s1x-s3x)<0)trifill(s4x,s4y,s3x,s3y,s1x,s1y,color)
fillp()
else
if v%mesh_numverts==0then
local a=abs((v-(mesh_numfaces+1))\mesh_numverts-(mesh_numfaces+1))
if a<mesh_numfaces then
for z=#depth_buffer[a],1,-1do
depth_buffer[a][z]:draw()
end
end
end
end
end
else
render_all_objects()
end
clear_depth_buffer()
end
function render_all_objects()
for i=#depth_buffer,0,-1do
for z=#depth_buffer[i],1,-1do
depth_buffer[i][z]:draw()
end
end
end
function order_objects()
for i=#game_objects3d,1,-1do
local game_object=game_objects3d[i]
game_object:transform()
if is_inside_cam_cone_z(game_object.d_z)and is_inside_cam_cone_x(game_object.d_x)and is_inside_cam_cone_y(game_object.y)then game_object.is_visible=true add(depth_buffer[abs(game_object.d_z-mesh_downmost_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦)\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦],game_object)else game_object.is_visible=false end
end
end
function update_view()
mov_tiles_x,mov_tiles_z=get_tileid(cam_target.x),get_tileid(cam_target.z)
sub_mov_x,sub_mov_z=cam_target.x/𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦%1,cam_target.z/𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦%1
t_height_cam_target=get_height_id(mov_tiles_x,mov_tiles_z)
mesh_leftmost_x,mesh_rightmost_x,mesh_downmost_z,mesh_upmost_z=mov_tiles_x-(mesh_numverts\2-1),mesh_numverts+mesh_leftmost_x-1,mov_tiles_z-(mesh_numverts\2-1),mesh_numverts+mesh_downmost_z-1
end
function draw_object3d(object)
for i=1,#object.t_verts do
local vertex=object.t_verts[i]
vertex[4],vertex[5]=project_point(vertex[1],vertex[2],vertex[3])
end
for i=1,#object.tris do
local tri=object.tris[i]
local color=tri[4]
if(color&240>0)fillp(42405)else fillp()
local p1,p2,p3=object.t_verts[tri[1]],object.t_verts[tri[2]],object.t_verts[tri[3]]
local p1z,p2z,p3z=p1[3],p2[3],p3[3]
if p1z>𝘻_𝘮𝘢𝘹 or p2z>𝘻_𝘮𝘢𝘹 or p3z>𝘻_𝘮𝘢𝘹 then
if p1z<𝘻_𝘤𝘭𝘪𝘱 and p2z<𝘻_𝘤𝘭𝘪𝘱 and p3z<𝘻_𝘤𝘭𝘪𝘱 then
local s1x,s1y,s2x,s2y,s3x,s3y=p1[4],p1[5],p2[4],p2[5],p3[4],p3[5]
if max(s3x,max(s1x,s2x))>0and min(s3x,min(s1x,s2x))<128then
if((s1x-s2x)*(s3y-s2y)-(s1y-s2y)*(s3x-s2x)<0)trifill(s1x,s1y,s2x,s2y,s3x,s3y,color)
end
end
end
end
fillp()
end
function transform_sprite3d(sprite3d)
sprite3d.d_x,sprite3d.d_z=get_draw_x_z(sprite3d.x,sprite3d.z)
local t_x,t_y,t_z=sprite3d.d_x-cam_x,sprite3d.y-cam_y,sprite3d.d_z-cam_z
sprite3d.t_x,sprite3d.t_y,sprite3d.t_z=mat_rotate_cam_point(t_x,t_y,t_z)
end
function transform_object3d(object3d,vert_list)
object3d.d_x,object3d.d_z=get_draw_x_z(object3d.x,object3d.z)
for i=1,#object3d.verts do
local t_vertex,vertex=object3d.t_verts[i],object3d.verts[i]
if is_in_table(object3d.lock_verts,i)then
t_vertex[1],t_vertex[2],t_vertex[3]=mat_rotate_point(vertex[1],vertex[2],vertex[3],0,0,0)
else
t_vertex[1],t_vertex[2],t_vertex[3]=mat_rotate_point(vertex[1],vertex[2],vertex[3],object3d.ax,object3d.ay,object3d.az)
end
t_vertex[1]+=object3d.d_x-cam_x
t_vertex[2]+=object3d.y-cam_y
t_vertex[3]+=object3d.d_z-cam_z
t_vertex[1],t_vertex[2],t_vertex[3]=mat_rotate_cam_point(t_vertex[1],t_vertex[2],t_vertex[3])
end
end
function update_terrain()
for i=#game_objects3d,1,-1do
local object,deleted=game_objects3d[i],false
if object.life_span~=nil then
object.life_span-=time()-lasttime
if(object.life_span<0)deleted=true
end
if object.remove~=nil then
if object.remove then
deleted=true
end
end
if not deleted then
object:update_func()
trunc_terrain(object)
else
deli(game_objects3d,i)
if(object.shadow~=nil)object.shadow.remove=true
end
end
end
function gravity(object3d,bouncy,strength)
local current_height=get_height_pos(object3d.x,object3d.z)
if object3d.y+object3d.vy>current_height then
object3d.y+=object3d.vy object3d.x+=object3d.vx object3d.z+=object3d.vz object3d.vy-=strength*gravities[gravity_idx]
else
if(object3d.is_crash~=nil and object3d:is_crash())return true
if bouncy then
if abs(object3d.vy)<.1then object3d.vy=0object3d.vx=0object3d.vz=0object3d.y=current_height
else object3d.vy=-object3d.vy/4end
else
object3d.vy=0object3d.vx=0object3d.vz=0object3d.y=current_height
end
end
end
function is_in_table(tbl,num)
local exist=false
for n in all(tbl)do
if(n==num)exist=true
end
return exist
end
function create_sprite(x,y,z,vx,vy,vz,draw_func,update_func,start_func,life_span,no_shadow,disposable)
return _create_object3d(0,x,y,z,0,0,0,update_func,start_func,draw_func,vx,vy,vz,no_shadow,false,life_span,disposable)
end
function create_object3d(obj_id,x,y,z,ay,ax,az,update_func,start_func,vx,vy,vz,no_shadow,is_terrain)
return _create_object3d(obj_id,x,y,z,ay,ax,az,update_func,start_func,𝘯𝘰𝘱,vx,vy,vz,no_shadow,is_terrain)
end
function _create_object3d(obj_id,x,y,z,ay,ax,az,update_func,start_func,draw_func,vx,vy,vz,no_shadow,is_terrain,life_span,disposable)
local object3d={
obj_id=obj_id,
x=x,
y=y,
z=z,
ax=ax or 0,
ay=ay or 0,
az=az or 0,
update_func=update_func or 𝘯𝘰𝘱,
start_func=start_func or 𝘯𝘰𝘱,
vy=vy or 0,
vx=vx or 0,
vz=vz or 0,
life_span=life_span,
disposable=disposable,
verts=𝘰𝘣𝘫𝘴_𝘥𝘢𝘵𝘢[obj_id][1],
tris=𝘰𝘣𝘫𝘴_𝘥𝘢𝘵𝘢[obj_id][2],
t_x=0,
t_y=0,
t_z=0,
d_x=0,
d_z=0,
t_verts={},
draw=draw_func or draw_object3d,
no_shadow=no_shadow
}
is_terrain=is_terrain
if obj_id==0then
object3d.transform=transform_sprite3d
if disposable then
if(disposables[disposables_index]~=nil)disposables[disposables_index].remove=true
disposables[disposables_index]=object3d
disposables_index=(disposables_index+1)%disposables_size
end
if not object3d.no_shadow then
object3d.shadow=create_sprite(
object3d.x,get_height_pos(object3d.x,object3d.z),object3d.z,
0,0,0,
function(sprite_shadow)local sx,sy=project_point(sprite_shadow.t_x,sprite_shadow.t_y,sprite_shadow.t_z)circfill(sx,sy,0,0)end,
function(sprite_shadow)sprite_shadow.x=object3d.x sprite_shadow.z=object3d.z+.05sprite_shadow.y=get_height_pos(object3d.x,object3d.z)if object3d.y<=sprite_shadow.y then sprite_shadow.remove=true end end,
𝘯𝘰𝘱,
life_span,true)
end
else
object3d.transform=transform_object3d
object3d.draw=draw_object3d
if not object3d.no_shadow then
object3d.shadow=create_object3d(
obj_id+1,
0,0,0,
0,0,0,
function(shadow)
shadow.x=object3d.x
shadow.z=object3d.z
shadow.y=get_height_pos(object3d.x,object3d.z)
shadow.ay=object3d.ay
end,
𝘯𝘰𝘱,0,0,0,true
)
end
end
if is_terrain then
add(envir,object3d)
add(depth_buffer[abs(object3d.z-mesh_downmost_z*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦)\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦],object3d)
else
add(game_objects3d,object3d)
end
for i=1,#object3d.verts do
object3d.t_verts[i]={}
for j=1,3do
object3d.t_verts[i][j]=0
end
end
object3d:start_func()
object3d:transform()
return object3d
end
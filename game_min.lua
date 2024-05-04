orig_srand=peek(24388)
test_ay,test_ax,player,enemies,envir=0,0,{},{},{}
wave,fivek_counter,score,bonus_score,fuel,best,lives,missiles=1,1,0,0,100,0,3,3
shooting_cooldown,time_last_shot,shoot_btn_last,shoot_btn_current=time(),time(),false,false
wave_completed_timer,damaged_counter,damaged=0,0,false
infectable_areas,infected_area=0,0
rnd_dirt,rnd_cement,colors_explosion=split"11,4,15,10",split"6,7",split"2,4,10,3,5"
spawn_funcs,waves={},{}
gravities,gravity_idx=split"1, 1.5, 2",1
𝘰𝘣𝘫𝘴_𝘥𝘢𝘵𝘢={[0]={{{0,0,0}},{}}}
for i=1419,1472,2do
add(𝘰𝘣𝘫𝘴_𝘥𝘢𝘵𝘢,decode_model(%i))
end
𝘦𝘯𝘷_𝘧𝘶𝘯𝘤={
[8]=function(object)
if(time()%3==0)create_sprite(object.x+rnd"10"-4,object.y+10+rnd"8",object.z+rnd"10"-4,0,0,0,function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,5)end,function(sprite)sprite.y+=rnd"0.4"sprite.x+=rnd"0.4"-.2sprite.z+=rnd"0.4"-.2end,𝘯𝘰𝘱,4,false,true)
end
,
[9]=function(object)
object.lock_verts=split"1,2,3,4"
object.ay=time()
create_object3d(10,object.x,object.y,object.z,object.ay,nil,nil,nil,nil,nil,nil,nil,true,true)
end,
[12]=function(object)
srand(object.x*object.z)
local x=(rnd"10"+time())%(2+rnd"10")
object.y=(-5*x^2+5*x)*20
if(x>=1)object.y=-10
object.x+=time()%10*(rnd"500"-250)
if object.y<=0then
if(time()%1==0)srand(time())local color=12-flr(rnd"2")*5create_sprite(object.x,1,object.z,rnd"2"-1,rnd"2",rnd"2"-1,function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,color)end,function(sprite)gravity(sprite,true,.1)end,𝘯𝘰𝘱,1)
end
reset_srand()
end
}
pal(1,140,1)
pal(13,134,1)
pal(15,138,1)
pal(2,131,1)
function reset_srand()poke(24388,orig_srand)end
function v_len(obj1,obj2,y_not_zeroed)
local x,y,z=obj1.x-obj2.x,0,obj1.z-obj2.z
if(y_not_zeroed)y=obj1.y-obj2.y
local ax=atan2(x,y)
local d2=x*cos(ax)+y*sin(ax)
local az=atan2(d2,z)
return d2*cos(az)+z*sin(az)
end
function game_init()
init_terrain()
main_update_draw=draw_update
main_update=logic_update
reset_player()
waves[1]()
end
function get_color_id(idx,idz,flip)
local height,virus_level=get_height_id(idx,idz),get_virus_level_id(idx,idz)
srand(idz*idx)
local diversity,color=(idx%4+idz%4+flr((rnd"6")))%4+1,1
if(height>0)color=10
if(height>15)color=rnd_dirt[diversity]
if(height==base_heights[terrain_type_count])color=rnd_cement[(idx%2+idz%2+flr((rnd"2")))%2+1]
if virus_level>=1then
fillp(42405)
local rdmn_light_green=split"0x46, 0x44, 0x66"
if(color==11)color=rdmn_light_green[flr(rnd"3")+1]
if(color==4)color=136
local rdmn_dark_green=split"0x44,0x66,0x88"
if(color==15)color=rdmn_dark_green[flr(rnd"3")+1]
if(color==10)color=138
else
fillp()
end
reset_srand()
return color
end
function get_virus_level_id(idx,idz)
return(terrainmesh[idx][idz]&49152)>>>14
end
function add_virus_level_pos(posx,posz)
local posx,posz=posx%terrain_size,posz%terrain_size
local idx,idz,height=posx\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,posz\𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,get_height_pos(posx,posz)
local virus_level=get_virus_level_id(idx,idz)
if virus_level==0and height>0and height~=68then
terrainmesh[idx][idz]+=16384
sset(minimap_memory_start+posx\(sector_numfaces*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦),minimap_memory_start+𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴-posz\(sector_numfaces*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦),4)
local env_type=get_type_id(idx,idz)
if(env_type==1)terrainmesh[idx][idz]=terrainmesh[idx][idz]&~16128|3840
if(env_type==13)terrainmesh[idx][idz]=terrainmesh[idx][idz]&~16128|4608
infected_area+=.00002
end
end
function damage_player()
explode(player)
damaged=true
lives-=1
damaged_counter=time()
end
function destroy(object)
object.remove=true if(object.shadow~=nil)object.shadow.remove=true
end
function wave_completed_draw()
print("𝘢ttack 𝘸ave  "..wave.." completed",18,60,7)
print("𝘢rea infected  . . .     "..tostr(infected_area,2),7,80,7)
print("𝘢rea uninfected  . . .   "..tostr(infectable_areas,2),7,90,7)
print("𝘣onus uninfected area .  "..tostr(bonus_score,2),7,105,7)
end
function wave_completed_update()
if(time()-wave_completed_timer>5)main_update_draw=draw_update main_update=logic_update game_objects3d={}wave+=1destroy(player)reset_player()waves[wave%(#waves+1)]()
end
function check_wave_end()
if(#enemies==0)bonus_score=max(0,(infectable_areas-infected_area-infected_area)/max(32/wave,4))score+=bonus_score dset(0,max(dget(i),score))main_update_draw=wave_completed_draw main_update=wave_completed_update wave_completed_timer=time()
end
function explode(object,idx_enemy)
local h=get_height_pos(object.x,object.z)
sfx(3,3)
for i=0,7do
srand(i)
create_sprite(
object.x+rnd"10"-4,object.y+10+rnd"8",object.z+rnd"10"-4,
0,0,0,
function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)for z=0,5do srand(z*i)circfill(sx+rnd"5"-4,sy+rnd"5"-4,0,5)end end,
function(sprite)sprite.y+=rnd"0.4"sprite.x+=rnd"0.4"-.2sprite.z+=rnd"0.4"-.2end,
𝘯𝘰𝘱,
4,
false,
true
)
end
for i=0,15do
srand(i)
local color=colors_explosion[flr(rnd"5")+1]
if(h==0and object.y<=1)color=12-flr(rnd"2")*5
create_sprite(object.x,object.y,object.z+5,
rnd"2"-1,rnd"4"+2,rnd"2"-1,
function(sprite)
local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)
circfill(sx,sy,0,color)
end,
function(sprite)gravity(sprite,true,.2)end,
𝘯𝘰𝘱,
10,
false,
true
)
end
reset_srand()
destroy(object)
deli(enemies,idx_enemy)
check_wave_end()
end
function play_audio_vicinity(emitter,n,channel)
if(emitter.is_visible)sfx(n,channel)
end
function smoke(object)
srand(object.x)
if(time()%0x.08==0)create_sprite(object.x+rnd"16"-8,object.y+rnd"16"-8,object.z+5,0,0,0,function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,5)end,𝘯𝘰𝘱,𝘯𝘰𝘱,3)
end
function thrust(ship,intensity,is_player)
local is_player,intensity=is_player or false,intensity or.2
if fuel>0and is_player or not is_player then
if(fuel>0and is_player)fuel-=.05
ship.vy+=intensity*cos(ship.ax)*cos(ship.az)
ship.vx+=intensity*sin(ship.ay)*-sin(ship.ax)
ship.vz+=intensity*-cos(ship.ay)*sin(ship.ax)
local dy,dx,dz=cos(ship.ax)*cos(ship.az),sin(ship.ay)*-sin(ship.ax),-cos(ship.ay)*sin(ship.ax)
play_audio_vicinity(ship,0,1)
if ship.is_visible then
srand(time())
for i=0,1do
srand(i*time())
local thrust_part=create_sprite(
ship.x+rnd"8"-4,ship.y+rnd"8"-4,ship.z+rnd"8"+4+20,
-dx*4+rnd"2"-1+ship.vx,-dy*4+ship.vy+rnd"2"-1,-dz*4+rnd"2"-1+ship.vz,
function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)local color=7+rnd"1"*3if(sprite.life_span<.2)color=8
circfill(sx,sy,0,color)end,
function(sprite)gravity(sprite,true,.1)end,
function(sprite)sprite.y=ship.y+.001end,
.4
)
end
reset_srand()
end
end
end
function shoot(ship)
local is_inverted,dy,dx,dz=is_inverted or false,sin(ship.ax),sin(ship.ay)*cos(ship.ax),cos(ship.ay)*cos(ship.ax)
play_audio_vicinity(ship,1,2)
local projectile=create_sprite(
ship.x,ship.y,ship.z,10
*-dx+ship.vx,10*-dy+ship.vy,10*-dz+ship.vz,
function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,7)end,
function(sprite)
gravity(sprite,false,0)
if(collide_enemies(sprite,ship))sprite.life_span=-1
collide_env(sprite)
end,
𝘯𝘰𝘱,
1
)
projectile.is_crash=function(sprite)
play_audio_vicinity(sprite,2,1)
sprite.remove=true
local h=get_height_pos(sprite.x,sprite.z)
for i=0,5do
srand(i*time())
local color=12-flr(rnd"2")*5
if(h>0)color=colors_explosion[flr(rnd"5")+1]
create_sprite(
sprite.x,sprite.y,sprite.z,
rnd"2"-1,rnd"2",rnd"2"-1,
function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,color)end,
function(sprite)gravity(sprite,true,.1)end,
𝘯𝘰𝘱,
1,
false,
true
)
end
reset_srand()
end
end
function attack_player(object3d,current_height,x_z_distance_to_player)
local x_z_distance_to_player=x_z_distance_to_player or v_len(player,object3d)
gravity(object3d,false,.05)
local destination_angle_y,destination_angle_x=-atan2(player.x-object3d.x,player.z-object3d.z),-atan2(x_z_distance_to_player,player.y-object3d.y)
if x_z_distance_to_player>100then
thrust(object3d,.4)
if(object3d.y-player.y<20or current_height<40)destination_angle_x=-.15else destination_angle_x=-.25
else
if(object3d.y-player.y<3)thrust(object3d,.2)destination_angle_x=0
if(time()-object3d.shooting_cooldown>object3d.shooting_interval)shoot(object3d)object3d.shooting_cooldown=time()
end
object3d.ay+=(destination_angle_y+.25-object3d.ay)*.3
object3d.ax+=(destination_angle_x-object3d.ax)*.5
end
add(spawn_funcs,function(x,y,z)
local landing_gears={}
for i=0,3do
landing_gears[i]=create_sprite(
x,y,z,
0,0,0
)
end
local new_seeder=create_object3d(4,x,y,z,0,0,0,
function(object3d)
local current_height=get_height_pos(object3d.x,object3d.z)
object3d.ay+=.01
if object3d.landed then
if(object3d.y-1>current_height+20)object3d.y-=1
if(object3d.seed_count>30)for i=0,3do object3d.landing_gears[i].draw=𝘯𝘰𝘱 end object3d.landed=false object3d.dir={rnd"2"-1,rnd"2"-1}
else
play_audio_vicinity(object3d,4,-1)
if(abs(current_height+50-object3d.y)>1)object3d.y+=sgn(current_height+50-object3d.y)*.5
object3d.z+=object3d.dir[1]
object3d.x+=object3d.dir[2]
if time()%30==0then
if(current_height>20)object3d.landed=true object3d.seed_count=0for i=0,3do object3d.landing_gears[i].draw=function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)line(sx,sy,sx+sgn(i-2)*3,sy+5,10)end end
end
end
if current_height>0then
if time()%.5==0then
object3d.seed_count+=1
if(object3d.is_visible)for i=0,7do srand(i*time())local virus=create_sprite(object3d.x,object3d.y,object3d.z,rnd"4"-2,rnd"4",rnd"4"-2,function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,8)end,function(sprite)gravity(sprite,true,.1)end,𝘯𝘰𝘱,10)virus.is_crash=function(sprite)sprite.remove=true add_virus_level_pos(sprite.x,sprite.z)end end else for i=0,7do srand(i*time())add_virus_level_pos(object3d.x+(rnd"14"-7)*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,object3d.z+(rnd"14"-7)*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦)end
end
end
reset_srand()
end,
function(object3d)
object3d.return_blip_color=function()return 12end
object3d.return_death_score=function()for i=0,3do destroy(object3d.landing_gears[i])end if(object3d.landed)return 50
return 100end
object3d.landing_gears=landing_gears
for i=0,3do
object3d.landing_gears[i].update_func=function(sprite)sprite.x=object3d.x+sgn(i-2)*10sprite.y=object3d.y-8sprite.z=object3d.z+(i%2-1)*10end
end
object3d.landed=false object3d.seed_count=0object3d.dir={rnd"2"-1,rnd"2"-1}
end)
add(enemies,new_seeder)
end)
add(spawn_funcs,function(x,y,z)
local new_drone=create_object3d(6,x,y,z,.25,0,0,
function(object3d)
local current_height=get_height_pos(object3d.x%terrain_size,object3d.z%terrain_size)
srand(time())
local x_z_distance_to_player=v_len(player,object3d)
if x_z_distance_to_player<600or object3d.is_mutated then
play_audio_vicinity(object3d,4,-1)
attack_player(object3d,current_height,x_z_distance_to_player)
else
if time()-object3d.shooting_cooldown>.7then
local posx,posz=object3d.x%terrain_size,object3d.z%terrain_size
local v_level=sget(minimap_memory_start+posx\(sector_numfaces*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦),minimap_memory_start+𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴-posz\(sector_numfaces*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦))
if v_level==4then
if(flr(rnd"10")==1)object3d.tris=𝘰𝘣𝘫𝘴_𝘥𝘢𝘵𝘢[16][2]shooting_interval=.14object3d.is_mutated=true
end
end
object3d.ay+=(object3d.dir-object3d.ay)*.02+rnd"0.01"-.02
object3d.x-=sin(object3d.ay)*3
object3d.z-=cos(object3d.ay)*3
if(time()%10==0)object3d.dir=rnd"1"
end
reset_srand()
clamp_speed(object3d,4)
end,
function(object3d)
object3d.is_mutated=false
object3d.shooting_interval=.7
object3d.return_death_score=function()if(object3d.is_mutated)return 500else return 300end
object3d.return_blip_color=function()if(object3d.is_mutated)if(time()%.5==0)return 8else return 9else return 9end
object3d.shooting_cooldown=time()
object3d.dir=rnd"1"
end
)
add(enemies,new_drone)
new_drone.is_crash=function(object3d)
explode(new_drone,#enemies)
end
end)
add(spawn_funcs,function(x,y,z)
local new_bomber=create_object3d(19,x,y,z,.25,0,0,
function(object3d)
play_audio_vicinity(object3d,4,-1)
local current_height=get_height_pos(object3d.x,object3d.z)
object3d.ay+=(object3d.dir-object3d.ay)*.02
object3d.y=current_height+100
object3d.x-=sin(object3d.ay)*3
object3d.z-=cos(object3d.ay)*3
if(time()%1==0)local bomb=create_sprite(object3d.x,object3d.y,object3d.z,0,0,0,function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)spr(67,sx,sy)end,function(sprite)gravity(sprite,true,.2)end)bomb.is_crash=function(sprite)sprite.remove=true for i=-3,3do for j=-3,3do local dx,dz=i*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,j*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦 add_virus_level_pos(bomb.x+dx,bomb.z+dz)end end end
end,
function(object3d)
object3d.return_death_score=function()return 800end
object3d.return_blip_color=function()if(time()%.5<.25)return 12else return 0end
object3d.dir=rnd"1"
end
)
add(enemies,new_bomber)
new_bomber.is_crash=function(object3d)
explode(new_bomber,#enemies)
end
end)
add(spawn_funcs,function(x,y,z)
local new_fighter=create_object3d(21,x,y,z,.25,0,0,
function(object3d)
play_audio_vicinity(object3d,4,-1)
local current_height=object3d.y-get_height_pos(object3d.x,object3d.z)
test_var=current_height
attack_player(object3d,current_height)
clamp_speed(object3d,4)
end,
function(object3d)
object3d.shooting_interval=.3
object3d.hit_points=2
object3d.return_death_score=function()if(object3d.hit_points==0)return 700else object3d.tris=𝘰𝘣𝘫𝘴_𝘥𝘢𝘵𝘢[23][2]object3d.shooting_interval=.6return 200end
object3d.return_blip_color=function()if(time()%.5<.25)return 10else return 0end
object3d.shooting_cooldown=time()
object3d.dir=rnd"1"
end
)
add(enemies,new_fighter)
new_fighter.is_crash=function(object3d)
explode(object3d,#enemies)
end
end)
add(spawn_funcs,function(x,y,z)
local new_pest=create_object3d(26,x,y,z,.25,0,0,
function(object3d)
gravity(object3d,false,0)
play_audio_vicinity(object3d,4,-1)
object3d.ay+=.03
object3d.ax+=.03
object3d.vx+=(player.x-object3d.x)/v_len(player,object3d)*.06
object3d.vy+=(player.y-object3d.y)/v_len(player,object3d)*.06
object3d.vz+=(player.z-object3d.z)/v_len(player,object3d)*.06
clamp_speed(object3d,4)
smoke(object3d)
end,
function(object3d)
object3d.return_death_score=function()return 400end
object3d.return_blip_color=function()return 14end
end
)
add(enemies,new_pest)
new_pest.is_crash=function(object3d)
explode(new_pest,#enemies)
end
end)
add(spawn_funcs,function(x,y,z)
local new_attractor=create_object3d(4,x,y,z,0,0,0,
function(object3d)
play_audio_vicinity(object3d,4,-1)
local current_height=get_height_pos(object3d.x,object3d.z)
object3d.y=current_height+100
object3d.ay+=.01
object3d.z+=object3d.dir[1]
object3d.x+=object3d.dir[2]
object3d.bean.x,object3d.bean.y,object3d.bean.z=object3d.x,object3d.y,object3d.z
end,
function(object3d)
object3d.return_blip_color=function()if(time()%.5<.25)return 8else return 0end
object3d.hit_points=5
object3d.bean=create_sprite(0,0,0,0,0,0,
function(sprite)
local x_z_distance_to_player=v_len(sprite,player,true)
if(x_z_distance_to_player<100)local sx1,sy1=project_point(sprite.t_x,sprite.t_y,sprite.t_z)local sx3,sy3=project_point(player.t_verts[1][1],player.t_verts[1][2],player.t_verts[1][3])srand(time()%2)local sx2,sy2=(sx1+sx3)/2+rnd(16)-8,(sy1+sy3)/2line(sx1,sy1,sx2,sy2,7)line(sx2,sy2,sx3,sy3)local dx,dy=sprite.x-player.x,sprite.y-player.y local distance=sqrt(dx*dx+dy*dy)local force=1/distance*.2player.vx+=force*dx player.vy+=force*dy
end
)
object3d.return_death_score=function()if(object3d.hit_points==0)object3d.bean.remove=true return 500else return 0end
object3d.dir={rnd"2"-1,rnd"2"-1}
end)
add(enemies,new_attractor)
end)
for i=1473,1507,7do
local counts_lvl={}
for z=0,7do
counts_lvl[z+1]=@(i+z)
end
add(waves,
function()
srand"7"
for z=1,6do
for amount=1,counts_lvl[z]do
spawn_funcs[z](flr(rnd(terrain_size)),100,flr(rnd(terrain_size)))
end
end
end
)
end
function collide_enemies(object,emitter,damage)
damage=damage or 1
emitter=emitter or object
local all_ships=enemies
all_ships[0]=player
for i=#all_ships,0,-1do
if all_ships[i].y~=emitter.y and all_ships[i].x~=emitter.x then
if v_len(object,all_ships[i],true)<20then
if i>0then
if(enemies[i].hit_points)enemies[i].hit_points-=damage
death_score=enemies[i].return_death_score()
add_score(death_score>>16)
create_sprite(enemies[i].x,enemies[i].y,enemies[i].z,
0,0,0,
function(object)local sx,sy=project_point(object.t_x,object.t_y,object.t_z)print(death_score,sx,sy,7)end,
function(object)object.y+=.1end,
𝘯𝘰𝘱,
5,
false,
true
)
if(not enemies[i].hit_points or enemies[i].hit_points<=0)explode(enemies[i],i)
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
for i=#envir,1,-1do
if sqrt(abs(object.d_x-envir[i].d_x)+abs(object.y-envir[i].y)+abs(object.d_z-envir[i].d_z))<5then
envir[i].vx=object.vx envir[i].vz=object.vz envir[i].vy=object.vy
local idx,idz=get_tileid(envir[i].d_x%terrain_size),get_tileid(envir[i].d_z%terrain_size)
local env_type=get_type_id(idx,idz)
if env_type==1or env_type==15then
explode(envir[i])terrainmesh[idx][idz]=terrainmesh[idx][idz]&~16128|2048
if(env_type==15)add_score(.00062)create_sprite(object.x,object.y,object.z,0,0,0,function(object)local sx,sy=project_point(object.t_x,object.t_y,object.t_z)print(40,sx,sy,7)end,function(object)object.y+=.1end,𝘯𝘰𝘱,5,false,true)
end
if(env_type==6)add_score(.00062)explode(envir[i])terrainmesh[idx][idz]=terrainmesh[idx][idz]&~16128|2048
if(env_type==9)explode(envir[i])terrainmesh[idx][idz]=terrainmesh[idx][idz]&~16128|2816
if(env_type==13)explode(envir[i])terrainmesh[idx][idz]=terrainmesh[idx][idz]&~16128|3584
return true
end
end
return false
end
function add_score(amount)
score+=amount
if(score>fivek_counter*.0763)fivek_counter+=1lives+=1missiles+=1
end
function reset_player()
player=create_object3d(2,118*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,0,118.5*𝘵𝘪𝘭𝘦_𝘴𝘪𝘻𝘦,.25,0,0,
function(object3d)
gravity(object3d,false,.12)
if(collide_enemies(object3d))damage_player()
if(collide_env(object3d))damage_player()
if object3d.y>t_height_cam_target then
if(btn"0")object3d.ay+=.03
if(btn"1")object3d.ay-=.03
if btn"2"then if(abs(object3d.ax-.02)<.2)object3d.ax-=.02
end
if btn"3"then if(abs(object3d.ax+.02)<.2)object3d.ax+=.02
end
if time()%.00002==0then
if(object3d.y>200)srand(time())create_sprite(object3d.x+rnd"200"-100,object3d.y+rnd"200"-50,object3d.z+rnd"200"-100,0,0,0,function(sprite)local sx,sy=project_point(sprite.t_x,sprite.t_y,sprite.t_z)circfill(sx,sy,0,7)end,𝘯𝘰𝘱,𝘯𝘰𝘱,3,true,true)
end
else
if(t_height_cam_target==base_heights[terrain_type_count])fuel=100
end
if object3d.y<1200then
if(btn"4")thrust(object3d,.5,true)
end
clamp_speed(object3d,8)
poke(24413,5)
if btn"5"then
if(time()-shooting_cooldown>.1)shoot(object3d)add_score(~0)shooting_cooldown=time()
if not shoot_btn_last then
if time()-time_last_shot<.2then
missiles-=1
if missiles>=0then
local new_missile=create_object3d(
24,
object3d.x,object3d.y,object3d.z,
object3d.ay,object3d.ax,0,
function(missile3d)
gravity(missile3d,false,0)
local x_z_distance_to_target,destination_angle_y=v_len(missile3d,missile3d.target),-atan2(missile3d.d_x-missile3d.target.d_x,missile3d.d_z-missile3d.target.d_z)
missile3d.ay+=destination_angle_y-.25-missile3d.ay
local destination_angle_x=atan2(x_z_distance_to_target,missile3d.y-missile3d.target.y)
missile3d.ax+=destination_angle_x-missile3d.ax
missile3d.vx-=sin(missile3d.ay)
missile3d.vy-=sin(missile3d.ax)
missile3d.vz-=cos(missile3d.ay)
if(collide_enemies(missile3d,object3d,2))explode(missile3d)
clamp_speed(missile3d,10)
smoke(missile3d)
end,
function(missile3d)
missile3d.life_span=10
local closest_enemy_id,closest_enemy_distance=0,32767
for i=1,#enemies do
local x_z_distance_to_player=v_len(missile3d,enemies[i])
if(x_z_distance_to_player<closest_enemy_distance)closest_enemy_id=i closest_enemy_distance=x_z_distance_to_player
end
missile3d.target=enemies[closest_enemy_id]
end,
object3d.vx-sin(object3d.ay)*15,object3d.vy-sin(object3d.ax)*15,object3d.vz-cos(object3d.ay)*15
)
new_missile.is_crash=function(object3d)
explode(new_missile)
end
end
end
time_last_shot,shoot_btn_last=time(),true
end
else
if(shoot_btn_last)shoot_btn_last=false
end
reset_srand()
end)
player.is_crash=function(object3d)
if(sqrt(object3d.vx^2+object3d.vy^2+object3d.vz^2)>3or abs(object3d.ax)>.03)damage_player()
end
cam_target=player
end
function clamp_speed(object3d,max_speed)
local n=sqrt(object3d.vx^2+object3d.vy^2+object3d.vz^2)
local f=n>max_speed and max_speed/n or 1
object3d.vx,object3d.vy,object3d.vz=f*object3d.vx,f*object3d.vy,f*object3d.vz
end
function destroy_player()
explode(player)
damage_player()
end
function logic_update()
if(damaged)if(time()-damaged_counter>5)damaged=false reset_player()
for i=#enemies,1,-1do
local enemy=enemies[i]
if(enemy.remove)deli(enemies,i)deleted=true
end
update_terrain()
lasttime=time()
envir={}
cam_x,cam_z=cam_target.x,cam_target.z-𝘤𝘢𝘮_𝘥𝘪𝘴𝘵_𝘵𝘦𝘳𝘳𝘢𝘪𝘯
if(cam_target.y>t_height_cam_target+50)cam_y=cam_target.y-20else cam_y=t_height_cam_target+30
end
function render_gamegui()
rectfill(𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1,0,128,12,6)
print("score",𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1+1,1,7)
print(tostr(score,2),𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1+1,7,7)
for i=1,missiles do spr(65,58+i*5+3,5)end
for i=1,lives do spr(64,58+i*5,0)end
print("wave",𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1+58,1,7)
print(wave,𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1+58,7,7)
print("best",𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1+78,1,7)
print(tostr(dget(i),2),𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴+1+78,7,7)
--print(tostr(infectable_areas,2),31,18,7)
--print(tostr(infected_area,2),60,18,7)
--print(stat(),90,18,7)
rectfill(𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴,14,fuel+𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴,14,10)
rectfill(𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴,16,player.y/7+𝘯𝘶𝘮𝘴𝘦𝘤𝘵𝘴,16,11)
end
function draw_update()
render_terrain()
render_gamegui()
render_minimap()
end
pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
local d,e,l=split"50,35,85",1,split"90,50,180"function 𝘧(n,e,o)h[n][e]=h[n][e]&~16128|o end function e1()𝘭=0for o=0,s-1do cls()h[o]={}for l=0,s-1do h[o][l]=0local n,c=l/240,o/240local f,t,i,u,n=cos(n)*1,cos(c)*1,sin(n)*1,sin(c)*1,0local r,c=f*cos(.15)-t*sin(.35),f*cos(.15)-t*sin(.15)n=abs(sin(f/4+sin(i/15)))*d[e]n+=abs(sin(u/4+sin(i/15)))*45n+=abs(sin(r/4+sin(t/30)))*35n+=abs(sin(c/4+sin(i/30)))*d[e]n+=abs(sin(c/4+sin(f/30)))*35n+=abs(sin(c/4+sin(u/30)))*d[e]n-=145if(n<=0)n=0else 𝘭+=.00002
h[o][l]|=n&255.99999end end for n=0,s-1do for e=0,s-1do srand(e*n)if(flr(rnd(22))==1and h[e][n]>4)𝘧(e,n,256)
if(flr(rnd(44))==2and h[e][n]>4)𝘧(e,n,3328)
if(flr(rnd(400))==1and h[e][n]>4)𝘧(e,n,8704)
end end for n=0,8do for o=0,8do h[o+114][n+114]=l[e]𝘭-=.00002end end for n=24,s-1-24,48do for e=24,s-1-24,48do h[e][n]|=2304end end end function et(n)local e,f=n+1,peek(n)local l,o=peek(e+f),e+f+1local n,d=o+l,{}for o=0,f-3,3do add(d,{(peek(e+o)-peek(n))*peek(n+3),(peek(e+o+1)-peek(n+1))*peek(n+3),(peek(e+o+2)-peek(n+2))*peek(n+3)})end local e={}for n=0,l-4,4do add(e,{peek(o+n),peek(o+n+1),peek(o+n+2),peek(o+n+3)})end local n={peek(n),peek(n+1),peek(n+2),peek(n+3)}return{d,e,n}end n3,𝘣,o,n𝘣=10,0,i function ei()music(0)i=𝘦(2,0,0,500,0,0,0)end function ec()i.l-=.02i.d+=.05if(i.f-n3>40)i.f-=n3
if(i.f>1000)eu()
if(btn(5))n3,n𝘣=-40,true
end function er()rectfill(0,0,128,128,0)nw()nj()nh()rectfill(0,0,128,8,6)print("prion",12,2,8)print("tpnk_dev 2024",47,2,7)print("🅾️thrust",20,100,8)print("❎ cannon",56,97,8)print("❎+❎ missile",56,103,8)print("<press ❎ to continue>",20,110,7)if(n𝘣)rectfill(0,80,128,128,0)print("loading terrain...",30,110,7)
end nq,s,c,h,𝘮,ny,nz,z,𝘤,x=time(),241,0,{},-33,33,1000,0,12a,u,w,v,n𝘤,n𝘥,e𝘩,n8,ns,nn,𝘣,n0,ea,n𝘨,n𝘩,n𝘪,o,ne,no,nx,n6,𝘯,j,𝘥,n7,𝘰,e2=𝘤+1,30,96,20,80,63,63,-3,-300,0,0,0,125,0,.5,0,nil,0,0,0,0,0,{},{},{},0,30𝘱,𝘲,𝘳,𝘴,𝘵,nf=sin(n𝘨),sin(n𝘩),sin(n𝘪),cos(n𝘨),cos(n𝘩),cos(n𝘪)e4,e5,e3,eh,e8,es,ex,e6,e7,b=nf*𝘵,-𝘳,nf*𝘲,𝘴*𝘳*𝘵+𝘱*𝘲,𝘴*nf,𝘴*𝘳*𝘲-𝘱*𝘵,𝘱*𝘳*𝘵-𝘴*𝘲,𝘱*nf,𝘱*𝘳*𝘲+𝘴*𝘵,function()end function nh()for n=0,𝘤-1do j[n]={}end end nh()function n𝘫()e1()local n=s-1c,x=s*v,n/u e9()end function ep(n)n.o%=c n.f%=c end function 𝘪(n)return n\v end function e𝘪(e,o,n)return(1-n)*e+n*o end function e𝘫(n,e)return n.o-e.o,n.e-e.e,n.f-e.f end function g(n,e)return h[n%c\v][e%c\v]&255.99999end function 𝘶(n,e)return(h[n][e]&16128)>>>8end function nl(n,e)return h[n][e]&255.99999end function n9(n,e,o)return n*e4+e*e5+o*e3,n*eh+e*e8+o*es,n*ex+e*e6+o*e7 end function n𝘬(d,f,l,n,e,o)local n,f,l=d,f*cos(n)+l*sin(n),f*-sin(n)+l*cos(n)n,f,l=n*cos(o)+f*sin(o),n*-sin(o)+f*cos(o),l return n*cos(e)+l*sin(e),f,n*-sin(e)+l*cos(e)end function np(n)return n>𝘮*v and n<ny*v end function n_(n)return n>z*v and n<nz*v end function n𝘭(n)return n>𝘣-200and n<𝘣+200end function n𝘮(n,e)local o=n if(np(n-c))o=n-c
if(np(n+c))o=n+c
local n=e if(n_(e-c))n=e-c
if(n_(e+c))n=e+c
return o,n end function nv(n,e,f,l,d,u,o)local c,o,t,n,e,i,f,l,d=o,band(n,-1),band(f,-1),band(e,-1),band(l,-1),band(d,-1),band(u,-1)if(n>e)n,e,o,t=e,n,t,o
if(n>f)n,f,o,i=f,n,i,o
if(e>f)e,f,t,i=f,e,i,t
if n~=e then local f,t,i,e=(i-o)/(f-n),(t-o)/(e-n),min(e,128)if(n>0)l,d,e=o,o,n else l,d,e=o-f*n,o-t*n,0
for n=e,i-1do rectfill(l,n,d,n,c)l+=f d+=t end else l,d=o,t end if f~=e then local u,i=(i-o)/(f-n),(i-t)/(f-e)n𝘯,e_=e,min(f,128)if(e<0)d,l,n𝘯=t-i*e,o-u*n,0
for n=n𝘯,e_ do rectfill(l,n,d,n,c)d+=i l+=u end else rectfill(l,f,d,f,c)end end function m(e,o,n)return e*n𝘤/n+n𝘥,o*n𝘤/n+n𝘥 end function e9()local n,e,o=0,0,{}for f=s-x,0,-x do o[n]={}for l=0,s-x,x do local d,f=2,nl(l+x\2,f+x\2)d=o[n][(e-1)%u]and f-o[n][(e-1)%u]or f local l=1l=d>=0and 3or 11if(f==0)l=1
o[n][e]=f sset(w+e,w+n,l)e+=1end e=0n+=1end for n=0,1do for e=0,1do sset(w+e+13,w+n+14,7)end end end function ev()sspr(w,w,u,u,0,0,u+1,u+1)pset(ne\x,u+-no\x,7)for n=1,#r do local n=r[n]local e,o=𝘪(n.o),𝘪(n.f)pset(e\x,u+-o\x,n.b())end for n=24,s-1-24,48do for e=24,s-1-24,48do if(𝘶(e,n)==11)rectfill((e-24)/48*6,abs((n-24)/48*6-u),(e-24)/48*6+5+1,abs((n-24)/48*6+5-u+1),0)
end end end function eb()nw()em()rectfill(0,0,128,128,0)if n𝘭(h[1][1]&255.99999)then local e={}for n=a*a-1,0,-1do local f,l=(n%a+𝘮)%s,(n\a+z)%s local c,u,i=n%a*v+𝘮*v,nl(f,l),n\a*v+z*v local o,t,d=c-nn,u-𝘣,i-n0 if n%a==0then o+=nx*v elseif n%a==𝘤 then o+=nx*v-v elseif n\a==0then d+=n6*v elseif n\a==𝘤 then d+=n6*v-v end o,t,d=n9(o,t,d)local d,r=m(o,t,d)add(e,{o,t,i,d,r,f,l})if n%a~=0and n%a<a-1and n\a~=0then local n=𝘶(f,l)srand(f*l)if(n>0)𝘦(𝘶(f,l),c,u,i,nil,nil,nil,nil,e𝘢[n],nil,nil,nil,true,true)
end end for n=1,#e do if n%a~=0and n>a-1then local n,f,l,u=e[n+1],e[n-a+1],e[n],e[n-a]local e,o,d,t,i,c,f,l,n=n[4],n[5],f[4],f[5],l[4],l[5],u[4],u[5],ek(n[6],n[7],true)if((e-d)*(l-t)-(o-t)*(f-d)<0)nv(e,o,d,t,f,l,n)
if((f-i)*(o-c)-(l-c)*(e-i)<0)nv(f,l,i,c,e,o,n)
fillp()else if n%a==0then local n=abs((n-(𝘤+1))\a-(𝘤+1))if(n<𝘤)for e=#j[n],1,-1do j[n][e]:𝘦()end
end end end else nj()end nh()end function nj()for n=#j,0,-1do for e=#j[n],1,-1do j[n][e]:𝘦()end end end function nw()for n=#𝘥,1,-1do local n=𝘥[n]n:z()if(n_(n.p)and np(n.v)and n𝘭(n.e))n.g=true add(j[abs(n.p-z*v)\v-1],n)else n.g=false
end end function em()ne,no,nx,n6=𝘪(o.o),𝘪(o.f),o.o/v%1,o.f/v%1𝘯,𝘮,ny,z,nz=nl(ne,no),ne-(a\2-1),a+𝘮-1,no-(a\2-1),a+z-1end function n𝘰(n)for e=1,#n.h do local n=n.h[e]n[4],n[5]=m(n[1],n[2],n[3])end for e=1,#n.𝘧 do local e=n.𝘧[e]local d=e[4]if(d&240>0)fillp(42405)else fillp()
local o,f,l=n.h[e[1]],n.h[e[2]],n.h[e[3]]local n,e,t=o[3],f[3],l[3]if n>ns or e>ns or t>ns then if n<n8 and e<n8 and t<n8 then local e,t,n,f,o,l=o[4],o[5],f[4],f[5],l[4],l[5]if max(o,max(e,n))>0and min(o,min(e,n))<128then if((e-n)*(l-f)-(t-f)*(o-n)<0)nv(e,t,n,f,o,l,d)
end end end end fillp()end function e𝘦(n)n.v,n.p=n𝘮(n.o,n.f)local e,o,f=n.v-nn,n.e-𝘣,n.p-n0 n.c,n.u,n.r=n9(e,o,f)end function eg(e)e.v,e.p=n𝘮(e.o,e.f)for f=1,#e.𝘤 do local n,o=e.h[f],e.𝘤[f]if(e𝘧(e.𝘭,f))n[1],n[2],n[3]=n𝘬(o[1],o[2],o[3],0,0,0)else n[1],n[2],n[3]=n𝘬(o[1],o[2],o[3],e.d,e.l,e.𝘥)
n[1]+=e.v-nn n[2]+=e.e-𝘣 n[3]+=e.p-n0 n[1],n[2],n[3]=n9(n[1],n[2],n[3])end end function e𝘸()for o=#𝘥,1,-1do local n,e=𝘥[o],false if n.k~=nil then n.k-=time()-nq if(n.k<0)e=true
end if n.x~=nil then if(n.x)e=true
end if not e then n:𝘪()ep(n)else deli(𝘥,o)if(n.m~=nil)n.m.x=true
end end end function p(n,o,f)local e=g(n.o,n.f)if n.e+n.t>e then n.e+=n.t n.o+=n.i n.f+=n.a n.t-=f*e𝘣[n𝘱]else if(n.s~=nil and n:s())return true
if o then if(abs(n.t)<.1)n.t,n.i,n.a,n.e=0,0,0,e else n.t=-n.t/4
else n.t,n.i,n.a,n.e=0,0,0,e end end end function e𝘧(e,o)local n=false for e in all(e)do if(e==o)n=true
end return n end function k(n,e,o,f,l,d,t,i,c,u,r,a)return n𝘲(0,n,e,o,0,0,0,i,c,t,f,l,d,r,false,u,a)end function 𝘦(n,e,o,f,l,d,t,i,c,u,r,a,h,s)return n𝘲(n,e,o,f,l,d,t,i,c,b,u,r,a,h,s)end function n𝘲(e,n,d,t,i,c,u,r,a,h,s,x,p,_,o,f,l)local n={𝘯=e,o=n,e=d,f=t,d=c or 0,l=i or 0,𝘥=u or 0,𝘪=r or b,𝘮=a or b,t=x or 0,i=s or 0,a=p or 0,k=f,𝘰=l,𝘤=𝘷[e][1],𝘧=𝘷[e][2],c=0,u=0,r=0,v=0,p=0,h={},𝘦=h or n𝘰,𝘫=_}o=o if e==0then n.z=e𝘦 if l then if(n7[𝘰]~=nil)n7[𝘰].x=true
n7[𝘰],𝘰=n,(𝘰+1)%e2 end if not n.𝘫 then n.m=k(n.o,g(n.o,n.f),n.f,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,0)end,function(e)e.o,e.f=n.o,n.f+.05e.e=g(n.o,n.f)if(n.e<=e.e)e.x=true
end,b,f,true)end else n.z,n.𝘦=eg,n𝘰 if(not n.𝘫)n.m=𝘦(e+1,0,0,0,0,0,0,function(e)e.o,e.f=n.o,n.f e.e,e.l=g(n.o,n.f),n.l end,b,0,0,0,true)
end if(o)add(𝘢,n)add(j[abs(n.f-z*v)\v-1],n)else add(𝘥,n)
for e=1,#n.𝘤 do n.h[e]={}for o=1,3do n.h[e][o]=0end end n:𝘮()n:z()return n end ew,e𝘬,e𝘭,i,r,𝘢,n,n𝘳,nd,nb,𝘨,e𝘮,n1,nt,nm,n𝘴,n𝘵,ni,e𝘯,n𝘶,n𝘷,𝘹,𝘭,nc,ej,eq,n𝘹,f,e𝘰,𝘫,e𝘣,n𝘱,n𝘢,𝘺,ey,𝘷=peek(24388),0,0,{},{},{},1,1,0,0,100,0,3,3,0,time(),time(),false,false,0,0,false,0,0,split"11,4,15,10",split"6,7",split"2,4,10,3,5",{},{},{},split"1, 1.3, 1.7",1,0,1,split"40,200,200,200,200,200,200",{[0]={{{0,0,0}},{}}}for n=1986,2055,2do add(𝘷,et(%n))end e𝘢={[8]=function(n)if(time()%3==0)k(n.o+rnd"10"-4,n.e+10+rnd"8",n.f+rnd"10"-4,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,5)end,function(n)n.e+=rnd"0.4"n.o+=rnd"0.4"-.2n.f+=rnd"0.4"-.2end,b,4,false,true)
end,[9]=function(n)n.𝘭,n.l=split"1,2,3,4",time()𝘦(10,n.o,n.e,n.f,n.l,nil,nil,nil,nil,nil,nil,nil,true,true)end}pal(1,140,1)pal(13,134,1)pal(15,138,1)pal(2,131,1)function 𝘩()poke(24388,ew)end function nu(n,e)local n,e=n.o-e.o,n.f-e.f if(abs(n)>2410)n-=sgn(n)*4820
if(abs(e)>2410)e-=sgn(e)*4820
return n,e end function q(e,o,d)local f,l=nu(e,o)local n=0if(d)n=e.e-o.e
local e=atan2(f,n)local n=f*cos(e)+n*sin(e)local e=atan2(n,l)return n*cos(e)+l*sin(e)end function n𝘺(e,o,f,n)local l=n and 32or 26local n=𝘦(l,e,o,f,.25,0,0,function(n)p(n,false,0)y(n,6,-1)n.l+=.03n.d+=.03local o,f=nu(i,n)local e=q(i,n,true)n.i+=o/e*.06n.t+=(max(g(n.o,n.f)+200,i.e)-n.e)/e*.06n.a+=f/e*.06𝘻(n,4)n𝘻(n)end,function(e)e.𝘢,e.b=function()return n and 150or 400end,function()return n and 8or 14end end)add(r,n)n.s=function()𝘬(n,1000)end end function nr(n,e)local o=g(n.o,n.f)n.e+=sgn(o+e-n.e)*.5end function _()return sgn(rnd"2"-1)end function eu()music(-1,500)add(f,function(n,e,o)local f={}for l=0,3do f[l]=k(n,e,o,0,0,0)end local l,d=.5*_(),.87*_()local n=𝘦(4,n,e,o,0,0,0,function(n)local e=g(n.o,n.f)n.l+=.01if n.𝘸 then if(n.e-1>e+20)n.e-=1
if(n.𝘨>30)for e=0,3do n.𝘣[e].𝘦=b end n.𝘸=false
else y(n,4,-1)nr(n,50)n.o+=l n.f+=d if time()%30==0then if(e>20)n.𝘸,n.𝘨=true,0for e=0,3do n.𝘣[e].𝘦=function(n)local n,o=m(n.c,n.u,n.r)line(n,o,n+sgn(e-2)*3,o+5,10)end end
end end if e>0then if time()%.5==0then n.𝘨+=1if(n.g)for e=0,7do srand(e*time())local n=k(n.o,n.e,n.f,rnd"4"-2,rnd"4",rnd"4"-2,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,8)end,function(n)p(n,true,.1)end,b,10,false,true)n.s=function(n)n.x=true nk(n.o,n.f)end end else for e=0,7do srand(e*time())nk(n.o+(rnd"14"-7)*v,n.f+(rnd"14"-7)*v)end
end end 𝘩()end,function(n)n.b,n.𝘢,n.𝘣=function()return 12end,function()for e=0,3do n𝘦(n.𝘣[e])end if(n.𝘸)return 50
return 100end,f for e=0,3do n.𝘣[e].𝘪=function(o)o.o,o.e,o.f=n.o+sgn(e-2)*10,n.e-8,n.f+(e%2-1)*10end end n.𝘸,n.𝘨,n.m.𝘬=false,0,0end)add(r,n)end)add(f,function(n,e,o)local f,l=.5*_(),.87*_()local n=𝘦(6,n,e,o,.25,0,0,function(n)srand(time())local e=q(i,n)if e<600or n.w then en(n,n.e-g(n.o,n.f),e)else if time()-n.j>.7then local e,o=n.o%c,n.f%c local e=sget(w+e\160,126-o\160)if e==4then if(flr(rnd"100")==1)n.𝘧,n.q,n.w=𝘷[16][2],.14,true
end end n.l=.917n.o+=f n.f+=l end 𝘩()𝘻(n,4)end,function(n)n.w,n.q=false,.7n.𝘢,n.b,n.j=function()if(n.w)return 500else return 300end,function()if(n.w)if(time()%.5<.25)return 8else return 9else return 9end,time()end)add(r,n)n.s=function()𝘬(n,1000)end end)add(f,function(n,f,l)local e,o=1.5*_(),2.61*_()local d=-atan2(e,o)+.25local n=𝘦(19,n,f,l,.25,0,0,function(n)y(n,5,-1)nr(n,100)n.o+=e n.f+=o if(time()%1==0)local n=k(n.o,n.e,n.f,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)spr(115,n,e)end,function(n)p(n,true,.2)end)n.s=function(e)e.x=true for e=-3,3do for o=-3,3do local e,o=e*v,o*v nk(n.o+e,n.f+o)end end end
end,function(n)n.𝘢,n.b,n.l=function()return 800end,function()if(time()%.5<.25)return 12else return 0end,d end)add(r,n)n.s=function()𝘬(n,1000)end end)add(f,function(n,e,o)local n=𝘦(21,n,e,o,.25,0,0,function(n)en(n,n.e-g(n.o,n.f))𝘻(n,4)end,function(n)n.q,n._=.3,2n.𝘢,n.b,n.j=function()if(n._<=0)return 700else n.𝘧,n.q=𝘷[23][2],.6return 200end,function()if(time()%.5<.25)return 10else return 0end,time()end)add(r,n)n.s=function()𝘬(n,1000)end end)add(f,function(n,e,o)n𝘺(n,e,o)end)add(f,function(n,e,o)local f,l=.5*_(),.87*_()local n=𝘦(28,n,e,o,0,0,0,function(n)y(n,8,-1)nr(n,50)n.l+=.01n.o+=f n.f+=l n.y.o,n.y.e,n.y.f=n.o,n.e,n.f end,function(n)n.b,n._,n.m.𝘬=function()if(time()%.5<.25)return 8else return 0end,5,0n.y=k(0,0,0,0,0,0,function(n)local e=q(n,i,true)if(e<100)y(n,9,1)local e,o=m(n.c,n.u,n.r)local f,l=m(i.h[1][1],i.h[1][2],i.h[1][3])srand(time()%2)local d,t=(e+f)/2+rnd(16)-8,(o+l)/2line(e,o,d,t,7)line(d,t,f,l)local n,e=n.o-i.o,n.e-i.e local o=sqrt(n*n+e*e)local o=1/o*.2i.i+=o*n i.t+=o*e 𝘨-=0x.1
end)n.𝘢=function()if(n._<=0)n.y.x=true return 1000else return 0end end)add(r,n)end)add(f,function(n,f,l)local e,o=1.5*_(),2.61*_()local d=-atan2(e,o)+.25local n=𝘦(30,n,f,l,.25,0,0,function(n)nr(n,300)n.o+=e n.f+=o if time()%8==0then if(q(n,i)<150)n𝘺(n.o,n.e,n.f,true)
end end,function(n)n.𝘢,n.b,n._,n.l=function()if(n._<=0)return 2000else return 0end,function()return 0end,25,d end)add(r,n)n.s=function(n)𝘬(n,1000)end end)local n=1for o=2056,2126,7do 𝘫[n]={}for e=0,6do for o=1,@(o+e)do local o=20*n*(e+1)*o add(𝘫[n],{ey[e+1],function()srand(o)f[e+1](flr(rnd(c)),300,flr(rnd(c)))end})end end n+=1end n𝘫()na,n2=e0,ee ng()end function ek(o,f)local d,t=nl(o,f),eo(o,f)srand(f*o)local i,n=(o%4+f%4+flr((rnd"6")))%4+1,1if(d>0)n=10
if(d>15)n=ej[i]
if(d==l[e])n=eq[(o%2+f%2+flr((rnd"2")))%2+1]
if t>=1then fillp(42405)local e=split"0x46, 0x44, 0x66"if(n==11)n=e[flr(rnd"3")+1]
if(n==4)n=136
local e=split"0x44,0x66,0x88"if(n==15)n=e[flr(rnd"3")+1]
if(n==10)n=138
else fillp()end 𝘩()return n end function eo(n,e)return(h[n][e]&49152)>>>14end function nk(n,o)local f,d=n%c,o%c local n,o,t=f\v,d\v,g(f,d)local i=eo(n,o)if i==0and t>0and t~=l[e]then h[n][o]+=16384sset(w+f\160,126-d\160,4)local e=𝘶(n,o)if(e==1)h[n][o]=h[n][o]&~16128|3840
if(e==13)h[n][o]=h[n][o]&~16128|4608
nc+=.00002end end function n4()if not 𝘹 then 𝘸(i)𝘹=true n1-=1if(n1<0)extcmd"reset"
n𝘷=time()end end function n𝘦(n)n.x=true if(n.m~=nil)n.m.x=true
end function ez()print("𝘢ttack 𝘸ave  "..n.." completed",18,60,7)print("𝘢rea infected  . . .     "..tostr(nc,2),7,80,7)print("𝘢rea uninfected  . . .   "..tostr(𝘭,2),7,90,7)print("𝘣onus uninfected area .  "..tostr(nb,2),7,105,7)end function e𝘤()if time()-n𝘶>5then 𝘺=1n+=1nm=0if(n>10)extcmd"reset"
if(n==5or n==7)e+=1n𝘱+=1n𝘫()
na,n2,𝘥=e0,ee,{}n𝘦(i)ng()end end function e𝘥()if(nm>=#𝘫[n])nb=max(0,(𝘭-nc-nc)/max(32/n,4))n5(nb)dset(0,max(dget(0),nd))sfx(7,3)na,n2,n𝘶=ez,e𝘤,time()
end function 𝘸(n)local o=g(n.o,n.f)sfx(3,2)for e=0,2do srand(e)k(n.o+rnd"10"-4,n.e+10+rnd"8",n.f+rnd"10"-4,0,0,0,function(n)local n,o=m(n.c,n.u,n.r)for f=0,7do srand(f*e)circfill(n+rnd"5"-4,o+rnd"5"-4,0,5)end end,function(n)n.e+=rnd"0.4"n.o+=rnd"0.4"-.2n.f+=rnd"0.4"-.2end,b,4,false,true)end for e=0,5do srand(e)local e=n𝘹[flr(rnd"5")+1]if(o==0and n.e<=1)e=12-flr(rnd"2")*5
k(n.o,n.e,n.f+5,rnd"2"-1,rnd"4"+2,rnd"2"-1,function(n)local n,o=m(n.c,n.u,n.r)circfill(n,o,0,e)end,function(n)p(n,true,.2)end,b,10,false,true)end 𝘩()n𝘦(n)del(r,n)e𝘥()end function y(n,e,o)if(n.g)sfx(e,o)
end function n𝘻(n)srand(n.o)if(time()%0x.02==0)k(n.o+rnd"16"-8,n.e+rnd"16"-8,n.f+5,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,5)end,b,b,3)
end function n𝘧(n,e,o)local o,e=o or false,e or.2n.t+=e*cos(n.d)*cos(n.𝘥)n.i+=e*sin(n.l)*-sin(n.d)n.a+=e*-cos(n.l)*sin(n.d)local e,o,f=cos(n.d)*cos(n.𝘥),sin(n.l)*-sin(n.d),-cos(n.l)*sin(n.d)y(n,0,1)if n.g then srand(time())for l=0,1do srand(l*time())k(n.o+rnd"8"-4,n.e+rnd"8"-4,n.f+rnd"8"+4+20,-o*4+rnd"2"-1+n.i,-e*4+n.t+rnd"2"-1,-f*4+rnd"2"-1+n.a,function(n)local o,f=m(n.c,n.u,n.r)local e=7+rnd"1"*3if(n.k<.2)e=8
circfill(o,f,0,e)end,function(n)p(n,true,.1)end,function(e)e.e=n.e+.001end,.4)end 𝘩()end end function ef(n)local e,o,f=sin(n.d),sin(n.l)*cos(n.d),cos(n.l)*cos(n.d)y(n,1,3)local n=k(n.o,n.e,n.f,10*-o+n.i,10*-e+n.t,10*-f+n.a,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,7)end,function(e)p(e,false,0)if(n𝘸(e,n))e.k=-1
el(e)end,b,1)n.s=function(n)y(n,2,1)n.x=true local o=g(n.o,n.f)for e=0,2do srand(e*time())local e=12-flr(rnd"2")*5if(o>0)e=n𝘹[flr(rnd"5")+1]
k(n.o,n.e,n.f,rnd"2"-1,rnd"2",rnd"2"-1,function(n)local n,o=m(n.c,n.u,n.r)circfill(n,o,0,e)end,function(n)p(n,true,.1)end,b,1,false,true)end 𝘩()end end function en(n,o,e)local f=e or q(i,n)p(n,false,.05)local e,l=nu(i,n)local l,e=-atan2(e,l),-atan2(f,i.e-n.e)if f>100then n𝘧(n,.4)if(n.e-i.e<20or o<60)e=-.15else e=-.25
else if(n.e-i.e<3or o<60)n𝘧(n,.2)e=0
if(time()-n.j>n.q)ef(n)n.j=time()
end n.l+=(l+.25-n.l)*.3n.d+=(e-n.d)*.5end function 𝘬(n,e)if(n._)n._-=e
local e=n.𝘢()n5(e>>16)ed(n,e)sfx(10,3)if(not n._ or n._<=0)if e~=150then nm+=1end 𝘸(n)
end function n𝘸(l,o,f)f,o=f or 1,o or l local n=r n[0]=i for e=#n,0,-1do if n[e].e~=o.e and n[e].o~=o.o then if q(l,n[e],true)<20then if e>0then 𝘬(r[e],f)else 𝘨-=20if(𝘨<0)n4()
end return true end end end return false end function ed(n,e)if(e~=0)k(n.o,n.e,n.f,0,0,0,function(n)local n,o=m(n.c,n.u,n.r)print(e,n,o,7)end,function(n)n.e+=.1end,b,5,false,true)
end function el(e)for n=#𝘢,1,-1do if sqrt(abs(e.v-𝘢[n].v)+abs(e.e-𝘢[n].e)+abs(e.p-𝘢[n].p))<5then 𝘢[n].i=e.i 𝘢[n].a=e.a 𝘢[n].t=e.t local o,f=𝘪(𝘢[n].v%c),𝘪(𝘢[n].p%c)local l=𝘶(o,f)if(l==1)𝘸(𝘢[n])𝘧(o,f,2048)
if l==15or l==18then 𝘸(𝘢[n])n5(.00062)ed(e,"40")if(l==15)𝘧(o,f,2048)else 𝘧(o,f,3584)
end if(l==9)𝘸(𝘢[n])𝘧(o,f,2816)
if(l==13)𝘸(𝘢[n])𝘧(o,f,3584)
if(l==34)𝘸(𝘢[n])𝘧(o,f,8960)
return true end end return false end function n5(n)nd+=n if(nd>n𝘳*.0763)n𝘳+=1n1+=1nt+=1
end function ng()i=𝘦(2,118*v,0,118.5*v,.25,0,0,function(n)if not 𝘹 then p(n,false,.12)if(n𝘸(n))n4()
if(el(n))n4()
if n.e>𝘯 then if(btn"0")n.l+=.03
if(btn"1")n.l-=.03
if btn"2"then if(abs(n.d-.02)<.2)n.d-=.02
end if btn"3"then if(abs(n.d+.02)<.2)n.d+=.02
end if time()%.00002==0then if(n.e>200)srand(time())k(n.o+rnd"200"-100,n.e+rnd"200"-50,n.f+rnd"200"-100,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,7)end,b,b,3,true,true)
end else if(𝘯==l[e])𝘨=100
end if n.e<1200then if(𝘨-.05>=0)if(btn"4")n𝘧(n,.5,true)𝘨-=.05
end 𝘻(n,8)poke(24413,5)if btn"5"then if(time()-n𝘴>.1)ef(n)n5(~0)n𝘴=time()
if not ni then if time()-n𝘵<.2then nt-=1if nt>=0then local n=𝘦(24,n.o,n.e,n.f,n.l,n.d,0,function(e)p(e,false,0)local o,f,l=q(e,e.𝘩),nu(e,e.𝘩)local f=-atan2(f,l)e.l+=f-.25-e.l local o=atan2(o,e.e-e.𝘩.e)e.d+=o-e.d e.i-=sin(e.l)e.t-=sin(e.d)e.a-=cos(e.l)if(n𝘸(e,n,100))𝘸(e)
𝘻(e,8)n𝘻(e)end,function(n)n.k=10local e,o=0,32767for f=1,#r do local n=q(n,r[f])if(n<o)e,o=f,n
end n.𝘩=r[e]end,n.i-sin(n.l)*35,n.t-sin(n.d)*35,n.a-cos(n.l)*35)n.s=function(n)𝘸(n)end end end n𝘵,ni=time(),true end else if(ni)ni=false
end 𝘩()end end)i.𝘬,i.s,o=1,function(n)if(sqrt(n.i^2+n.t^2+n.a^2)>3or abs(n.d)>.03)n4()
end,i end function 𝘻(n,e)local o=sqrt(n.i^2+n.t^2+n.a^2)local e=o>e and e/o or 1n.i,n.t,n.a=e*n.i,e*n.t,e*n.a end function ee()if(𝘹)if(time()-n𝘷>5)𝘹=false ng()
e𝘸()nq,𝘢,nn,n0=time(),{},o.o,o.f-ea if(o.e>𝘯+50)𝘣=o.e-20else 𝘣=𝘯+30
n𝘢+=1if 𝘺<#𝘫[n]+1then if(n𝘢>=𝘫[n][𝘺][1])n𝘢=0𝘫[n][𝘺][2]()𝘺+=1
end end function e𝘨()rectfill(31,0,128,12,6)print("score",32,1,7)print(tostr(nd,2),32,7,7)for n=1,nt do spr(113,52+n*5+3,5)end for n=1,n1 do spr(112,52+n*5,0)end print("wave",85,1,7)print(n,85,7,7)print("best",104,1,7)print(tostr(dget(0),2),104,7,7)rectfill(u,14,𝘨+u,14,10)rectfill(u,16,i.e/7+u,16,11)end function e0()eb()e𝘨()ev()end n2,na=ec,er function _init()cartdata"marcospiv_prion_v1_1_5"ei()end function _update()n2()end function _draw()na()end
__gfx__
b130005050a030700050000000500060a00000005000509160a05000c040506000102030407080903050000010b1200000001050400090801050600000403040
3000205000204000504210206030203060303040603040506030501060b0103020c0305040c0105030cd708090a040004030f020000000005040009080005060
0000c010205000203050003040500040004030e140200010201040404000204010207040208070207080204070201040004004102030c020403010405030c050
603010607030c070803010809030c09010301010a0201020a0400c40a0501050a0600c60a0701070a0800c80a0901090a0100c40304050b14000001000104000
4000004010007040008070007080004070001002102030002040300040503000506030006070300070803000809030009010300040004050b140000000004040
304000008040308080008080004040004040009083102030402040308040503040603050406070308070103040108020a0208040a0408090a0908060a0608070
a0708010a0409050d0605090d0402040205140000000004000008080008080004040004040009081102060002030600030706000704060004050600050106000
40004020c04000000000000030004080008010203050304020502000003081600040400060608060800060606000006080c0608060506002102030c030401010
30506050307050606050805050708050306080607030805060006040c0600000000080600060c0008080102030003040100060006040c0600040400060608060
8000608010203050304010006000604021000000102000201000100000302000300000c0102030c0304010c0305060c020100030211000400020405000406020
40304040000000016010300010203030104030301050303030004030c040000000000000300040800080102030503040205020000010b130005050a030700050
000000500060a00000005000509160a05000c04050600010203040708090e050000010b140000000004040304000008040308080008080004040004040009083
102030e020403010405030e0603050e060703010701030e0108020a0208040a0408090a0908060a0608070a0708010a040905080605090804020402051400000
00004000008080008080004040004040009081102060002030600030706000704060004050600050106000400040202110004000204050004060204030404000
00000160103000102030e0104030e0105030e030004030216020004040c08040c00020a0c020a06000b00220301010201040c0305010c0401060a0506010a040
6020cd503060cd302060a050206030c06000000000a0c000a06000b080401020001040300050006030815000600020609020a05040601020a0a0206050403050
20000340501070103040704020508050201040301060403060408060704054706080402040705470802040208010906010809050205030215000600000609000
a01000a0a00060500000011020400050103000106020006010500050005030815000600020609020a05040601020a0a0206050403050200003405010f0103040
f040205030502010a0301060a030604030607040b0706080f0204070b0708020f0208010a0601080a050205030725030a03050a03010a01030a0303000304050
306090003090203050603090403050300090302050832030104030204040501030705020107050402070503040706020708080904080a010b080c030d080d030
c080b010a080409080807020608030305020511000a05000a0300000000090200050600090400050c02030100060702000105040003000502021200020003040
00300020602040304040300002106030e0506010a0103020a0205010e0406050e0604030a0203040e0204050a020302030c00000400000004000404000008020
1040001030400020002030b17000700030707030007030e0e0307080606080608060608060606083105030a0405010a010302090204010906090307060507070
704080708020907050407080208040803090208050603080709060708090707070307030c00000707000007000e0e0007080201040001030400070007030e100
000040207020400060400080000040200000008020408080008060408004801070601080306060103060406030706040506050a09060a05040604080a0603080
4060208070602090a0608020a0707010606060207060205090605020606040204030c00000800000008000808000008020104000103040004000403021200020
00304000300020602040304040300002106030805060108010302080205010804060507060403070203040702040507020302010c00000400000004000404000
008020104000103040002000201003100020105060905060905020900020100060900060105020906040106040004000006040004080a06040a04000a0408084
30504060503070605010407030206070607030701080407060801060208060602090a07030902070a0908070809040704030907080a02070f0b0e080c0e0b080
e0c0d080d001e0805000403003100020102060901060901020900020100060900060102020100020102060901060901020900020100060900060102020044050
306070305060401050702070606010806070608020706070100070501000c0b0d070f0d0b070c0d09070a0e0f07090e00170e0a00170e090f070f090d0705000
40300000d200270039007f00831019104c10ed10c120632005204720c9206b203e20c330f6307930fc309e307340f540da40215093501750b8504e50ef502660
c7604b60ec60c4703010000000000040101000000000504010100000001040204050100010402040502000102030406020102010303080301010104050903020
10104060903020101040509030200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0333b30000007700c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333b330000775001c0cccc077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333bb3388775000c1cccccc60000606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0333bb33877500001c1c1c1066006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0033bbb077580000c101c10006666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003bbb0758800001000000000666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00333000000000000000000000777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0333b30000007700c000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333b330000775001c0cccc077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333bb3388775000c1cccccc60000606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0333bb33877500001c1c1c1066006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0033bbb077580000c101c10006666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003bbb0758800001000000000666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
01010000166221a6221a622196221762213622106220f622116221462217622186221762217622166221562213622106220c6220a622076220662204622036120261202612016120161200610006100061000610
000100001a6202362029420377202472019720147200b720077200572003720027200172001720017200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101000021650294502a6501f15017650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3509000005133386321f63218632136320f6320c6320a632086220661205612046120361202612016120061200600006000060000600006000060000600316002e6002b60028600236001d600176000d60008600
010e000004730101001010010100101000f1000c0000f100080000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
591000001b33000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
254602003851238502207002070020700207002070020700207002070020700207002070020700207002070014000140001400014000140001400000000000000000000000000000000000000000000000000000
611000001a0501a0251a7001a0501a0311a0252600026000260010900107001050010400103001010010000100001000000000000000000000000000000000000000000000000000000000000000000000000000
011101000f2131b3001b30000000000000000000000110001b500000000000000000000000000000000000001b500000000000000000000000000000000000001b50000000000000000000000000000000027200
3d110000336140c6000c6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e000029622186220a6220a6150a6000a6000a6020a600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000130233f2050000000002000030c023000030000300003000031802300003000030c023000030000318023000030000300003000030c023000030000300003000001802300000000000c0230000000000
491000000f6250160500605186050c6050f625000030000300003000030f6151b6150000503615000030000303615045030550309503000031b615000030960300003000031b6150f61500003336252761500000
c91000000051400510005100051000510005140051000510005100051000514005100051000514005110051108511085110851008510085100851408510085100851008510085140851008510085100851008511
011000000051202512035120051502500005000050200502000010000100001000010000100001000010000108511085110851108511085110851108511085110851108511085110851108511085110851108511
011000000c5100e5110f5110c5110c5110c5110c5100c5100c5100c5100c5100c5100c5100c5100c5100c51014511145111451114511145111451114511145111451114511145111451114511145111451114511
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0020000018c5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 14151657
01 14151617
02 14151618
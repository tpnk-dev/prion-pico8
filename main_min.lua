-- v1.1.2
pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
local d,e,l=split"50,35,85",1,split"90,50,180"function ed()for f=0,x-1do cls()a[f]={}for l=0,x-1do a[f][l]=0local n,c=l/240,f/240local o,t,i,u,n=cos(n)*1,cos(c)*1,sin(n)*1,sin(c)*1,0local r,c=o*cos(.15)-t*sin(.35),o*cos(.15)-t*sin(.15)n=abs(sin(o/4+sin(i/15)))*d[e]n+=abs(sin(u/4+sin(i/15)))*45n+=abs(sin(r/4+sin(t/30)))*35n+=abs(sin(c/4+sin(i/30)))*d[e]n+=abs(sin(c/4+sin(o/30)))*35n+=abs(sin(c/4+sin(u/30)))*d[e]n-=145if(n<=0)n=0else 𝘺+=.00002
a[f][l]|=n&255.99999end end for n=0,x-1do for e=0,x-1do srand(e*n)if(flr(rnd(22))==1and a[e][n]>4)a[e][n]=a[e][n]&~16128|256
if(flr(rnd(44))==2and a[e][n]>4)a[e][n]=a[e][n]&~16128|3328
end end for n=0,8do for f=0,8do a[f+114][n+114]=l[e]𝘺-=.00002end end for n=24,x-1-24,48do for e=24,x-1-24,48do a[e][n]|=2304end end end function e1(n)local e,o=n+1,peek(n)local l,f=peek(e+o),e+o+1local n,d=f+l,{}for f=0,o-3,3do add(d,{(peek(e+f)-peek(n))*peek(n+3),(peek(e+f+1)-peek(n+1))*peek(n+3),(peek(e+f+2)-peek(n+2))*peek(n+3)})end local e={}for n=0,l-4,4do add(e,{peek(f+n),peek(f+n+1),peek(f+n+2),peek(f+n+3)})end local n={peek(n),peek(n+1),peek(n+2),peek(n+3)}return{d,e,n}end n4,𝘦,f,n𝘣=10,0,i function et()music(0)i=g(2,0,0,500,0,0,0)end function ei()i.l-=.02i.d+=.05if(i.o-n4>40)i.o-=n4
if(i.o>1000)ec()
if(btn(5))n4,n𝘣=-40,true
end function eu()rectfill(0,0,128,128,0)n𝘦()nw()n5()rectfill(0,0,128,8,6)print("prion",12,2,8)print("tpnk_dev 2024",47,2,7)print("🅾️thrust",20,100,8)print("❎ cannon",56,97,8)print("❎+❎ missile",56,103,8)print("<press ❎ to continue>",20,110,7)if(n𝘣)rectfill(0,80,128,128,0)print("loading terrain...",30,110,7)
end nj,x,u,a,𝘬,nq,ny,y,z,r=time(),241,0,{},-33,33,1000,0,12h,c=z+1,30p,v,nz,n𝘤,e𝘨,n3,n8,𝘻,𝘦,nn,er,n𝘥,n𝘨,n𝘩,f,n0,ne,nh,ns,𝘭,w,𝘤,n7,𝘮,ea=128-ceil(c/8)*8,20,80,63,63,-3,-300,0,0,0,125,0,.5,0,nil,0,0,0,0,0,{},{},{},0,30𝘯,𝘰,𝘱,𝘲,𝘳,nf=sin(n𝘥),sin(n𝘨),sin(n𝘩),cos(n𝘥),cos(n𝘨),cos(n𝘩)e2,e4,e5,e3,e8,eh,es,e7,ex,b=nf*𝘳,-𝘱,nf*𝘰,𝘲*𝘱*𝘳+𝘯*𝘰,𝘲*nf,𝘲*𝘱*𝘰-𝘯*𝘳,𝘯*𝘱*𝘳-𝘲*𝘰,𝘯*nf,𝘯*𝘱*𝘰+𝘲*𝘳,function()end function n5()for n=0,z-1do w[n]={}end end n5()function n𝘪()ed()local n=x-1u,r=x*v,n/c e6()end function e9(n)n.f%=u n.o%=u end function 𝘨(n)return n\v end function e𝘩(e,f,n)return(1-n)*e+n*f end function e𝘪(n,e)return n.f-e.f,n.e-e.e,n.o-e.o end function 𝘧(n,e)return a[n%u\v][e%u\v]&255.99999end function 𝘴(n,e)return(a[n][e]&16128)>>>8end function no(n,e)return a[n][e]&255.99999end function nx(n,e,f)return n*e2+e*e4+f*e5,n*e3+e*e8+f*eh,n*es+e*e7+f*ex end function n𝘫(d,o,l,n,e,f)local n,o,l=d,o*cos(n)+l*sin(n),o*-sin(n)+l*cos(n)n,o,l=n*cos(f)+o*sin(f),n*-sin(f)+o*cos(f),l return n*cos(e)+l*sin(e),o,n*-sin(e)+l*cos(e)end function n6(n)return n>𝘬*v and n<nq*v end function n9(n)return n>y*v and n<ny*v end function n𝘬(n)return n>𝘦-200and n<𝘦+200end function n𝘭(n,e)local f=n if(n6(n-u))f=n-u
if(n6(n+u))f=n+u
local n=e if(n9(e-u))n=e-u
if(n9(e+u))n=e+u
return f,n end function np(n,e,o,l,d,u,f)local c,f,t,n,e,i,o,l,d=f,band(n,-1),band(o,-1),band(e,-1),band(l,-1),band(d,-1),band(u,-1)if(n>e)n,e,f,t=e,n,t,f
if(n>o)n,o,f,i=o,n,i,f
if(e>o)e,o,t,i=o,e,i,t
if n~=e then local o,t,i,e=(i-f)/(o-n),(t-f)/(e-n),min(e,128)if(n>0)l,d,e=f,f,n else l,d,e=f-o*n,f-t*n,0
for n=e,i-1do rectfill(l,n,d,n,c)l+=o d+=t end else l,d=f,t end if o~=e then local u,i=(i-f)/(o-n),(i-t)/(o-e)n𝘮,ep=e,min(o,128)if(e<0)d,l,n𝘮=t-i*e,f-u*n,0
for n=n𝘮,ep do rectfill(l,n,d,n,c)d+=i l+=u end else rectfill(l,o,d,o,c)end end function m(e,f,n)return e*nz/n+n𝘤,f*nz/n+n𝘤 end function e6()local n,e,f=0,0,{}for o=x-r,0,-r do f[n]={}for l=0,x-r,r do local d,o=2,no(l+r\2,o+r\2)d=f[n][(e-1)%c]and o-f[n][(e-1)%c]or o local l=1l=d>=0and 3or 11if(o==0)l=1
f[n][e]=o sset(p+e,p+n,l)e+=1end e=0n+=1end for n=0,1do for e=0,1do sset(p+e+13,p+n+14,7)end end end function e_()sspr(p,p,c,c,0,0,c+1,c+1)pset(n0\r,c+-ne\r,7)for n=1,#s do local n=s[n]local e,f=𝘨(n.f),𝘨(n.o)pset(e\r,c+-f\r,n.b())end for n=24,x-1-24,48do for e=24,x-1-24,48do if(𝘴(e,n)==11)rectfill((e-24)/48*6,abs((n-24)/48*6-c),(e-24)/48*6+5+1,abs((n-24)/48*6+5-c+1),0)
end end end function ev()n𝘦()eb()rectfill(0,0,128,128,0)if n𝘬(a[1][1]&255.99999)then local e={}for n=h*h-1,0,-1do local o,l=(n%h+𝘬)%x,(n\h+y)%x local c,u,i=n%h*v+𝘬*v,no(o,l),n\h*v+y*v local f,t,d=c-𝘻,u-𝘦,i-nn if n%h==0then f+=nh*v elseif n%h==z then f+=nh*v-v elseif n\h==0then d+=ns*v elseif n\h==z then d+=ns*v-v end f,t,d=nx(f,t,d)local d,r=m(f,t,d)add(e,{f,t,i,d,r,o,l})if n%h~=0and n%h<h-1and n\h~=0then local n=𝘴(o,l)srand(o*l)if(n>0)g(𝘴(o,l),c,u,i,nil,nil,nil,nil,em[n],nil,nil,nil,true,true)
end end for n=1,#e do if n%h~=0and n>h-1then local n,o,l,u=e[n+1],e[n-h+1],e[n],e[n-h]local e,f,d,t,i,c,o,l,n=n[4],n[5],o[4],o[5],l[4],l[5],u[4],u[5],e𝘢(n[6],n[7],true)if((e-d)*(l-t)-(f-t)*(o-d)<0)np(e,f,d,t,o,l,n)
if((o-i)*(f-c)-(l-c)*(e-i)<0)np(o,l,i,c,e,f,n)
fillp()else if n%h==0then local n=abs((n-(z+1))\h-(z+1))if(n<z)for e=#w[n],1,-1do w[n][e]:k()end
end end end else nw()end n5()end function nw()for n=#w,0,-1do for e=#w[n],1,-1do w[n][e]:k()end end end function n𝘦()for n=#𝘤,1,-1do local n=𝘤[n]n:z()if(n9(n.p)and n6(n.v)and n𝘬(n.e))n.𝘧=true add(w[abs(n.p-y*v)\v],n)else n.𝘧=false
end end function eb()n0,ne,nh,ns=𝘨(f.f),𝘨(f.o),f.f/v%1,f.o/v%1𝘭,𝘬,nq,y,ny=no(n0,ne),n0-(h\2-1),h+𝘬-1,ne-(h\2-1),h+y-1end function n𝘯(n)for e=1,#n.h do local n=n.h[e]n[4],n[5]=m(n[1],n[2],n[3])end for e=1,#n.𝘸 do local e=n.𝘸[e]local d=e[4]if(d&240>0)fillp(42405)else fillp()
local f,o,l=n.h[e[1]],n.h[e[2]],n.h[e[3]]local n,e,t=f[3],o[3],l[3]if n>n8 or e>n8 or t>n8 then if n<n3 and e<n3 and t<n3 then local e,t,n,o,f,l=f[4],f[5],o[4],o[5],l[4],l[5]if max(f,max(e,n))>0and min(f,min(e,n))<128then if((e-n)*(l-o)-(t-o)*(f-n)<0)np(e,t,n,o,f,l,d)
end end end end fillp()end function ek(n)n.v,n.p=n𝘭(n.f,n.o)local e,f,o=n.v-𝘻,n.e-𝘦,n.p-nn n.c,n.u,n.r=nx(e,f,o)end function eg(e)e.v,e.p=n𝘭(e.f,e.o)for o=1,#e.𝘤 do local n,f=e.h[o],e.𝘤[o]if(e𝘧(e.𝘬,o))n[1],n[2],n[3]=n𝘫(f[1],f[2],f[3],0,0,0)else n[1],n[2],n[3]=n𝘫(f[1],f[2],f[3],e.d,e.l,e.𝘥)
n[1]+=e.v-𝘻 n[2]+=e.e-𝘦 n[3]+=e.p-nn n[1],n[2],n[3]=nx(n[1],n[2],n[3])end end function e𝘸()for f=#𝘤,1,-1do local n,e=𝘤[f],false if n.𝘢~=nil then n.𝘢-=time()-nj if(n.𝘢<0)e=true
end if n.x~=nil then if(n.x)e=true
end if not e then n:𝘪()e9(n)else deli(𝘤,f)if(n.g~=nil)n.g.x=true
end end end function _(n,f,o)local e=𝘧(n.f,n.o)if n.e+n.t>e then n.e+=n.t n.f+=n.i n.o+=n.a n.t-=o*e𝘣[n𝘰]else if(n.s~=nil and n:s())return true
if f then if(abs(n.t)<.1)n.t,n.i,n.a,n.e=0,0,0,e else n.t=-n.t/4
else n.t,n.i,n.a,n.e=0,0,0,e end end end function e𝘧(e,f)local n=false for e in all(e)do if(e==f)n=true
end return n end function k(n,e,f,o,l,d,t,i,c,u,r,a)return n𝘱(0,n,e,f,0,0,0,i,c,t,o,l,d,r,false,u,a)end function g(n,e,f,o,l,d,t,i,c,u,r,a,h,s)return n𝘱(n,e,f,o,l,d,t,i,c,b,u,r,a,h,s)end function n𝘱(e,n,d,t,i,c,u,r,a,h,s,x,p,_,f,o,l)local n={𝘮=e,f=n,e=d,o=t,d=c or 0,l=i or 0,𝘥=u or 0,𝘪=r or b,𝘭=a or b,t=x or 0,i=s or 0,a=p or 0,𝘢=o,𝘯=l,𝘤=𝘵[e][1],𝘸=𝘵[e][2],c=0,u=0,r=0,v=0,p=0,h={},k=h or n𝘯,𝘫=_}f=f if e==0then n.z=ek if l then if(n7[𝘮]~=nil)n7[𝘮].x=true
n7[𝘮],𝘮=n,(𝘮+1)%ea end if not n.𝘫 then n.g=k(n.f,𝘧(n.f,n.o),n.o,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,0)end,function(e)e.f,e.o=n.f,n.o+.05e.e=𝘧(n.f,n.o)if(n.e<=e.e)e.x=true
end,b,o,true)end else n.z,n.k=eg,n𝘯 if(not n.𝘫)n.g=g(e+1,0,0,0,0,0,0,function(e)e.f,e.o=n.f,n.o e.e,e.l=𝘧(n.f,n.o),n.l end,b,0,0,0,true)
end if(f)add(𝘢,n)add(w[abs(n.o-y*v)\v],n)else add(𝘤,n)
for e=1,#n.𝘤 do n.h[e]={}for f=1,3do n.h[e][f]=0end end n:𝘭()n:z()return n end e𝘦,e𝘫,e𝘬,i,s,𝘢,n,n𝘲,𝘶,n_,𝘩,e𝘭,nl,nd,nv,n𝘳,n𝘴,n1,e𝘮,n𝘵,n𝘶,nb,𝘺,nt,ew,ej,n𝘷,o,e𝘯,𝘪,e𝘣,n𝘰,nm,𝘷,eq,𝘵=peek(24388),0,0,{},{},{},1,1,0,0,100,0,3,3,0,time(),time(),false,false,0,0,false,0,0,split"11,4,15,10",split"6,7",split"2,4,10,3,5",{},{},{},split"1, 1.3, 1.7",1,0,1,split"40,200,200,200,200,200,200",{[0]={{{0,0,0}},{}}}for n=1742,1807,2do add(𝘵,e1(%n))end em={[8]=function(n)if(time()%3==0)k(n.f+rnd"10"-4,n.e+10+rnd"8",n.o+rnd"10"-4,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,5)end,function(n)n.e+=rnd"0.4"n.f+=rnd"0.4"-.2n.o+=rnd"0.4"-.2end,b,4,false,true)
end,[9]=function(n)n.𝘬,n.l=split"1,2,3,4",time()g(10,n.f,n.e,n.o,n.l,nil,nil,nil,nil,nil,nil,nil,true,true)end}pal(1,140,1)pal(13,134,1)pal(15,138,1)pal(2,131,1)function 𝘥()poke(24388,e𝘦)end function ni(n,e)local n,e=n.f-e.f,n.o-e.o if(abs(n)>2410)n-=sgn(n)*4820
if(abs(e)>2410)e-=sgn(e)*4820
return n,e end function j(e,f,d)local o,l=ni(e,f)local n=0if(d)n=e.e-f.e
local e=atan2(o,n)local n=o*cos(e)+n*sin(e)local e=atan2(n,l)return n*cos(e)+l*sin(e)end function n𝘹(e,f,o,n)local l=n and 32or 26local n=g(l,e,f,o,.25,0,0,function(n)_(n,false,0)q(n,6,-1)n.l+=.03n.d+=.03local f,o=ni(i,n)local e=j(i,n)n.i+=f/e*.06n.t+=(i.e-n.e)/e*.06n.a+=o/e*.06𝘹(n,4)n𝘺(n)end,function(e)e.m,e.b=function()return n and 150or 400end,function()return n and 8or 14end end)add(s,n)n.s=function()𝘫(n,1000)end end function nc(n,e)local f=𝘧(n.f,n.o)n.e+=sgn(f+e-n.e)*.5end function 𝘸()return sgn(rnd"2"-1)end function ec()music(-1,500)add(o,function(n,e,f)local o={}for l=0,3do o[l]=k(n,e,f,0,0,0)end local l,d=.5*𝘸(),.87*𝘸()local n=g(4,n,e,f,0,0,0,function(n)local e=𝘧(n.f,n.o)n.l+=.01if n.𝘣 then if(n.e-1>e+20)n.e-=1
if(n.𝘨>30)for e=0,3do n.𝘦[e].k=b end n.𝘣=false
else q(n,4,-1)nc(n,50)n.f+=l n.o+=d if time()%30==0then if(e>20)n.𝘣,n.𝘨=true,0for e=0,3do n.𝘦[e].k=function(n)local n,f=m(n.c,n.u,n.r)line(n,f,n+sgn(e-2)*3,f+5,10)end end
end end if e>0then if time()%.5==0then n.𝘨+=1if(n.𝘧)for e=0,7do srand(e*time())local n=k(n.f,n.e,n.o,rnd"4"-2,rnd"4",rnd"4"-2,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,8)end,function(n)_(n,true,.1)end,b,10,false,true)n.s=function(n)n.x=true n𝘢(n.f,n.o)end end else for e=0,7do srand(e*time())n𝘢(n.f+(rnd"14"-7)*v,n.o+(rnd"14"-7)*v)end
end end 𝘥()end,function(n)n.b,n.m,n.𝘦=function()return 12end,function()for e=0,3do nk(n.𝘦[e])end if(n.𝘣)return 50
return 100end,o for e=0,3do n.𝘦[e].𝘪=function(f)f.f,f.e,f.o=n.f+sgn(e-2)*10,n.e-8,n.o+(e%2-1)*10end end n.𝘣,n.𝘨=false,0end)add(s,n)end)add(o,function(n,e,f)local o,l=.5*𝘸(),.87*𝘸()local n=g(6,n,e,f,.25,0,0,function(n)srand(time())local e=j(i,n)if e<600or n.w then n𝘻(n,n.e-𝘧(n.f,n.o),e)else if time()-n.j>.7then local e,f=n.f%u,n.o%u local e=sget(p+e\(r*v),p+c-f\(r*v))if e==4then if(flr(rnd"100")==1)n.𝘸,n.q,n.w=𝘵[16][2],.14,true
end end n.l=.917n.f+=o n.o+=l end 𝘥()𝘹(n,4)end,function(n)n.w,n.q=false,.7n.m,n.b,n.j=function()if(n.w)return 500else return 300end,function()if(n.w)if(time()%.5<.25)return 8else return 9else return 9end,time()end)add(s,n)n.s=function()𝘫(n,1000)end end)add(o,function(n,o,l)local e,f=1.5*𝘸(),2.61*𝘸()local d=-atan2(e,f)+.25local n=g(19,n,o,l,.25,0,0,function(n)q(n,5,-1)nc(n,100)n.f+=e n.o+=f if(time()%1==0)local n=k(n.f,n.e,n.o,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)spr(67,n,e)end,function(n)_(n,true,.2)end)n.s=function(e)e.x=true for e=-3,3do for f=-3,3do local e,f=e*v,f*v n𝘢(n.f+e,n.o+f)end end end
end,function(n)n.m,n.b,n.l=function()return 800end,function()if(time()%.5<.25)return 12else return 0end,d end)add(s,n)n.s=function()𝘫(n,1000)end end)add(o,function(n,e,f)local n=g(21,n,e,f,.25,0,0,function(n)n𝘻(n,n.e-𝘧(n.f,n.o))𝘹(n,4)end,function(n)n.q,n._=.3,2n.m,n.b,n.j=function()if(n._<=0)return 700else n.𝘸,n.q=𝘵[23][2],.6return 200end,function()if(time()%.5<.25)return 10else return 0end,time()end)add(s,n)n.s=function()𝘫(n,1000)end end)add(o,function(n,e,f)n𝘹(n,e,f)end)add(o,function(n,e,f)local o,l=.5*𝘸(),.87*𝘸()local n=g(28,n,e,f,0,0,0,function(n)q(n,8,-1)nc(n,50)n.l+=.01n.f+=o n.o+=l n.y.f,n.y.e,n.y.o=n.f,n.e,n.o end,function(n)n.b,n._=function()if(time()%.5<.25)return 8else return 0end,5n.y=k(0,0,0,0,0,0,function(n)local e=j(n,i,true)if(e<100)q(n,9,1)local e,f=m(n.c,n.u,n.r)local o,l=m(i.h[1][1],i.h[1][2],i.h[1][3])srand(time()%2)local d,t=(e+o)/2+rnd(16)-8,(f+l)/2line(e,f,d,t,7)line(d,t,o,l)local n,e=n.f-i.f,n.e-i.e local f=sqrt(n*n+e*e)local f=1/f*.2i.i+=f*n i.t+=f*e
end)n.m=function()if(n._<=0)n.y.x=true return 1000else return 0end end)add(s,n)end)add(o,function(n,e,f)local o,l,d=1.5*𝘸(),2.61*𝘸(),-atan2(e𝘰,e𝘱)-.25local n=g(30,n,e,f,.25,0,0,function(n)nc(n,300)n.f+=o n.o+=l if time()%8==0then if(j(n,i)<150)n𝘹(n.f,n.e,n.o,true)
end end,function(n)n.m,n.b,n._,n.l=function()if(n._<=0)return 2000else return 0end,function()return 0end,25,d end)add(s,n)n.s=function(n)𝘫(n,1000)end end)local n=1for f=1808,1878,7do 𝘪[n]={}for e=0,6do for f=1,@(f+e)do local f=20*n*(e+1)*f add(𝘪[n],{eq[e+1],function()srand(f)o[e+1](flr(rnd(u)),300,flr(rnd(u)))end})end end n+=1end n𝘪()nu,nr=en,e0 ng()end function e𝘢(f,o)local d,t=no(f,o),ee(f,o)srand(o*f)local i,n=(f%4+o%4+flr((rnd"6")))%4+1,1if(d>0)n=10
if(d>15)n=ew[i]
if(d==l[e])n=ej[(f%2+o%2+flr((rnd"2")))%2+1]
if t>=1then fillp(42405)local e=split"0x46, 0x44, 0x66"if(n==11)n=e[flr(rnd"3")+1]
if(n==4)n=136
local e=split"0x44,0x66,0x88"if(n==15)n=e[flr(rnd"3")+1]
if(n==10)n=138
else fillp()end 𝘥()return n end function ee(n,e)return(a[n][e]&49152)>>>14end function n𝘢(n,f)local o,d=n%u,f%u local n,f,t=o\v,d\v,𝘧(o,d)local i=ee(n,f)if i==0and t>0and t~=l[e]then a[n][f]+=16384sset(p+o\(r*v),p+c-d\(r*v),4)local e=𝘴(n,f)if(e==1)a[n][f]=a[n][f]&~16128|3840
if(e==13)a[n][f]=a[n][f]&~16128|4608
nt+=.00002end end function na()𝘣(i)nb=true nl-=1if(nl<0)extcmd"reset"
n𝘶=time()end function nk(n)n.x=true if(n.g~=nil)n.g.x=true
end function ey()print("𝘢ttack 𝘸ave  "..n.." completed",18,60,7)print("𝘢rea infected  . . .     "..tostr(nt,2),7,80,7)print("𝘢rea uninfected  . . .   "..tostr(𝘺,2),7,90,7)print("𝘣onus uninfected area .  "..tostr(n_,2),7,105,7)end function ez()if time()-n𝘵>5then 𝘷=1n+=1nv=0if(n>10)extcmd"reset"
if(n==5or n==7)e+=1n𝘰+=1n𝘪()
nu,nr,𝘤=en,e0,{}nk(i)ng()end end function e𝘤()if(nv>=#𝘪[n])n_=max(0,(𝘺-nt-nt)/max(32/n,4))𝘶+=n_ dset(0,max(dget(0),𝘶))sfx(7,3)nu,nr,n𝘵=ey,ez,time()
end function 𝘣(n)local f=𝘧(n.f,n.o)sfx(3,2)for e=0,2do srand(e)k(n.f+rnd"10"-4,n.e+10+rnd"8",n.o+rnd"10"-4,0,0,0,function(n)local n,f=m(n.c,n.u,n.r)for o=0,7do srand(o*e)circfill(n+rnd"5"-4,f+rnd"5"-4,0,5)end end,function(n)n.e+=rnd"0.4"n.f+=rnd"0.4"-.2n.o+=rnd"0.4"-.2end,b,4,false,true)end for e=0,5do srand(e)local e=n𝘷[flr(rnd"5")+1]if(f==0and n.e<=1)e=12-flr(rnd"2")*5
k(n.f,n.e,n.o+5,rnd"2"-1,rnd"4"+2,rnd"2"-1,function(n)local n,f=m(n.c,n.u,n.r)circfill(n,f,0,e)end,function(n)_(n,true,.2)end,b,10,false,true)end 𝘥()nk(n)del(s,n)e𝘤()end function q(n,e,f)if(n.𝘧)sfx(e,f)
end function n𝘺(n)srand(n.f)if(time()%0x.02==0)k(n.f+rnd"16"-8,n.e+rnd"16"-8,n.o+5,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,5)end,b,b,3)
end function n𝘧(n,f,e)local e,f=e or false,f or.2if 𝘩>0and e or not e then if(𝘩>0and e)𝘩-=.05
n.t+=f*cos(n.d)*cos(n.𝘥)n.i+=f*sin(n.l)*-sin(n.d)n.a+=f*-cos(n.l)*sin(n.d)local e,f,o=cos(n.d)*cos(n.𝘥),sin(n.l)*-sin(n.d),-cos(n.l)*sin(n.d)q(n,0,1)if n.𝘧 then srand(time())for l=0,1do srand(l*time())k(n.f+rnd"8"-4,n.e+rnd"8"-4,n.o+rnd"8"+4+20,-f*4+rnd"2"-1+n.i,-e*4+n.t+rnd"2"-1,-o*4+rnd"2"-1+n.a,function(n)local f,o=m(n.c,n.u,n.r)local e=7+rnd"1"*3if(n.𝘢<.2)e=8
circfill(f,o,0,e)end,function(n)_(n,true,.1)end,function(e)e.e=n.e+.001end,.4)end 𝘥()end end end function ef(n)local e,f,o=sin(n.d),sin(n.l)*cos(n.d),cos(n.l)*cos(n.d)q(n,1,3)local n=k(n.f,n.e,n.o,10*-f+n.i,10*-e+n.t,10*-o+n.a,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,7)end,function(e)_(e,false,0)if(n𝘸(e,n))e.𝘢=-1
eo(e)end,b,1)n.s=function(n)q(n,2,1)n.x=true local f=𝘧(n.f,n.o)for e=0,2do srand(e*time())local e=12-flr(rnd"2")*5if(f>0)e=n𝘷[flr(rnd"5")+1]
k(n.f,n.e,n.o,rnd"2"-1,rnd"2",rnd"2"-1,function(n)local n,f=m(n.c,n.u,n.r)circfill(n,f,0,e)end,function(n)_(n,true,.1)end,b,1,false,true)end 𝘥()end end function n𝘻(n,f,e)local o=e or j(i,n)_(n,false,.05)local e,l=ni(i,n)local l,e=-atan2(e,l),-atan2(o,i.e-n.e)if o>100then n𝘧(n,.4)if(n.e-i.e<20or f<60)e=-.15else e=-.25
else if(n.e-i.e<3or f<60)n𝘧(n,.2)e=0
if(time()-n.j>n.q)ef(n)n.j=time()
end n.l+=(l+.25-n.l)*.3n.d+=(e-n.d)*.5end function 𝘫(n,e)if(n._)n._-=e
local e=n.m()n2(e>>16)el(n,e)sfx(10,3)nv+=1if(not n._ or n._<=0)𝘣(n)
end function n𝘸(l,f,o)o,f=o or 1,f or l local n=s n[0]=i for e=#n,0,-1do if n[e].e~=f.e and n[e].f~=f.f then if j(l,n[e],true)<20then if(e>0)𝘫(s[e],o)else 𝘩-=20
return true end end end return false end function el(n,e)if(e~=0)k(n.f,n.e,n.o,0,0,0,function(n)local n,f=m(n.c,n.u,n.r)print(e,n,f,7)end,function(n)n.e+=.1end,b,5,false,true)
end function eo(o)for n=#𝘢,1,-1do if sqrt(abs(o.v-𝘢[n].v)+abs(o.e-𝘢[n].e)+abs(o.p-𝘢[n].p))<5then 𝘢[n].i=o.i 𝘢[n].a=o.a 𝘢[n].t=o.t local e,f=𝘨(𝘢[n].v%u),𝘨(𝘢[n].p%u)local l=𝘴(e,f)if l==1or l==15then 𝘣(𝘢[n])a[e][f]=a[e][f]&~16128|2048if(l==15)n2(.00062)el(o,"40")
end if(l==6)n2(.00062)𝘣(𝘢[n])a[e][f]=a[e][f]&~16128|2048
if(l==9)𝘣(𝘢[n])a[e][f]=a[e][f]&~16128|2816
if(l==13)𝘣(𝘢[n])a[e][f]=a[e][f]&~16128|3584
return true end end return false end function n2(n)𝘶+=n if(𝘶>n𝘲*.0763)n𝘲+=1nl+=1nd+=1
end function ng()i=g(2,118*v,0,118.5*v,.25,0,0,function(n)_(n,false,.12)if(n𝘸(n))na()
if(eo(n))na()
if n.e>𝘭 then if(btn"0")n.l+=.03
if(btn"1")n.l-=.03
if btn"2"then if(abs(n.d-.02)<.2)n.d-=.02
end if btn"3"then if(abs(n.d+.02)<.2)n.d+=.02
end if time()%.00002==0then if(n.e>200)srand(time())k(n.f+rnd"200"-100,n.e+rnd"200"-50,n.o+rnd"200"-100,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,7)end,b,b,3,true,true)
end else if(𝘭==l[e])𝘩=100
end if n.e<1200then if(btn"4")n𝘧(n,.5,true)
end 𝘹(n,8)poke(24413,5)if btn"5"then if(time()-n𝘳>.1)ef(n)n2(~0)n𝘳=time()
if not n1 then if time()-n𝘴<.2then nd-=1if nd>=0then local n=g(24,n.f,n.e,n.o,n.l,n.d,0,function(e)_(e,false,0)local f,o,l=j(e,e.𝘩),ni(e,e.𝘩)local o=-atan2(o,l)e.l+=o-.25-e.l local f=atan2(f,e.e-e.𝘩.e)e.d+=f-e.d e.i-=sin(e.l)e.t-=sin(e.d)e.a-=cos(e.l)if(n𝘸(e,n,100))𝘣(e)
𝘹(e,8)n𝘺(e)end,function(n)n.𝘢=10local e,f=0,32767for o=1,#s do local n=j(n,s[o])if(n<f)e,f=o,n
end n.𝘩=s[e]end,n.i-sin(n.l)*35,n.t-sin(n.d)*35,n.a-cos(n.l)*35)n.s=function(n)𝘣(n)end end end n𝘴,n1=time(),true end else if(n1)n1=false
end 𝘥()end)i.s,f=function(n)if(sqrt(n.i^2+n.t^2+n.a^2)>3or abs(n.d)>.03)na()
end,i end function 𝘹(n,e)local f=sqrt(n.i^2+n.t^2+n.a^2)local e=f>e and e/f or 1n.i,n.t,n.a=e*n.i,e*n.t,e*n.a end function e𝘲()𝘣(i)na()end function e0()if(nb)if(time()-n𝘶>5)nb=false ng()
e𝘸()nj,𝘢,𝘻,nn=time(),{},f.f,f.o-er if(f.e>𝘭+50)𝘦=f.e-20else 𝘦=𝘭+30
nm+=1if 𝘷<#𝘪[n]+1then if(nm>=𝘪[n][𝘷][1])nm=0𝘪[n][𝘷][2]()𝘷+=1
end end function e𝘥()rectfill(c+1,0,128,12,6)print("score",c+1+1,1,7)print(tostr(𝘶,2),c+1+1,7,7)for n=1,nd do spr(65,58+n*5+3,5)end for n=1,nl do spr(64,58+n*5,0)end print("wave",c+1+58,1,7)print(n,c+1+58,7,7)print("best",c+1+78,1,7)print(tostr(dget(0),2),c+1+78,7,7)rectfill(c,14,𝘩+c,14,10)rectfill(c,16,i.e/7+c,16,11)end function en()ev()e𝘥()e_()end nr,nu=ei,eu function _init()cartdata"marcospiv_prion_v1_1_2"et()end function _update()nr()end function _draw()nu()end
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
00802010400010304000200020100000d200270039007f00831019104c10ed10c120632005204720c9206b203e20c330f6307930fc309e307340f540da402150
93501750b8504e50ef502660c7604b60301000000000004010100000000050401010000000104020405010001040204050200010203040602010201030308030
10101040509030201010406090302010104050903020000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
local o,l=split"50,35,85",split"90,50,180"function n𝘺()for e=0,s-1do cls()r[e]={}for l=0,s-1do r[e][l]=0local n,i=l/240,e/240local f,d,t,c,n=cos(n)*1,cos(i)*1,sin(n)*1,sin(i)*1,0local u,i=f*cos(.15)-d*sin(.35),f*cos(.15)-d*sin(.15)n=abs(sin(f/4+sin(t/15)))*o[1]n+=abs(sin(c/4+sin(t/15)))*45n+=abs(sin(u/4+sin(d/30)))*35n+=abs(sin(i/4+sin(t/30)))*o[1]n+=abs(sin(i/4+sin(f/30)))*35n+=abs(sin(i/4+sin(c/30)))*o[1]n-=145if(n<=0)n=0else 𝘶+=.00002
r[e][l]|=n&255.99999end end for n=0,s-1do for e=0,s-1do srand(e*n)if(flr(rnd(22))==1and r[e][n]>4)r[e][n]=r[e][n]&~16128|256
if(flr(rnd(44))==2and r[e][n]>4)r[e][n]=r[e][n]&~16128|3328
end end for n=0,8do for e=0,8do r[e+114][n+114]=l[1]𝘶-=.00002end end for n=24,s-1-24,48do for e=24,s-1-24,48do r[e][n]|=2304end end end function n𝘻(n)local e,o=n+1,peek(n)local l,f=peek(e+o),e+o+1local n,d=f+l,{}for f=0,o-3,3do add(d,{(peek(e+f)-peek(n))*peek(n+3),(peek(e+f+1)-peek(n+1))*peek(n+3),(peek(e+f+2)-peek(n+2))*peek(n+3)})end local e={}for n=0,l-4,4do add(e,{peek(f+n),peek(f+n+1),peek(f+n+2),peek(f+n+3)})end local n={peek(n),peek(n+1),peek(n+2),peek(n+3)}return{d,e,n}end ni,𝘦,n,n𝘢=10,0,i function en()i=g(2,0,0,500,0,0,0)end function e0()i.l-=.02i.d+=.05if(i.o-ni>40)i.o-=ni
if(i.o>1000)ee()
if(btn(5))ni,n𝘢=-40,true
end function ef()rectfill(0,0,128,128,0)n_()ng()nc()rectfill(0,0,128,8,6)print("prion",12,2,8)print("marcospiv 2021",47,2,7)print("🅾️thrust",20,100,8)print("❎ cannon",56,97,8)print("❎+❎ missile",56,103,8)print("<press ❎ to continue>",20,110,7)if(n𝘢)rectfill(0,80,128,128,0)print("loading terrain...",30,110,7)
end n𝘧,s,u,r,𝘩,nk,n𝘸,q,y,h=time(),241,0,{},-33,33,1000,0,12a,c=y+1,30p,m,n𝘣,n𝘦,ej,nu,nr,𝘷,𝘦,𝘹,eo,nw,nj,nq,n,𝘺,𝘻,na,n2,𝘪,w,z,n4,𝘫,el=128-ceil(c/8)*8,20,80,63,63,-3,-300,0,0,0,125,0,.5,0,nil,0,0,0,0,0,{},{},{},0,50𝘬,𝘭,𝘮,𝘯,𝘰,nn=sin(nw),sin(nj),sin(nq),cos(nw),cos(nj),cos(nq)ed,e1,et,ei,ec,eu,er,ea,e2,b=nn*𝘰,-𝘮,nn*𝘭,𝘯*𝘮*𝘰+𝘬*𝘭,𝘯*nn,𝘯*𝘮*𝘭-𝘬*𝘰,𝘬*𝘮*𝘰-𝘯*𝘭,𝘬*nn,𝘬*𝘮*𝘭+𝘯*𝘰,function()end function nc()for n=0,y-1do w[n]={}end end nc()function e4()n𝘺()local n=s-1u,h=s*m,n/c e5()end function e3(n)n.f%=u n.o%=u end function f(n)return n\m end function eq(e,f,n)return(1-n)*e+n*f end function ey(n,e)return n.f-e.f,n.e-e.e,n.o-e.o end function 𝘧(n,e)return r[n%u\m][e%u\m]&255.99999end function 𝘱(n,e)return(r[n][e]&16128)>>>8end function n0(n,e)return r[n][e]&255.99999end function n5(n,e,f)return n*ed+e*e1+f*et,n*ei+e*ec+f*eu,n*er+e*ea+f*e2 end function ny(d,o,l,n,e,f)local n,o,l=d,o*cos(n)+l*sin(n),o*-sin(n)+l*cos(n)n,o,l=n*cos(f)+o*sin(f),n*-sin(f)+o*cos(f),l return n*cos(e)+l*sin(e),o,n*-sin(e)+l*cos(e)end function n3(n)return n>𝘩*m and n<nk*m end function nh(n)return n>q*m and n<n𝘸*m end function nz(n)return n>𝘦-200and n<𝘦+200end function n𝘤(n,e)local f=n if(n3(n-u))f=n-u
if(n3(n+u))f=n+u
local n=e if(nh(e-u))n=e-u
if(nh(e+u))n=e+u
return f,n end function n8(n,e,o,l,d,u,f)local c,f,t,n,e,i,o,l,d=f,band(n,-1),band(o,-1),band(e,-1),band(l,-1),band(d,-1),band(u,-1)if(n>e)n,e,f,t=e,n,t,f
if(n>o)n,o,f,i=o,n,i,f
if(e>o)e,o,t,i=o,e,i,t
if n~=e then local o,t,i,e=(i-f)/(o-n),(t-f)/(e-n),min(e,128)if(n>0)l,d,e=f,f,n else l,d,e=f-o*n,f-t*n,0
for n=e,i-1do rectfill(l,n,d,n,c)l+=o d+=t end else l,d=f,t end if o~=e then local u,i=(i-f)/(o-n),(i-t)/(o-e)n𝘥,eh=e,min(o,128)if(e<0)d,l,n𝘥=t-i*e,f-u*n,0
for n=n𝘥,eh do rectfill(l,n,d,n,c)d+=i l+=u end else rectfill(l,o,d,o,c)end end function 𝘢(e,f,n)return e*n𝘣/n+n𝘦,f*n𝘣/n+n𝘦 end function e5()local n,e,f=0,0,{}for o=s-h,0,-h do f[n]={}for l=0,s-h,h do local d,o=2,n0(l+h\2,o+h\2)d=f[n][(e-1)%c]and o-f[n][(e-1)%c]or o local l=1l=d>=0and 3or 11if(o==0)l=1
f[n][e]=o sset(p+e,p+n,l)e+=1end e=0n+=1end for n=0,1do for e=0,1do sset(p+e+13,p+n+14,7)end end end function e8()sspr(p,p,c,c,0,0,c+1,c+1)pset(𝘺\h,c+-𝘻\h,7)for n=1,#d do local n=d[n]local e,f=f(n.f),f(n.o)pset(e\h,c+-f\h,n.𝘢())end for n=24,s-1-24,48do for e=24,s-1-24,48do if(𝘱(e,n)==11)rectfill((e-24)/48*6,abs((n-24)/48*6-c),(e-24)/48*6+5+1,abs((n-24)/48*6+5-c+1),0)
end end end function es()n_()ex()rectfill(0,0,128,128,0)if nz(r[1][1]&255.99999)then local e={}for n=a*a-1,0,-1do local o,l=(n%a+𝘩)%s,(n\a+q)%s local c,u,i=n%a*m+𝘩*m,n0(o,l),n\a*m+q*m local f,t,d=c-𝘷,u-𝘦,i-𝘹 if n%a==0then f+=na*m elseif n%a==y then f+=na*m-m elseif n\a==0then d+=n2*m elseif n\a==y then d+=n2*m-m end f,t,d=n5(f,t,d)local d,r=𝘢(f,t,d)add(e,{f,t,i,d,r,o,l})if n%a~=0and n%a<a-1and n\a~=0then local n=𝘱(o,l)srand(o*l)if(n>0)g(𝘱(o,l),c,u,i,nil,nil,nil,nil,e7[n],nil,nil,nil,true,true)
end end for n=1,#e do if n%a~=0and n>a-1then local n,o,l,u=e[n+1],e[n-a+1],e[n],e[n-a]local e,f,d,t,i,c,o,l,n=n[4],n[5],o[4],o[5],l[4],l[5],u[4],u[5],e6(n[6],n[7],true)if((e-d)*(l-t)-(f-t)*(o-d)<0)n8(e,f,d,t,o,l,n)
if((o-i)*(f-c)-(l-c)*(e-i)<0)n8(o,l,i,c,e,f,n)
fillp()else if n%a==0then local n=abs((n-(y+1))\a-(y+1))if(n<y)for e=#w[n],1,-1do w[n][e]:𝘧()end
end end end else ng()end nc()end function ng()for n=#w,0,-1do for e=#w[n],1,-1do w[n][e]:𝘧()end end end function n_()for n=#z,1,-1do local n=z[n]n:𝘥()if(nh(n.s)and n3(n.v)and nz(n.e))n.𝘸=true add(w[abs(n.s-q*m)\m],n)else n.𝘸=false
end end function ex()𝘺,𝘻,na,n2=f(n.f),f(n.o),n.f/m%1,n.o/m%1𝘪,𝘩,nk,q,n𝘸=n0(𝘺,𝘻),𝘺-(a\2-1),a+𝘩-1,𝘻-(a\2-1),a+q-1end function n𝘨(n)for e=1,#n.x do local n=n.x[e]n[4],n[5]=𝘢(n[1],n[2],n[3])end for e=1,#n.𝘣 do local e=n.𝘣[e]local d=e[4]if(d&240>0)fillp(42405)else fillp()
local f,o,l=n.x[e[1]],n.x[e[2]],n.x[e[3]]local n,e,t=f[3],o[3],l[3]if n>nr or e>nr or t>nr then if n<nu and e<nu and t<nu then local e,t,n,o,f,l=f[4],f[5],o[4],o[5],l[4],l[5]if max(f,max(e,n))>0and min(f,min(e,n))<128then if((e-n)*(l-o)-(t-o)*(f-n)<0)n8(e,t,n,o,f,l,d)
end end end end fillp()end function e9(n)n.v,n.s=n𝘤(n.f,n.o)local e,f,o=n.v-𝘷,n.e-𝘦,n.s-𝘹 n.u,n.r,n.a=n5(e,f,o)end function ep(e)e.v,e.s=n𝘤(e.f,e.o)for o=1,#e.𝘨 do local n,f=e.x[o],e.𝘨[o]if(ev(e.𝘭,o))n[1],n[2],n[3]=ny(f[1],f[2],f[3],0,0,0)else n[1],n[2],n[3]=ny(f[1],f[2],f[3],e.d,e.l,e.𝘩)
n[1]+=e.v-𝘷 n[2]+=e.e-𝘦 n[3]+=e.s-𝘹 n[1],n[2],n[3]=n5(n[1],n[2],n[3])end end function em()for f=#z,1,-1do local n,e=z[f],false if n.g~=nil then n.g-=time()-n𝘧 if(n.g<0)e=true
end if n.m~=nil then if(n.m)e=true
end if not e then n:𝘫()e3(n)else deli(z,f)if(n.k~=nil)n.k.m=true
end end end function v(n,f,o)local e=𝘧(n.f,n.o)if n.e+n.t>e then n.e+=n.t n.f+=n.i n.o+=n.c n.t-=o*eb[e𝘢]else if(n.p~=nil and n:p())return true
if f then if(abs(n.t)<.1)n.t,n.i,n.c,n.e=0,0,0,e else n.t=-n.t/4
else n.t,n.i,n.c,n.e=0,0,0,e end end end function ev(e,f)local n=false for e in all(e)do if(e==f)n=true
end return n end function k(n,e,f,o,l,d,t,i,c,u,r,a)return n𝘩(0,n,e,f,0,0,0,i,c,t,o,l,d,r,false,u,a)end function g(n,e,f,o,l,d,t,i,c,u,r,a,h,s)return n𝘩(n,e,f,o,l,d,t,i,c,b,u,r,a,h,s)end function n𝘩(e,n,d,t,i,c,u,r,a,h,s,x,p,v,f,o,l)local n={𝘯=e,f=n,e=d,o=t,d=c or 0,l=i or 0,𝘩=u or 0,𝘫=r or b,𝘮=a or b,t=x or 0,i=s or 0,c=p or 0,g=o,𝘰=l,𝘨=𝘲[e][1],𝘣=𝘲[e][2],u=0,r=0,a=0,v=0,s=0,x={},𝘧=h or n𝘨,𝘬=v}f=f if e==0then n.𝘥=e9 if l then if(n4[𝘫]~=nil)n4[𝘫].m=true
n4[𝘫],𝘫=n,(𝘫+1)%el end if not n.𝘬 then n.k=k(n.f,𝘧(n.f,n.o),n.o,0,0,0,function(n)local n,e=𝘢(n.u,n.r,n.a)circfill(n,e,0,0)end,function(e)e.f,e.o=n.f,n.o+.05e.e=𝘧(n.f,n.o)if(n.e<=e.e)e.m=true
end,b,o,true)end else n.𝘥,n.𝘧=ep,n𝘨 if(not n.𝘬)n.k=g(e+1,0,0,0,0,0,0,function(e)e.f,e.o=n.f,n.o e.e,e.l=𝘧(n.f,n.o),n.l end,b,0,0,0,true)
end if(f)add(_,n)add(w[abs(n.o-q*m)\m],n)else add(z,n)
for e=1,#n.𝘨 do n.x[e]={}for f=1,3do n.x[e][f]=0end end n:𝘮()n:𝘥()return n end e_,ez,e𝘤,i,d,_,e,n𝘪,𝘳,ns,𝘥,e𝘥,nx,ne,n𝘫,n𝘬,nf,e𝘨,n𝘭,n𝘮,n7,𝘶,no,eg,e𝘧,n𝘯,j,e𝘩,𝘴,eb,e𝘢,n6,𝘨,ek,𝘲=peek(24388),0,0,{},{},{},1,1,0,0,100,0,3,3,time(),time(),false,false,0,0,false,0,0,split"11,4,15,10",split"6,7",split"2,4,10,3,5",{},{},{},split"1, 1.5, 2",1,0,1,split"40,200,200,200,200,200,200",{[0]={{{0,0,0}},{}}}for n=1742,1807,2do add(𝘲,n𝘻(%n))end e7={[8]=function(n)if(time()%3==0)k(n.f+rnd"10"-4,n.e+10+rnd"8",n.o+rnd"10"-4,0,0,0,function(n)local n,e=𝘢(n.u,n.r,n.a)circfill(n,e,0,5)end,function(n)n.e+=rnd"0.4"n.f+=rnd"0.4"-.2n.o+=rnd"0.4"-.2end,b,4,false,true)
end,[9]=function(n)n.𝘭,n.l=split"1,2,3,4",time()g(10,n.f,n.e,n.o,n.l,nil,nil,nil,nil,nil,nil,nil,true,true)end}pal(1,140,1)pal(13,134,1)pal(15,138,1)pal(2,131,1)function 𝘤()poke(24388,e_)end function 𝘸(n,e,d)local o,f,l=n.f-e.f,0,n.o-e.o if(d)f=n.e-e.e
local n=atan2(o,f)local n=o*cos(n)+f*sin(n)local e=atan2(n,l)return n*cos(e)+l*sin(e)end function n𝘰(e,f,o,n)local l=n and 32or 26local n=g(l,e,f,o,.25,0,0,function(n)v(n,false,0)𝘣(n,4,-1)n.l+=.03n.d+=.03n.i+=(i.f-n.f)/𝘸(i,n)*.06n.t+=(i.e-n.e)/𝘸(i,n)*.06n.c+=(i.o-n.o)/𝘸(i,n)*.06𝘵(n,4)n𝘱(n)end,function(e)e._,e.𝘢=function()return n and 150or 400end,function()return n and 8or 14end end)add(d,n)n.p=function()x(n,#d)end end function ee()add(j,function(n,e,f)local o={}for l=0,3do o[l]=k(n,e,f,0,0,0)end local n=g(4,n,e,f,0,0,0,function(n)local e=𝘧(n.f,n.o)n.l+=.01if n.𝘦 then if(n.e-1>e+20)n.e-=1
if(n.𝘪>30)for e=0,3do n.w[e].𝘧=b end n.𝘦,n.h=false,{rnd"2"-1,rnd"2"-1}
else 𝘣(n,4,-1)if(abs(e+50-n.e)>1)n.e+=sgn(e+50-n.e)*.5
n.o+=n.h[1]n.f+=n.h[2]if time()%30==0then if(e>20)n.𝘦,n.𝘪=true,0for e=0,3do n.w[e].𝘧=function(n)local n,f=𝘢(n.u,n.r,n.a)line(n,f,n+sgn(e-2)*3,f+5,10)end end
end end if e>0then if time()%.5==0then n.𝘪+=1if(n.𝘸)for e=0,7do srand(e*time())local n=k(n.f,n.e,n.o,rnd"4"-2,rnd"4",rnd"4"-2,function(n)local n,e=𝘢(n.u,n.r,n.a)circfill(n,e,0,8)end,function(n)v(n,true,.1)end,b,10)n.p=function(n)n.m=true n9(n.f,n.o)end end else for e=0,7do srand(e*time())n9(n.f+(rnd"14"-7)*m,n.o+(rnd"14"-7)*m)end
end end 𝘤()end,function(n)n.𝘢,n._,n.w=function()return 12end,function()for e=0,3do np(n.w[e])end if(n.𝘦)return 50
return 100end,o for e=0,3do n.w[e].𝘫=function(f)f.f,f.e,f.o=n.f+sgn(e-2)*10,n.e-8,n.o+(e%2-1)*10end end n.𝘦,n.𝘪,n.h=false,0,{rnd"2"-1,rnd"2"-1}end)add(d,n)end)add(j,function(n,e,f)local n=g(6,n,e,f,.25,0,0,function(n)local f=𝘧(n.f%u,n.o%u)srand(time())local e=𝘸(i,n)if e<600or n.j then 𝘣(n,4,-1)n𝘲(n,f,e)else if time()-n.q>.7then local e,f=n.f%u,n.o%u local e=sget(p+e\(h*m),p+c-f\(h*m))if e==4then if(flr(rnd"10")==1)n.𝘣,n.y,n.j=𝘲[16][2],.14,true
end end n.l+=(n.h-n.l)*.02+rnd"0.01"-.02n.f-=sin(n.l)*3n.o-=cos(n.l)*3if(time()%10==0)n.h=rnd"1"
end 𝘤()𝘵(n,4)end,function(n)n.j,n.y=false,.7n._,n.𝘢,n.q,n.h=function()if(n.j)return 500else return 300end,function()if(n.j)if(time()%.5<.25)return 8else return 9else return 9end,time(),rnd"1"end)add(d,n)n.p=function()x(n,#d)end end)add(j,function(n,e,f)local n=g(19,n,e,f,.25,0,0,function(n)𝘣(n,4,-1)local e=𝘧(n.f,n.o)n.l+=(n.h-n.l)*.02n.e=e+100n.f-=sin(n.l)*3n.o-=cos(n.l)*3if(time()%1==0)local n=k(n.f,n.e,n.o,0,0,0,function(n)local n,e=𝘢(n.u,n.r,n.a)spr(67,n,e)end,function(n)v(n,true,.2)end)n.p=function(e)e.m=true for e=-3,3do for f=-3,3do local e,f=e*m,f*m n9(n.f+e,n.o+f)end end end
end,function(n)n._,n.𝘢,n.h=function()return 800end,function()if(time()%.5<.25)return 12else return 0end,rnd"1"end)add(d,n)n.p=function()x(n,#d)end end)add(j,function(n,e,f)local n=g(21,n,e,f,.25,0,0,function(n)𝘣(n,4,-1)local e=n.e-𝘧(n.f,n.o)n𝘲(n,e)𝘵(n,4)end,function(n)n.y,n.b=.3,2n._,n.𝘢,n.q,n.h=function()if(n.b==0)return 700else n.𝘣,n.y=𝘲[23][2],.6return 200end,function()if(time()%.5<.25)return 10else return 0end,time(),rnd"1"end)add(d,n)n.p=function(n)x(n,#d)end end)add(j,function(n,e,f)n𝘰(n,e,f)end)add(j,function(n,e,f)local n=g(28,n,e,f,0,0,0,function(n)𝘣(n,4,-1)local e=𝘧(n.f,n.o)n.e=e+100n.l+=.01n.o+=n.h[1]n.f+=n.h[2]n.z.f,n.z.e,n.z.o=n.f,n.e,n.o end,function(n)n.𝘢,n.b=function()if(time()%.5<.25)return 8else return 0end,5n.z=k(0,0,0,0,0,0,function(n)local e=𝘸(n,i,true)if(e<100)local e,f=𝘢(n.u,n.r,n.a)local o,l=𝘢(i.x[1][1],i.x[1][2],i.x[1][3])srand(time()%2)local d,t=(e+o)/2+rnd(16)-8,(f+l)/2line(e,f,d,t,7)line(d,t,o,l)local n,e=n.f-i.f,n.e-i.e local f=sqrt(n*n+e*e)local f=1/f*.2i.i+=f*n i.t+=f*e
end)n._,n.h=function()if(n.b==0)n.z.m=true return 500else return 0end,{rnd"2"-1,rnd"2"-1}end)add(d,n)end)add(j,function(n,e,f)local n=g(30,n,e,f,.25,0,0,function(n)𝘣(n,4,-1)local e=𝘧(n.f,n.o)n.l+=(n.h-n.l)*.02n.e=e+300n.f-=sin(n.l)*3n.o-=cos(n.l)*3if time()%8==0then if(𝘸(n,i)<150)n𝘰(n.f,n.e,n.o,true)
end end,function(n)n._,n.𝘢,n.b,n.h=function()if(n.b==0)return 2000else return 0end,function()return 0end,25,rnd"1"end)add(d,n)n.p=function()x(n,#d)end end)local n=1for f=1808,1850,7do 𝘴[n]={}for e=0,6do for f=1,@(f+e)do add(𝘴[n],{ek[e+1],function()srand(𝘨)j[e+1](flr(rnd(u)),100,flr(rnd(u)))end})end end n+=1end e4()nl,nd=n𝘳,n𝘴 nv()end function e6(e,f)local o,d=n0(e,f),n𝘵(e,f)srand(f*e)local t,n=(e%4+f%4+flr((rnd"6")))%4+1,1if(o>0)n=10
if(o>15)n=eg[t]
if(o==l[1])n=e𝘧[(e%2+f%2+flr((rnd"2")))%2+1]
if d>=1then fillp(42405)local e=split"0x46, 0x44, 0x66"if(n==11)n=e[flr(rnd"3")+1]
if(n==4)n=136
local e=split"0x44,0x66,0x88"if(n==15)n=e[flr(rnd"3")+1]
if(n==10)n=138
else fillp()end 𝘤()return n end function n𝘵(n,e)return(r[n][e]&49152)>>>14end function n9(n,e)local f,o=n%u,e%u local n,e,l=f\m,o\m,𝘧(f,o)local d=n𝘵(n,e)if d==0and l>0and l~=68then r[n][e]+=16384sset(p+f\(h*m),p+c-o\(h*m),4)local f=𝘱(n,e)if(f==1)r[n][e]=r[n][e]&~16128|3840
if(f==13)r[n][e]=r[n][e]&~16128|4608
no+=.00002end end function n1()x(i)n7=true nx-=1n𝘮=time()end function np(n)n.m=true if(n.k~=nil)n.k.m=true
end function e𝘸()print("𝘢ttack 𝘸ave  "..e.." completed",18,60,7)print("𝘢rea infected  . . .     "..tostr(no,2),7,80,7)print("𝘢rea uninfected  . . .   "..tostr(𝘶,2),7,90,7)print("𝘣onus uninfected area .  "..tostr(ns,2),7,105,7)end function e𝘣()if time()-n𝘭>5then 𝘨=1e+=1if(e>7)reload()
nl,nd,z=n𝘳,n𝘴,{}np(i)nv()end end function e𝘦()if(#d==0)ns=max(0,(𝘶-no-no)/max(32/e,4))𝘳+=ns dset(0,max(dget(0),𝘳))nl,nd,n𝘭=e𝘸,e𝘣,time()
end function x(n,e)local f=𝘧(n.f,n.o)sfx(3,3)for e=0,15do srand(e)local e=n𝘯[flr(rnd"5")+1]if(f==0and n.e<=1)e=12-flr(rnd"2")*5
k(n.f,n.e,n.o+5,rnd"2"-1,rnd"4"+2,rnd"2"-1,function(n)local n,f=𝘢(n.u,n.r,n.a)circfill(n,f,0,e)end,function(n)v(n,true,.2)end,b,10,false,true)end 𝘤()np(n)deli(d,e)e𝘦()end function 𝘣(n,e,f)if(n.𝘸)sfx(e,f)
end function n𝘱(n)srand(n.f)if(time()%0x.08==0)k(n.f+rnd"16"-8,n.e+rnd"16"-8,n.o+5,0,0,0,function(n)local n,e=𝘢(n.u,n.r,n.a)circfill(n,e,0,5)end,b,b,3)
end function nm(n,f,e)local e,f=e or false,f or.2if 𝘥>0and e or not e then if(𝘥>0and e)𝘥-=.05
n.t+=f*cos(n.d)*cos(n.𝘩)n.i+=f*sin(n.l)*-sin(n.d)n.c+=f*-cos(n.l)*sin(n.d)local e,f,o=cos(n.d)*cos(n.𝘩),sin(n.l)*-sin(n.d),-cos(n.l)*sin(n.d)𝘣(n,0,1)if n.𝘸 then srand(time())for l=0,1do srand(l*time())k(n.f+rnd"8"-4,n.e+rnd"8"-4,n.o+rnd"8"+4+20,-f*4+rnd"2"-1+n.i,-e*4+n.t+rnd"2"-1,-o*4+rnd"2"-1+n.c,function(n)local f,o=𝘢(n.u,n.r,n.a)local e=7+rnd"1"*3if(n.g<.2)e=8
circfill(f,o,0,e)end,function(n)v(n,true,.1)end,function(e)e.e=n.e+.001end,.4)end 𝘤()end end end function n𝘶(n)local e,f,o=sin(n.d),sin(n.l)*cos(n.d),cos(n.l)*cos(n.d)𝘣(n,1,2)local n=k(n.f,n.e,n.o,10*-f+n.i,10*-e+n.t,10*-o+n.c,function(n)local n,e=𝘢(n.u,n.r,n.a)circfill(n,e,0,7)end,function(e)v(e,false,0)if(nb(e,n))e.g=-1
n𝘷(e)end,b,1)n.p=function(n)𝘣(n,2,1)n.m=true local f=𝘧(n.f,n.o)for e=0,5do srand(e*time())local e=12-flr(rnd"2")*5if(f>0)e=n𝘯[flr(rnd"5")+1]
k(n.f,n.e,n.o,rnd"2"-1,rnd"2",rnd"2"-1,function(n)local n,f=𝘢(n.u,n.r,n.a)circfill(n,f,0,e)end,function(n)v(n,true,.1)end,b,1,false,true)end 𝘤()end end function n𝘲(n,o,e)local f=e or 𝘸(i,n)v(n,false,.05)local l,e=-atan2(i.f-n.f,i.o-n.o),-atan2(f,i.e-n.e)if f>100then nm(n,.4)if(n.e-i.e<20or o<40)e=-.15else e=-.25
else if(n.e-i.e<3)nm(n,.2)e=0
if(time()-n.q>n.y)n𝘶(n)n.q=time()
end n.l+=(l+.25-n.l)*.3n.d+=(e-n.d)*.5end function nb(l,f,o)o,f=o or 1,f or l local e=d e[0]=i for n=#e,0,-1do if e[n].e~=f.e and e[n].f~=f.f then if 𝘸(l,e[n],true)<20then if n>0then if(d[n].b)d[n].b-=o
local e=d[n]._()nt(e>>16)n𝘹(d[n],e)sfx(3,3)if(not d[n].b or d[n].b<=0)x(d[n],n)
else 𝘥-=20end return true end end end return false end function n𝘹(n,e)if(e~=0)k(n.f,n.e,n.o,0,0,0,function(n)local n,f=𝘢(n.u,n.r,n.a)print(e,n,f,7)end,function(n)n.e+=.1end,b,5,false,true)
end function n𝘷(o)for n=#_,1,-1do if sqrt(abs(o.v-_[n].v)+abs(o.e-_[n].e)+abs(o.s-_[n].s))<5then _[n].i=o.i _[n].c=o.c _[n].t=o.t local e,f=f(_[n].v%u),f(_[n].s%u)local l=𝘱(e,f)if l==1or l==15then x(_[n])r[e][f]=r[e][f]&~16128|2048if(l==15)nt(.00062)n𝘹(o,"40")
end if(l==6)nt(.00062)x(_[n])r[e][f]=r[e][f]&~16128|2048
if(l==9)x(_[n])r[e][f]=r[e][f]&~16128|2816
if(l==13)x(_[n])r[e][f]=r[e][f]&~16128|3584
return true end end return false end function nt(n)𝘳+=n if(𝘳>n𝘪*.0763)n𝘪+=1nx+=1ne+=1
end function nv()i=g(2,118*m,0,118.5*m,.25,0,0,function(n)v(n,false,.12)if(nb(n))n1()
if(n𝘷(n))n1()
if n.e>𝘪 then if(btn"0")n.l+=.03
if(btn"1")n.l-=.03
if btn"2"then if(abs(n.d-.02)<.2)n.d-=.02
end if btn"3"then if(abs(n.d+.02)<.2)n.d+=.02
end if time()%.00002==0then if(n.e>200)srand(time())k(n.f+rnd"200"-100,n.e+rnd"200"-50,n.o+rnd"200"-100,0,0,0,function(n)local n,e=𝘢(n.u,n.r,n.a)circfill(n,e,0,7)end,b,b,3,true,true)
end else if(𝘪==l[1])𝘥=100
end if n.e<1200then if(btn"4")nm(n,.5,true)
end 𝘵(n,8)poke(24413,5)if btn"5"then if(time()-n𝘫>.1)n𝘶(n)nt(~0)n𝘫=time()
if not nf then if time()-n𝘬<.2then ne-=1if ne>=0then local n=g(24,n.f,n.e,n.o,n.l,n.d,0,function(e)v(e,false,0)local f,o=𝘸(e,e.𝘤),-atan2(e.v-e.𝘤.v,e.s-e.𝘤.s)e.l+=o-.25-e.l local f=atan2(f,e.e-e.𝘤.e)e.d+=f-e.d e.i-=sin(e.l)e.t-=sin(e.d)e.c-=cos(e.l)if(nb(e,n,2))x(e)
𝘵(e,10)n𝘱(e)end,function(n)n.g=10local e,f=0,32767for o=1,#d do local n=𝘸(n,d[o])if(n<f)e,f=o,n
end n.𝘤=d[e]end,n.i-sin(n.l)*15,n.t-sin(n.d)*15,n.c-cos(n.l)*15)n.p=function(n)x(n)end end end n𝘬,nf=time(),true end else if(nf)nf=false
end 𝘤()end)i.p,n=function(n)if(sqrt(n.i^2+n.t^2+n.c^2)>3or abs(n.d)>.03)n1()
end,i end function 𝘵(n,e)local f=sqrt(n.i^2+n.t^2+n.c^2)local e=f>e and e/f or 1n.i,n.t,n.c=e*n.i,e*n.t,e*n.c end function e𝘪()x(i)n1()end function n𝘴()if(n7)if(time()-n𝘮>5)n7=false nv()
em()n𝘧,_,𝘷,𝘹=time(),{},n.f,n.o-eo if(n.e>𝘪+50)𝘦=n.e-20else 𝘦=𝘪+30
n6+=1if 𝘨<#𝘴[e]+1then if(n6>=𝘴[e][𝘨][1])n6=0𝘴[e][𝘨][2]()𝘨+=1
end end function ew()rectfill(c+1,0,128,12,6)print("score",c+1+1,1,7)print(tostr(𝘳,2),c+1+1,7,7)for n=1,ne do spr(65,58+n*5+3,5)end for n=1,nx do spr(64,58+n*5,0)end print("wave",c+1+58,1,7)print(e,c+1+58,7,7)print("best",c+1+78,1,7)print(tostr(dget(0),2),c+1+78,7,7)rectfill(c,14,𝘥+c,14,10)rectfill(c,16,i.e/7+c,16,11)end function n𝘳()es()ew()e8()end nd,nl=e0,ef function _init()cartdata"marcospiv_prion_dev"en()end function _update()nd()end function _draw()nl()end
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
93501750b8504e50ef502660c7604b60301000000000004010100000000050401010000000104020405010001040204050200000000000000010000000000000
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
00000000000000000000000000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000166321a6321a632196321763213632106320f6221162214622176221862218622166221562212622106120a6120661204612036120361202602016020160200602006020060202000010000100001000
000100001a6502365029450377502475019750147500b750077500575003750027500175001750017500000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101000021650294502a6501f15017650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3109000005133386321f63218632136320f6320c6320a632086220661205612046120361202612016120061200600006000060000600006000060000600316002e6002b60028600236001d600176000d60008600
001000000f1300f1300f1300f1300f1200f1200f1100f1100f1000f1000f1000f1000f10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__meta:title__

7910 tokens

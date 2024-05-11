pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
local d,e,l=split"50,35,85",1,split"90,50,180"function ed()for f=0,x-1do cls()a[f]={}for l=0,x-1do a[f][l]=0local n,c=l/240,f/240local o,t,i,u,n=cos(n)*1,cos(c)*1,sin(n)*1,sin(c)*1,0local r,c=o*cos(.15)-t*sin(.35),o*cos(.15)-t*sin(.15)n=abs(sin(o/4+sin(i/15)))*d[e]n+=abs(sin(u/4+sin(i/15)))*45n+=abs(sin(r/4+sin(t/30)))*35n+=abs(sin(c/4+sin(i/30)))*d[e]n+=abs(sin(c/4+sin(o/30)))*35n+=abs(sin(c/4+sin(u/30)))*d[e]n-=145if(n<=0)n=0else Y+=.00002
a[f][l]|=n&255.99999end end for n=0,x-1do for e=0,x-1do srand(e*n)if(flr(rnd(22))==1and a[e][n]>4)a[e][n]=a[e][n]&~16128|256
if(flr(rnd(44))==2and a[e][n]>4)a[e][n]=a[e][n]&~16128|3328
end end for n=0,8do for f=0,8do a[f+114][n+114]=l[e]Y-=.00002end end for n=24,x-1-24,48do for e=24,x-1-24,48do a[e][n]|=2304end end end function e1(n)local e,o=n+1,peek(n)local l,f=peek(e+o),e+o+1local n,d=f+l,{}for f=0,o-3,3do add(d,{(peek(e+f)-peek(n))*peek(n+3),(peek(e+f+1)-peek(n+1))*peek(n+3),(peek(e+f+2)-peek(n+2))*peek(n+3)})end local e={}for n=0,l-4,4do add(e,{peek(f+n),peek(f+n+1),peek(f+n+2),peek(f+n+3)})end local n={peek(n),peek(n+1),peek(n+2),peek(n+3)}return{d,e,n}end n4,E,f,nB=10,0,i function et()music(0)i=g(2,0,0,500,0,0,0)end function ei()i.l-=.02i.d+=.05if(i.o-n4>40)i.o-=n4
if(i.o>1000)ec()
if(btn(5))n4,nB=-40,true
end function eu()rectfill(0,0,128,128,0)nE()nw()n5()rectfill(0,0,128,8,6)print("prion",12,2,8)print("tpnk_dev 2024",47,2,7)print("🅾️thrust",20,100,8)print("❎ cannon",56,97,8)print("❎+❎ missile",56,103,8)print("<press ❎ to continue>",20,110,7)if(nB)rectfill(0,80,128,128,0)print("loading terrain...",30,110,7)
end nj,x,u,a,K,nq,ny,y,z,r=time(),241,0,{},-33,33,1000,0,12h,c=z+1,30p,v,nz,nC,eG,n3,n8,Z,E,nn,er,nD,nG,nH,f,n0,ne,nh,ns,L,w,C,n7,M,ea=128-ceil(c/8)*8,20,80,63,63,-3,-300,0,0,0,125,0,.5,0,nil,0,0,0,0,0,{},{},{},0,30N,O,P,Q,R,nf=sin(nD),sin(nG),sin(nH),cos(nD),cos(nG),cos(nH)e2,e4,e5,e3,e8,eh,es,e7,ex,b=nf*R,-P,nf*O,Q*P*R+N*O,Q*nf,Q*P*O-N*R,N*P*R-Q*O,N*nf,N*P*O+Q*R,function()end function n5()for n=0,z-1do w[n]={}end end n5()function nI()ed()local n=x-1u,r=x*v,n/c e6()end function e9(n)n.f%=u n.o%=u end function G(n)return n\v end function eH(e,f,n)return(1-n)*e+n*f end function eI(n,e)return n.f-e.f,n.e-e.e,n.o-e.o end function F(n,e)return a[n%u\v][e%u\v]&255.99999end function S(n,e)return(a[n][e]&16128)>>>8end function no(n,e)return a[n][e]&255.99999end function nx(n,e,f)return n*e2+e*e4+f*e5,n*e3+e*e8+f*eh,n*es+e*e7+f*ex end function nJ(d,o,l,n,e,f)local n,o,l=d,o*cos(n)+l*sin(n),o*-sin(n)+l*cos(n)n,o,l=n*cos(f)+o*sin(f),n*-sin(f)+o*cos(f),l return n*cos(e)+l*sin(e),o,n*-sin(e)+l*cos(e)end function n6(n)return n>K*v and n<nq*v end function n9(n)return n>y*v and n<ny*v end function nK(n)return n>E-200and n<E+200end function nL(n,e)local f=n if(n6(n-u))f=n-u
if(n6(n+u))f=n+u
local n=e if(n9(e-u))n=e-u
if(n9(e+u))n=e+u
return f,n end function np(n,e,o,l,d,u,f)local c,f,t,n,e,i,o,l,d=f,band(n,-1),band(o,-1),band(e,-1),band(l,-1),band(d,-1),band(u,-1)if(n>e)n,e,f,t=e,n,t,f
if(n>o)n,o,f,i=o,n,i,f
if(e>o)e,o,t,i=o,e,i,t
if n~=e then local o,t,i,e=(i-f)/(o-n),(t-f)/(e-n),min(e,128)if(n>0)l,d,e=f,f,n else l,d,e=f-o*n,f-t*n,0
for n=e,i-1do rectfill(l,n,d,n,c)l+=o d+=t end else l,d=f,t end if o~=e then local u,i=(i-f)/(o-n),(i-t)/(o-e)nM,ep=e,min(o,128)if(e<0)d,l,nM=t-i*e,f-u*n,0
for n=nM,ep do rectfill(l,n,d,n,c)d+=i l+=u end else rectfill(l,o,d,o,c)end end function m(e,f,n)return e*nz/n+nC,f*nz/n+nC end function e6()local n,e,f=0,0,{}for o=x-r,0,-r do f[n]={}for l=0,x-r,r do local d,o=2,no(l+r\2,o+r\2)d=f[n][(e-1)%c]and o-f[n][(e-1)%c]or o local l=1l=d>=0and 3or 11if(o==0)l=1
f[n][e]=o sset(p+e,p+n,l)e+=1end e=0n+=1end for n=0,1do for e=0,1do sset(p+e+13,p+n+14,7)end end end function e_()sspr(p,p,c,c,0,0,c+1,c+1)pset(n0\r,c+-ne\r,7)for n=1,#s do local n=s[n]local e,f=G(n.f),G(n.o)pset(e\r,c+-f\r,n.b())end for n=24,x-1-24,48do for e=24,x-1-24,48do if(S(e,n)==11)rectfill((e-24)/48*6,abs((n-24)/48*6-c),(e-24)/48*6+5+1,abs((n-24)/48*6+5-c+1),0)
end end end function ev()nE()eb()rectfill(0,0,128,128,0)if nK(a[1][1]&255.99999)then local e={}for n=h*h-1,0,-1do local o,l=(n%h+K)%x,(n\h+y)%x local c,u,i=n%h*v+K*v,no(o,l),n\h*v+y*v local f,t,d=c-Z,u-E,i-nn if n%h==0then f+=nh*v elseif n%h==z then f+=nh*v-v elseif n\h==0then d+=ns*v elseif n\h==z then d+=ns*v-v end f,t,d=nx(f,t,d)local d,r=m(f,t,d)add(e,{f,t,i,d,r,o,l})if n%h~=0and n%h<h-1and n\h~=0then local n=S(o,l)srand(o*l)if(n>0)g(S(o,l),c,u,i,nil,nil,nil,nil,em[n],nil,nil,nil,true,true)
end end for n=1,#e do if n%h~=0and n>h-1then local n,o,l,u=e[n+1],e[n-h+1],e[n],e[n-h]local e,f,d,t,i,c,o,l,n=n[4],n[5],o[4],o[5],l[4],l[5],u[4],u[5],eA(n[6],n[7],true)if((e-d)*(l-t)-(f-t)*(o-d)<0)np(e,f,d,t,o,l,n)
if((o-i)*(f-c)-(l-c)*(e-i)<0)np(o,l,i,c,e,f,n)
fillp()else if n%h==0then local n=abs((n-(z+1))\h-(z+1))if(n<z)for e=#w[n],1,-1do w[n][e]:k()end
end end end else nw()end n5()end function nw()for n=#w,0,-1do for e=#w[n],1,-1do w[n][e]:k()end end end function nE()for n=#C,1,-1do local n=C[n]n:z()if(n9(n.p)and n6(n.v)and nK(n.e))n.F=true add(w[abs(n.p-y*v)\v],n)else n.F=false
end end function eb()n0,ne,nh,ns=G(f.f),G(f.o),f.f/v%1,f.o/v%1L,K,nq,y,ny=no(n0,ne),n0-(h\2-1),h+K-1,ne-(h\2-1),h+y-1end function nN(n)for e=1,#n.h do local n=n.h[e]n[4],n[5]=m(n[1],n[2],n[3])end for e=1,#n.W do local e=n.W[e]local d=e[4]if(d&240>0)fillp(42405)else fillp()
local f,o,l=n.h[e[1]],n.h[e[2]],n.h[e[3]]local n,e,t=f[3],o[3],l[3]if n>n8 or e>n8 or t>n8 then if n<n3 and e<n3 and t<n3 then local e,t,n,o,f,l=f[4],f[5],o[4],o[5],l[4],l[5]if max(f,max(e,n))>0and min(f,min(e,n))<128then if((e-n)*(l-o)-(t-o)*(f-n)<0)np(e,t,n,o,f,l,d)
end end end end fillp()end function ek(n)n.v,n.p=nL(n.f,n.o)local e,f,o=n.v-Z,n.e-E,n.p-nn n.c,n.u,n.r=nx(e,f,o)end function eg(e)e.v,e.p=nL(e.f,e.o)for o=1,#e.C do local n,f=e.h[o],e.C[o]if(eF(e.K,o))n[1],n[2],n[3]=nJ(f[1],f[2],f[3],0,0,0)else n[1],n[2],n[3]=nJ(f[1],f[2],f[3],e.d,e.l,e.D)
n[1]+=e.v-Z n[2]+=e.e-E n[3]+=e.p-nn n[1],n[2],n[3]=nx(n[1],n[2],n[3])end end function eW()for f=#C,1,-1do local n,e=C[f],false if n.A~=nil then n.A-=time()-nj if(n.A<0)e=true
end if n.x~=nil then if(n.x)e=true
end if not e then n:I()e9(n)else deli(C,f)if(n.g~=nil)n.g.x=true
end end end function _(n,f,o)local e=F(n.f,n.o)if n.e+n.t>e then n.e+=n.t n.f+=n.i n.o+=n.a n.t-=o*eB[nO]else if(n.s~=nil and n:s())return true
if f then if(abs(n.t)<.1)n.t,n.i,n.a,n.e=0,0,0,e else n.t=-n.t/4
else n.t,n.i,n.a,n.e=0,0,0,e end end end function eF(e,f)local n=false for e in all(e)do if(e==f)n=true
end return n end function k(n,e,f,o,l,d,t,i,c,u,r,a)return nP(0,n,e,f,0,0,0,i,c,t,o,l,d,r,false,u,a)end function g(n,e,f,o,l,d,t,i,c,u,r,a,h,s)return nP(n,e,f,o,l,d,t,i,c,b,u,r,a,h,s)end function nP(e,n,d,t,i,c,u,r,a,h,s,x,p,_,f,o,l)local n={M=e,f=n,e=d,o=t,d=c or 0,l=i or 0,D=u or 0,I=r or b,L=a or b,t=x or 0,i=s or 0,a=p or 0,A=o,N=l,C=T[e][1],W=T[e][2],c=0,u=0,r=0,v=0,p=0,h={},k=h or nN,J=_}f=f if e==0then n.z=ek if l then if(n7[M]~=nil)n7[M].x=true
n7[M],M=n,(M+1)%ea end if not n.J then n.g=k(n.f,F(n.f,n.o),n.o,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,0)end,function(e)e.f,e.o=n.f,n.o+.05e.e=F(n.f,n.o)if(n.e<=e.e)e.x=true
end,b,o,true)end else n.z,n.k=eg,nN if(not n.J)n.g=g(e+1,0,0,0,0,0,0,function(e)e.f,e.o=n.f,n.o e.e,e.l=F(n.f,n.o),n.l end,b,0,0,0,true)
end if(f)add(A,n)add(w[abs(n.o-y*v)\v],n)else add(C,n)
for e=1,#n.C do n.h[e]={}for f=1,3do n.h[e][f]=0end end n:L()n:z()return n end eE,eJ,eK,i,s,A,n,nQ,U,n_,H,eL,nl,nd,nv,nR,nS,n1,eM,nT,nU,nb,Y,nt,ew,ej,nV,o,eN,I,eB,nO,nm,V,eq,T=peek(24388),0,0,{},{},{},1,1,0,0,100,0,3,3,0,time(),time(),false,false,0,0,false,0,0,split"11,4,15,10",split"6,7",split"2,4,10,3,5",{},{},{},split"1, 1.3, 1.7",1,0,1,split"40,200,200,200,200,200,200",{[0]={{{0,0,0}},{}}}for n=1742,1807,2do add(T,e1(%n))end em={[8]=function(n)if(time()%3==0)k(n.f+rnd"10"-4,n.e+10+rnd"8",n.o+rnd"10"-4,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,5)end,function(n)n.e+=rnd"0.4"n.f+=rnd"0.4"-.2n.o+=rnd"0.4"-.2end,b,4,false,true)
end,[9]=function(n)n.K,n.l=split"1,2,3,4",time()g(10,n.f,n.e,n.o,n.l,nil,nil,nil,nil,nil,nil,nil,true,true)end}pal(1,140,1)pal(13,134,1)pal(15,138,1)pal(2,131,1)function D()poke(24388,eE)end function ni(n,e)local n,e=n.f-e.f,n.o-e.o if(abs(n)>2410)n-=sgn(n)*4820
if(abs(e)>2410)e-=sgn(e)*4820
return n,e end function j(e,f,d)local o,l=ni(e,f)local n=0if(d)n=e.e-f.e
local e=atan2(o,n)local n=o*cos(e)+n*sin(e)local e=atan2(n,l)return n*cos(e)+l*sin(e)end function nX(e,f,o,n)local l=n and 32or 26local n=g(l,e,f,o,.25,0,0,function(n)_(n,false,0)q(n,6,-1)n.l+=.03n.d+=.03local f,o=ni(i,n)local e=j(i,n)n.i+=f/e*.06n.t+=(i.e-n.e)/e*.06n.a+=o/e*.06X(n,4)nY(n)end,function(e)e.m,e.b=function()return n and 150or 400end,function()return n and 8or 14end end)add(s,n)n.s=function()J(n,1000)end end function nc(n,e)local f=F(n.f,n.o)n.e+=sgn(f+e-n.e)*.5end function W()return sgn(rnd"2"-1)end function ec()music(-1,500)add(o,function(n,e,f)local o={}for l=0,3do o[l]=k(n,e,f,0,0,0)end local l,d=.5*W(),.87*W()local n=g(4,n,e,f,0,0,0,function(n)local e=F(n.f,n.o)n.l+=.01if n.B then if(n.e-1>e+20)n.e-=1
if(n.G>30)for e=0,3do n.E[e].k=b end n.B=false
else q(n,4,-1)nc(n,50)n.f+=l n.o+=d if time()%30==0then if(e>20)n.B,n.G=true,0for e=0,3do n.E[e].k=function(n)local n,f=m(n.c,n.u,n.r)line(n,f,n+sgn(e-2)*3,f+5,10)end end
end end if e>0then if time()%.5==0then n.G+=1if(n.F)for e=0,7do srand(e*time())local n=k(n.f,n.e,n.o,rnd"4"-2,rnd"4",rnd"4"-2,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,8)end,function(n)_(n,true,.1)end,b,10,false,true)n.s=function(n)n.x=true nA(n.f,n.o)end end else for e=0,7do srand(e*time())nA(n.f+(rnd"14"-7)*v,n.o+(rnd"14"-7)*v)end
end end D()end,function(n)n.b,n.m,n.E=function()return 12end,function()for e=0,3do nk(n.E[e])end if(n.B)return 50
return 100end,o for e=0,3do n.E[e].I=function(f)f.f,f.e,f.o=n.f+sgn(e-2)*10,n.e-8,n.o+(e%2-1)*10end end n.B,n.G=false,0end)add(s,n)end)add(o,function(n,e,f)local o,l=.5*W(),.87*W()local n=g(6,n,e,f,.25,0,0,function(n)srand(time())local e=j(i,n)if e<600or n.w then nZ(n,n.e-F(n.f,n.o),e)else if time()-n.j>.7then local e,f=n.f%u,n.o%u local e=sget(p+e\(r*v),p+c-f\(r*v))if e==4then if(flr(rnd"100")==1)n.W,n.q,n.w=T[16][2],.14,true
end end n.l=.917n.f+=o n.o+=l end D()X(n,4)end,function(n)n.w,n.q=false,.7n.m,n.b,n.j=function()if(n.w)return 500else return 300end,function()if(n.w)if(time()%.5<.25)return 8else return 9else return 9end,time()end)add(s,n)n.s=function()J(n,1000)end end)add(o,function(n,o,l)local e,f=1.5*W(),2.61*W()local d=-atan2(e,f)+.25local n=g(19,n,o,l,.25,0,0,function(n)q(n,5,-1)nc(n,100)n.f+=e n.o+=f if(time()%1==0)local n=k(n.f,n.e,n.o,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)spr(67,n,e)end,function(n)_(n,true,.2)end)n.s=function(e)e.x=true for e=-3,3do for f=-3,3do local e,f=e*v,f*v nA(n.f+e,n.o+f)end end end
end,function(n)n.m,n.b,n.l=function()return 800end,function()if(time()%.5<.25)return 12else return 0end,d end)add(s,n)n.s=function()J(n,1000)end end)add(o,function(n,e,f)local n=g(21,n,e,f,.25,0,0,function(n)nZ(n,n.e-F(n.f,n.o))X(n,4)end,function(n)n.q,n._=.3,2n.m,n.b,n.j=function()if(n._<=0)return 700else n.W,n.q=T[23][2],.6return 200end,function()if(time()%.5<.25)return 10else return 0end,time()end)add(s,n)n.s=function()J(n,1000)end end)add(o,function(n,e,f)nX(n,e,f)end)add(o,function(n,e,f)local o,l=.5*W(),.87*W()local n=g(28,n,e,f,0,0,0,function(n)q(n,8,-1)nc(n,50)n.l+=.01n.f+=o n.o+=l n.y.f,n.y.e,n.y.o=n.f,n.e,n.o end,function(n)n.b,n._=function()if(time()%.5<.25)return 8else return 0end,5n.y=k(0,0,0,0,0,0,function(n)local e=j(n,i,true)if(e<100)q(n,9,1)local e,f=m(n.c,n.u,n.r)local o,l=m(i.h[1][1],i.h[1][2],i.h[1][3])srand(time()%2)local d,t=(e+o)/2+rnd(16)-8,(f+l)/2line(e,f,d,t,7)line(d,t,o,l)local n,e=n.f-i.f,n.e-i.e local f=sqrt(n*n+e*e)local f=1/f*.2i.i+=f*n i.t+=f*e
end)n.m=function()if(n._<=0)n.y.x=true return 1000else return 0end end)add(s,n)end)add(o,function(n,e,f)local o,l,d=1.5*W(),2.61*W(),-atan2(eO,eP)-.25local n=g(30,n,e,f,.25,0,0,function(n)nc(n,300)n.f+=o n.o+=l if time()%8==0then if(j(n,i)<150)nX(n.f,n.e,n.o,true)
end end,function(n)n.m,n.b,n._,n.l=function()if(n._<=0)return 2000else return 0end,function()return 0end,25,d end)add(s,n)n.s=function(n)J(n,1000)end end)local n=1for f=1808,1878,7do I[n]={}for e=0,6do for f=1,@(f+e)do local f=20*n*(e+1)*f add(I[n],{eq[e+1],function()srand(f)o[e+1](flr(rnd(u)),300,flr(rnd(u)))end})end end n+=1end nI()nu,nr=en,e0 ng()end function eA(f,o)local d,t=no(f,o),ee(f,o)srand(o*f)local i,n=(f%4+o%4+flr((rnd"6")))%4+1,1if(d>0)n=10
if(d>15)n=ew[i]
if(d==l[e])n=ej[(f%2+o%2+flr((rnd"2")))%2+1]
if t>=1then fillp(42405)local e=split"0x46, 0x44, 0x66"if(n==11)n=e[flr(rnd"3")+1]
if(n==4)n=136
local e=split"0x44,0x66,0x88"if(n==15)n=e[flr(rnd"3")+1]
if(n==10)n=138
else fillp()end D()return n end function ee(n,e)return(a[n][e]&49152)>>>14end function nA(n,f)local o,d=n%u,f%u local n,f,t=o\v,d\v,F(o,d)local i=ee(n,f)if i==0and t>0and t~=l[e]then a[n][f]+=16384sset(p+o\(r*v),p+c-d\(r*v),4)local e=S(n,f)if(e==1)a[n][f]=a[n][f]&~16128|3840
if(e==13)a[n][f]=a[n][f]&~16128|4608
nt+=.00002end end function na()B(i)nb=true nl-=1if(nl<0)extcmd"reset"
nU=time()end function nk(n)n.x=true if(n.g~=nil)n.g.x=true
end function ey()print("Attack Wave  "..n.." completed",18,60,7)print("Area infected  . . .     "..tostr(nt,2),7,80,7)print("Area uninfected  . . .   "..tostr(Y,2),7,90,7)print("Bonus uninfected area .  "..tostr(n_,2),7,105,7)end function ez()if time()-nT>5then V=1n+=1nv=0if(n>10)extcmd"reset"
if(n==5or n==7)e+=1nO+=1nI()
nu,nr,C=en,e0,{}nk(i)ng()end end function eC()if(nv>=#I[n])n_=max(0,(Y-nt-nt)/max(32/n,4))U+=n_ dset(0,max(dget(0),U))sfx(7,3)nu,nr,nT=ey,ez,time()
end function B(n)local f=F(n.f,n.o)sfx(3,2)for e=0,2do srand(e)k(n.f+rnd"10"-4,n.e+10+rnd"8",n.o+rnd"10"-4,0,0,0,function(n)local n,f=m(n.c,n.u,n.r)for o=0,7do srand(o*e)circfill(n+rnd"5"-4,f+rnd"5"-4,0,5)end end,function(n)n.e+=rnd"0.4"n.f+=rnd"0.4"-.2n.o+=rnd"0.4"-.2end,b,4,false,true)end for e=0,5do srand(e)local e=nV[flr(rnd"5")+1]if(f==0and n.e<=1)e=12-flr(rnd"2")*5
k(n.f,n.e,n.o+5,rnd"2"-1,rnd"4"+2,rnd"2"-1,function(n)local n,f=m(n.c,n.u,n.r)circfill(n,f,0,e)end,function(n)_(n,true,.2)end,b,10,false,true)end D()nk(n)del(s,n)eC()end function q(n,e,f)if(n.F)sfx(e,f)
end function nY(n)srand(n.f)if(time()%0x.02==0)k(n.f+rnd"16"-8,n.e+rnd"16"-8,n.o+5,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,5)end,b,b,3)
end function nF(n,f,e)local e,f=e or false,f or.2if H>0and e or not e then if(H>0and e)H-=.05
n.t+=f*cos(n.d)*cos(n.D)n.i+=f*sin(n.l)*-sin(n.d)n.a+=f*-cos(n.l)*sin(n.d)local e,f,o=cos(n.d)*cos(n.D),sin(n.l)*-sin(n.d),-cos(n.l)*sin(n.d)q(n,0,1)if n.F then srand(time())for l=0,1do srand(l*time())k(n.f+rnd"8"-4,n.e+rnd"8"-4,n.o+rnd"8"+4+20,-f*4+rnd"2"-1+n.i,-e*4+n.t+rnd"2"-1,-o*4+rnd"2"-1+n.a,function(n)local f,o=m(n.c,n.u,n.r)local e=7+rnd"1"*3if(n.A<.2)e=8
circfill(f,o,0,e)end,function(n)_(n,true,.1)end,function(e)e.e=n.e+.001end,.4)end D()end end end function ef(n)local e,f,o=sin(n.d),sin(n.l)*cos(n.d),cos(n.l)*cos(n.d)q(n,1,3)local n=k(n.f,n.e,n.o,10*-f+n.i,10*-e+n.t,10*-o+n.a,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,7)end,function(e)_(e,false,0)if(nW(e,n))e.A=-1
eo(e)end,b,1)n.s=function(n)q(n,2,1)n.x=true local f=F(n.f,n.o)for e=0,2do srand(e*time())local e=12-flr(rnd"2")*5if(f>0)e=nV[flr(rnd"5")+1]
k(n.f,n.e,n.o,rnd"2"-1,rnd"2",rnd"2"-1,function(n)local n,f=m(n.c,n.u,n.r)circfill(n,f,0,e)end,function(n)_(n,true,.1)end,b,1,false,true)end D()end end function nZ(n,f,e)local o=e or j(i,n)_(n,false,.05)local e,l=ni(i,n)local l,e=-atan2(e,l),-atan2(o,i.e-n.e)if o>100then nF(n,.4)if(n.e-i.e<20or f<60)e=-.15else e=-.25
else if(n.e-i.e<3or f<60)nF(n,.2)e=0
if(time()-n.j>n.q)ef(n)n.j=time()
end n.l+=(l+.25-n.l)*.3n.d+=(e-n.d)*.5end function J(n,e)if(n._)n._-=e
local e=n.m()n2(e>>16)el(n,e)sfx(10,3)nv+=1if(not n._ or n._<=0)B(n)
end function nW(l,f,o)o,f=o or 1,f or l local n=s n[0]=i for e=#n,0,-1do if n[e].e~=f.e and n[e].f~=f.f then if j(l,n[e],true)<20then if(e>0)J(s[e],o)else H-=20
return true end end end return false end function el(n,e)if(e~=0)k(n.f,n.e,n.o,0,0,0,function(n)local n,f=m(n.c,n.u,n.r)print(e,n,f,7)end,function(n)n.e+=.1end,b,5,false,true)
end function eo(o)for n=#A,1,-1do if sqrt(abs(o.v-A[n].v)+abs(o.e-A[n].e)+abs(o.p-A[n].p))<5then A[n].i=o.i A[n].a=o.a A[n].t=o.t local e,f=G(A[n].v%u),G(A[n].p%u)local l=S(e,f)if l==1or l==15then B(A[n])a[e][f]=a[e][f]&~16128|2048if(l==15)n2(.00062)el(o,"40")
end if(l==6)n2(.00062)B(A[n])a[e][f]=a[e][f]&~16128|2048
if(l==9)B(A[n])a[e][f]=a[e][f]&~16128|2816
if(l==13)B(A[n])a[e][f]=a[e][f]&~16128|3584
return true end end return false end function n2(n)U+=n if(U>nQ*.0763)nQ+=1nl+=1nd+=1
end function ng()i=g(2,118*v,0,118.5*v,.25,0,0,function(n)_(n,false,.12)if(nW(n))na()
if(eo(n))na()
if n.e>L then if(btn"0")n.l+=.03
if(btn"1")n.l-=.03
if btn"2"then if(abs(n.d-.02)<.2)n.d-=.02
end if btn"3"then if(abs(n.d+.02)<.2)n.d+=.02
end if time()%.00002==0then if(n.e>200)srand(time())k(n.f+rnd"200"-100,n.e+rnd"200"-50,n.o+rnd"200"-100,0,0,0,function(n)local n,e=m(n.c,n.u,n.r)circfill(n,e,0,7)end,b,b,3,true,true)
end else if(L==l[e])H=100
end if n.e<1200then if(btn"4")nF(n,.5,true)
end X(n,8)poke(24413,5)if btn"5"then if(time()-nR>.1)ef(n)n2(~0)nR=time()
if not n1 then if time()-nS<.2then nd-=1if nd>=0then local n=g(24,n.f,n.e,n.o,n.l,n.d,0,function(e)_(e,false,0)local f,o,l=j(e,e.H),ni(e,e.H)local o=-atan2(o,l)e.l+=o-.25-e.l local f=atan2(f,e.e-e.H.e)e.d+=f-e.d e.i-=sin(e.l)e.t-=sin(e.d)e.a-=cos(e.l)if(nW(e,n,100))B(e)
X(e,8)nY(e)end,function(n)n.A=10local e,f=0,32767for o=1,#s do local n=j(n,s[o])if(n<f)e,f=o,n
end n.H=s[e]end,n.i-sin(n.l)*35,n.t-sin(n.d)*35,n.a-cos(n.l)*35)n.s=function(n)B(n)end end end nS,n1=time(),true end else if(n1)n1=false
end D()end)i.s,f=function(n)if(sqrt(n.i^2+n.t^2+n.a^2)>3or abs(n.d)>.03)na()
end,i end function X(n,e)local f=sqrt(n.i^2+n.t^2+n.a^2)local e=f>e and e/f or 1n.i,n.t,n.a=e*n.i,e*n.t,e*n.a end function eQ()B(i)na()end function e0()if(nb)if(time()-nU>5)nb=false ng()
eW()nj,A,Z,nn=time(),{},f.f,f.o-er if(f.e>L+50)E=f.e-20else E=L+30
nm+=1if V<#I[n]+1then if(nm>=I[n][V][1])nm=0I[n][V][2]()V+=1
end end function eD()rectfill(c+1,0,128,12,6)print("score",c+1+1,1,7)print(tostr(U,2),c+1+1,7,7)for n=1,nd do spr(65,58+n*5+3,5)end for n=1,nl do spr(64,58+n*5,0)end print("wave",c+1+58,1,7)print(n,c+1+58,7,7)print("best",c+1+78,1,7)print(tostr(dget(0),2),c+1+78,7,7)rectfill(c,14,H+c,14,10)rectfill(c,16,i.e/7+c,16,11)end function en()ev()eD()e_()end nr,nu=ei,eu function _init()cartdata"marcospiv_prion_v1_1_2"et()end function _update()nr()end function _draw()nu()end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000
00000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000006777777777600067777777777000077777776600006677766600000677776000077660000000000000000
00000000000000000000000000000000000000000006777777777660067777777777600077777776600067777777660070677777600077660000000000000000
00000000000000000000000000000000000000000006777777777660067777777777600077777776600667777777766000677777600077660000000000000000
00000000000000000000000000000000000000000006777777777760067776666777760077777776600677777777776600677777600077660000000000000000
00000000000000000000000000000000000000000006777606677766067776066777760000677600006777766667776600677777760077660000000000000000
00000000000000000000000000000000000000000006777600067776067776000677760000677600006777660006777660677777776077660000000000000000
00000000000000000000000000000000000000000006777606677776067776066777700000677600007777600000677760677767776077660000000000000000
00000000000000000000000000000000000000000006777606677776067776066777600000677600007776600000677760677767776077660000000000000000
00000000000000000000000000000000000000000006777777777760067777777776600000677600007776000000677760677766777677660000000000000000
00000000000000000000000000000000000000000006777777777660067777777766000000677600007776000000677760677766777777660000000000000000
00000000000000000000000000000000000000000006777666666600067777777760000000677600007776000000677660677760677777660000000000000000
00000000070000000000000000000000000000000006776600000000067776067766000000677600006776600006777600677760677777660000000000000000
00000000000000000000000000000000000000000006776600000000067776067766000000677600006777660006777600677760677777660000000000000000
00000000000000000000000000000007000000000006776600000000067776067776600000677600006777766667777600677760067777660000000000000000
00000000000000000000000000000000000000000006776600000070067776006777660077777776600677777777776600677760006777660000000700000000
00000000000000000000000000000000000000000006776600000000067776000677766077777776600667777777766000677760006777660000000000000000
00000000000000000000000000000000000000000006776600000000067776000067776077777776600006677776660000677760000677660000000000000000
00000000000000000000000000000000000000000006776600000000067776000067776077777776600000677776000700677760000677660000000000000000
0000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff00
000000000000000000000000003333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f3ff0
00000000000000000000000003333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033fff
0000000000000000000000033333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000f000f3bbbf
00000000000000000000000333333333330000000000000000000000000000000000000000000000000000000000000700000000000000000000ff3f00f3bbbb
000000000000000000000033333333333333300000000000000000000000007000000000000000000000000000000000000000000000000000fff33ffff3bbbb
00000000000000000000333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000fff333bff33bbbb
00000000000000000003333333333333333333333000000000000000000000000000000000000000000000000000000000000000000000ffff3333bbff33bbbb
00000000000000003333333333333333333333333330000000000000000000000000000000000000000000000000000000000000000fffff3333bbbbf333bbbb
000000000000000333333333333333333333333b33333000000000000000000000000000000000000000000000000000000000000ffffff3333bbbbff333bbbb
00000000000003333333333333333333333333bb333333300000000000000000000000000000000000000000000000000000000ffffbff3333bbbbff3333bbbb
00000000000033333333333333333333333333bb333333333000000000000000000000000000000000000000000000ffffffffffbffff3333bbbbbff3333bbbb
0000000000003333333333333333333333333bbb333333333300000000000000000000000000000000000000000ffff333333fffbfff33b33bbbbbff3333bbbb
0000000000000333333333333333333333333bbbb3333333330000000000000000000000000000000000000fffff333333ffffffff333b33bbbbbfff33333bbb
0000000000000333333333333333333333333bbbb333333333000000000000000000000000000000fffff00fff33333bbfffffff333bbb33bbbbbff33b333bbb
00000000000000333333333333333333333bbbbbb333333333000000000000000000000000000ffffff33fb53333bbbffffff33333bbbb3bbb3bff33bb333bbb
00000000000000333333333333333333333bbbbbbb3333333300000000000000000000000000fffb3333ff33333bbbbbbb333333bbbbbbbbbb3bf333bb3333bb
0000000000000003333333333333333333bbbbbbbb33333333000000000007000000000000fff3333bbff333333bbbbbbbbbbbbbb3bbbbbbbbbff333bbb3333b
0000700000000003333333333333333333bbbbbbbb3333333300000000000000000000000ff333bbbbbf3333b33bb3bbbbb3bbbbb3bbb3bbbbff333bbbb3333b
0000000000000000333333333333333333bbbbbbbbb3333333000000000000000000000bbbb3bbbffff333bbb33bb3bbbbb3bbbbbbbbb3bbbff333bbbbbb3333
000000000000000033333333333333333bbbbbbbbbb333333300000000000000000000bbbbbbbbbb33333bbbbb33bbbbbbbbbbbbbbbbbbbbff3333bbbbbbb333
000000000000000003333333333333333bbbbbbbbbb33333330000000000000000bbbbbbbbbbbbbbbbbb3bbbbbb3bbbbbbbbbbbbbbbbbbbb33bb33b3bbbbbbbb
000000000000000003333333333333333bbbbbbbbbb3333333000000000000000bbbbbbbbbbbbbbb3bbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbb3b3bbbbbbbb
000000000000000003333333333333333bbbbbbbbbbb33333311111111111bbbbbbbbbbbbbbbbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbb3bbb3bbbbbbbbbb
00000000000a00a80003333333333333bbbbbbbbbbbb3333331111111111bbbbbbbbbbbbbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbbbbbb33bbbbbbbbb
00000000000000a00003333333333333bbbbbbbbbbbb3333331111111111bbbbbbbbbbbbbbb33bbbbbbbbbbbbbbbbbbbaaaaaaabbbbbbbbbbbbbbb33bbbbbbbb
000000008000a0a000a033333333333bbbbbbbbbbbbbb3333111111111111111111111bbbbb34bbbbbbbbbbbaaaaaaaa1111111aaabbbbbbbbbbbbbbbbbbbbbb
0000000000000000000033333333333bbbbbbbbbbbbbb33331111111111111111111111bbbbbbbbbbbbbbbba111111111111111111abbbbbbbbbbbbbbbbbbbbb
000000000a8a11a1111113333333333bbbbbbbbbbbbbb3333111111111111111111111abbbbbbbbbbbbbbbb11111111111111111111aabbbbbbbbbbbbbbbbbbb
0001111111111811a1a11333333333bbbbbbbbbbbbbbbb333111111111111111111111abbbbbbbbbbb33bbbb111111111111111111111abbbbbbb11111111111
111118111111118111111133333333bbbbbbbbbbbbbbbb33311111111111111111111aabbbbbbbbbbb33bbbbbbbbbb1111111111111111bb1111111111111111
1111111111811a111811a133333333bbbbbbbbbbbbbbbb3331111111111111111111aabbbbbbbbbbbb43bbbbbbbbbbbbbbbb1111111111111111111111111111
11111111111111111a11111333333bbbbbbbbbbbbbbbbbb33111111111111111111aabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb111111111111111111111111111
1111111a8111a1a11111111333333bbbbbbbbbbbbbbbbbb3311111111111111111aabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb11111111111111111111111111
111811111118118a11111a113333bbbbbbbbbbbbbbbbbbb33111111111111111aaaaabbbbbbb33bbbbbbbbbbbbbbbbbbbbbbbbb1111111111111111111111111
811111111181111111a111113333bbbbbbbbbbbbbbbbbbbb311111111111aaaaaaabbbbbbbbb33bbbbbbbbbbbbbbbbbb33bbbbbbbbb1111111111111111bbbbb
1111111111111111118111111333bbbbbbbbbbbbbbbbbbbb311111111aaaaaaaabbbbbbbbbbb333bbbbbbbbbbbbbbbbb33bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
1111881111a11a11111a1111133bbbbbbbbbbbbbbbbbbbbb31111aaaaaaaaaabbbbbbbbbbbbbb43bbbbbbbbbbbbbbbbb33bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
111111111111111a11111111113bbbbbbbbbbb11111111111111aaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb433bbbbbbbbbbbbbbbbbbbbbbbbbbbbb
11111111111111111181111111bb1111111111111111111111aaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555556bbbbbbbbbbbbbbbbffff
111111118111811111a1111111bb111111111111111111111aaaaaaabbbbbbbbbbebbbbbbbbbbbbbbbbbbbbbbb3bbbbb55555555556666bbbbbbb4444444444f
11811111111111111a111111111111111111111111111111aaaaaabbbbbb3bbbbeebbbbbbbbbbbbbbbbbbbbbb33bbbbbb5555555556666666ffff44444444444
1111111111111111111111111111111111111111111111aaaaabbbbbbbb33bbbbeebbbbbbbebbbbbbbbbbbbbb33bbbbbbb55555555666666666fff4444444444
11111811111111111111111111111111111111111111aaaaaaabbbbbbb333bbbbeebbbbbbeebbbbbbbbbbbbbb33bbbbbbb65555555666666666666f444444444
111111111111111111111111111111111111111111aaaaaaaabbbbbbb3333bbbeeebbbbbbeebbbbbbbbbb84443334666666855555666666666666666f4444444
1111111111811111111111111111111111111111aaaaaaabbbbbbbbbb334bbbbeeebbbbbbeebbbb88f8f8ff43333448a8a8a855556666666666666666fffffff
111811111111111111111111111111111111111aaaaaaabbbbbbbbbbbbb4bbbbeeebbbbbfeee8888fffffff433334448a8a8a8555666666666666bbbbbbfffff
11111111111111111111111111111111111111aaaaaaabbbbbbbbbbbbbbbbbbbeeef8f8feeee8888ffffff3a3333444b444444455666666fffbbbbbbbbbbffff
1111111111111111111111111111111111111aaaaaaabbbbbbbbbbbbbbb4444444444444eeee88888ffff33a33333bbbb444444456c111fffffbbbbbbbbbbfff
111111111111111111111111111111111111aaaaaaaabbbbbbbbbf444448fffffff44444eeee888888888338844bbbbbbbf64646cccc11ffffffbbbbbbbbbfff
11111111111111111111111111111111111aaaaaaaaaeb4fffff68888888fffffff44444eeeee88888888333844ffff0ffff6464cccc1111fffffbbffffffbbb
1111111111111111111111111111111111aaaaaa444ee446666688888388ffffffbbbbbbb4488888884a83338a8ffff000fff646cccc11114646464fffffffbb
111111111111111111111111111111111a4444444e4eee6e666688883384bbbbbbbbbbbbb44444444448a333a8a8ffff0000fffccccc111144646464fffffffb
11111111111111111111111111111111aa4444444eeeeee666644444334bbbbbbbbbbb4646444444444483333a8a8ffff000000ccccc1111444646e646ffffff
1111111111111111111111111111111aa444444444eeeee444444444334bbbbbbb446464646444444444a33338a8a4f8f800000ccccc11114444eee46465ffff
111111111111111111111111111111aa44444bbbbbbb444444444443336444444446464646444444444443333344444a8a80000ccccc11114444eee6464664ff
11111111111111111111111111111aa44bbbbbbbbbb44444448666633364444444446464646f44444444433333444444a8a000000ccc11100004eee66666665f
1111111111111111111111111111aabbbbbbbbbbbb4888888866666333344444444fffffffff444444444333334444444a8f0000000c11000000eee066666666
111111111111111111111111111aabbbbbbbbb444488888888666633333444ffffffffffffff4444444444444444444444fff000000011000000eeee66666666
11111111111111111111111111aabbbbbba444444488888888666633333ffffffffffffffffff444444444444444444444ffff00000000000000eeee66666666
1111111111111111111111111aaaaaaaaa444444488888888b444433333ffffffffffffffffff44444bbbbbb44444444444ffff0000000006666eeee66666666
111111111111111111111111aaaaaaaaa44444444888bbbbb4444433333ffffffffffffffffffbbbbbbbbbbb444444444444ffff00000fff6666eeee66666a44
11111111111111111111111aaaaaaaaa44444444abbbbbbbb444444444ffffffffffbbbbbbbbbbbbbbbbbbbbb444444444444ffffffffffff666eeeee8a8a8a4
1111111111111111111111aaaaaaaaaaaaaaaaaabbbbbbbb4444444444ffffffffffbbbbbbbbbbbbbbbbbbbbb4444444444444ffffffffffff6aeeeeea8a8a8a
1111111111111111111111aaaaaaaaaaaaaaaaabbbbbbbbb444844444fffffffffffbb8bbbbbbbbbbbbbbbbbbb444444444444f666666666666eeeeee8a8a8a8
111111111111111111111aaaaaaaaaaaaaaaaaabbbbbbbbaaaaaaaaaafffffffffffbbbbbbbbbbbbbbbbbbbbbb444444fffffff666666666666eeeeeea8a8a8a
1111111111111111111aaaaaaaaaaaaaaaaaaabbbbaaaaaaaaaaaaa8afffffff88ffbbbbbbb8bbbbbbbbbbbbbb4fffffffffffff66666666666eeeeeeee8a8a8
111111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffff88ffbbbbbbbbbbba44444444444fffffffffffff66666666666eeeeeeeea8a8a
11111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffffffffabbbbaaaaaaa444444444444fffffffffffff6666666666eeeeeeee8a8a8
1111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88aaaaaffffffffffaaaaaaaaaaaaa444444444444ffffffffffffff666666666eeeeeeeea8a8a
1111111111111111aaaaaaaaaaaaaaaaaaaaaa8aaaaaaaaaaa88aaaaa8fffaaaaaaa8aaaaa88aaaa4444444444444fffffffffffff666666666eeeeeeeeea8a8
111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88aaaaa448444444444ffffffffffffff66666666eeeeeeeee8a8a
1111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa8aaaaaccccccc11aaaaaaaaaaaaaaa4444444444444ffffffffffffff6666666eeeeeeeeea8a8
111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccc11aaaaaaaaaaaaaaa4444444444444ffffffffffffff8aaaaaaeeeeeeeeeaa8a
11111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacccc11111cc11cc11aaaaaaaaaaaa4444444444444ffffff8f8f8f8aaaaaaeeeeeeeeeeaaa8
11111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaa8aaaaaaaaacccc11111cc11cc11aaaaaaa8aaaa4444444444444f8f8f8a8a8a8a8aaaaaeeeeeeeeeeeaaa
1111111111111aaaaaaaaaaaaaa11111aaaaaaa88aaaaaaaa1111111111ccccc1111cc1111aaaaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8aaaaeeeeeeeeeeeaaa
111111111111aaaaaaaaa11111111111aaaaaaa88aaaa8aaa1111111811ccccc1111cc1111aaaaaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8aaaeeeeeeeeeeeaaa
11111111111aaaa11111111111111111aaaaaaa88aaaaaaaa11111111ccccccc1111cccc11111aaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8aaeeeeeeeeeeeaaa
11111111111111111111111111111111aaaaaaaaaaaaaaaaa11111111ccccccc1111cccc11111aaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8aeeeeeeeeeeeeaa
1111111111111111111111111111111aaaaaaaaaaaaaaaaaa1111ccccccccc11111111cccc1111111aa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8eeeeeeeeeeeeaa
1111111111111111111111111111111aaaaaaaaaaaaaaaaaa1111ccccccccc11111111cccc1111111aaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8aeeeeeeeeeeeeaa
111111111111111111111111111111aaaaaaaaaaaaaaaaaa111ccccccccccc11111111ccccc111111aaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8eeeeeeeeeeeeaa
111111111111111111111111111111aa8aaaaaaaa1111111111ccccccccccc1111111111ccccc1111aaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a844444aaaaaaaa
11111111111111111111111111111aaaaa11111111111111111ccccccccccc1111111111ccc881111aaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a44444aaaaaaa8
11111111111111111111111111111111111111111111181111111ccccccc111111111111ccc88cc11aaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8444448a8a8a8a
11111111111111111111111111111111111111111111111111111ccccccc111811111111ccccccc11aaaa8a8a8a8a8a8a8a8a8a8a8a8aaaaaaa0000008a8a8a8
1111111111111111111111111111111111111111111111111111111ccccc11111111111111cccccccccaaa8a8a8a8a8a8a8a8aaaaaaaaaaaaaa0000000008a8a
111111111111111111111111111111111111118811111111111111accccc11111111111111cccccccccaa8a8a8a8a8a8a8a8a8aaaaaaaaaaaa000000000008a8
111111111111111111111111111111111111118811111111111111aaaaac11111111111111cccccaaaaaa18a8a8a8a8a8a8a8a8aaaaaaaaaaa0000000000008a
111111111111111111111111111111111111111111111111111111aaaaac11111111111111ccccc1111111a8a8a8a8a8a8a8a8aaaaaaaaaaaa000000000000a8
111111111111111111111111811111118111111111111118111111aaaaaaaaaaaaaaaaaaaa1111111111118a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8a8a
111111111111111111111111111111111111111111111111111111aaaaaaaaaaaaaaa11111111111111111a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaa8a8a8
111111111111111111111111111111111111111111111111111111aaaaaaa11111111111111111111111111a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaa8a8a
1111111111111111111111111111111111111111111111111111111111110000000111111111111111111118a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8a8
111111111111111111111111111111111111111111111111111111100000000000000000011111111111111a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8a
1111111111111111111111111111111111111111111111111111100000000000000000000000011111111111a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8
11111111111111111111111111111111111111111111111111000000000000000000000000000011111111118a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa
1111111111111111111111111111111111111118111111111100000000000000000000000000001111111111a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8
11111111111111111111111111111111111111111111111111000000000000000000000000000011111111118a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa
111111111111111111111111111111111111111111111111111000000000000000000000000001111111111118a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaa
11111111111111111111111111111111111111111111111111111000000000000000000000011111111111111a8a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaa
111111111111111111111111111111111111111111111111111111111111111111111111111111111111111118a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaa
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000
00000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000006777777777600067777777777000077777776600006677766600000677776000077660000000000000000
00000000000000000000000000000000000000000006777777777660067777777777600077777776600067777777660070677777600077660000000000000000
00000000000000000000000000000000000000000006777777777660067777777777600077777776600667777777766000677777600077660000000000000000
00000000000000000000000000000000000000000006777777777760067776666777760077777776600677777777776600677777600077660000000000000000
00000000000000000000000000000000000000000006777606677766067776066777760000677600006777766667776600677777760077660000000000000000
00000000000000000000000000000000000000000006777600067776067776000677760000677600006777660006777660677777776077660000000000000000
00000000000000000000000000000000000000000006777606677776067776066777700000677600007777600000677760677767776077660000000000000000
00000000000000000000000000000000000000000006777606677776067776066777600000677600007776600000677760677767776077660000000000000000
00000000000000000000000000000000000000000006777777777760067777777776600000677600007776000000677760677766777677660000000000000000
00000000000000000000000000000000000000000006777777777660067777777766000000677600007776000000677760677766777777660000000000000000
00000000000000000000000000000000000000000006777666666600067777777760000000677600007776000000677660677760677777660000000000000000
00000000070000000000000000000000000000000006776600000000067776067766000000677600006776600006777600677760677777660000000000000000
00000000000000000000000000000000000000000006776600000000067776067766000000677600006777660006777600677760677777660000000000000000
00000000000000000000000000000007000000000006776600000000067776067776600000677600006777766667777600677760067777660000000000000000
00000000000000000000000000000000000000000006776600000070067776006777660077777776600677777777776600677760006777660000000700000000
00000000000000000000000000000000000000000006776600000000067776000677766077777776600667777777766000677760006777660000000000000000
00000000000000000000000000000000000000000006776600000000067776000067776077777776600006677776660000677760000677660000000000000000
00000000000000000000000000000000000000000006776600000000067776000067776077777776600000677776000700677760000677660000000000000000
0000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000qq00
000000000000000000000000003333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000q3qq0
00000000000000000000000003333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033qqq
0000000000000000000000033333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000q000q3bbbq
00000000000000000000000333333333330000000000000000000000000000000000000000000000000000000000000700000000000000000000qq3q00q3bbbb
000000000000000000000033333333333333300000000000000000000000007000000000000000000000000000000000000000000000000000qqq33qqqq3bbbb
00000000000000000000333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000qqq333bqq33bbbb
00000000000000000003333333333333333333333000000000000000000000000000000000000000000000000000000000000000000000qqqq3333bbqq33bbbb
00000000000000003333333333333333333333333330000000000000000000000000000000000000000000000000000000000000000qqqqq3333bbbbq333bbbb
000000000000000333333333333333333333333b33333000000000000000000000000000000000000000000000000000000000000qqqqqq3333bbbbqq333bbbb
00000000000003333333333333333333333333bb333333300000000000000000000000000000000000000000000000000000000qqqqbqq3333bbbbqq3333bbbb
00000000000033333333333333333333333333bb333333333000000000000000000000000000000000000000000000qqqqqqqqqqbqqqq3333bbbbbqq3333bbbb
0000000000003333333333333333333333333bbb333333333300000000000000000000000000000000000000000qqqq333333qqqbqqq33b33bbbbbqq3333bbbb
0000000000000333333333333333333333333bbbb3333333330000000000000000000000000000000000000qqqqq333333qqqqqqqq333b33bbbbbqqq33333bbb
0000000000000333333333333333333333333bbbb333333333000000000000000000000000000000qqqqq00qqq33333bbqqqqqqq333bbb33bbbbbqq33b333bbb
00000000000000333333333333333333333bbbbbb333333333000000000000000000000000000qqqqqq33qb53333bbbqqqqqq33333bbbb3bbb3bqq33bb333bbb
00000000000000333333333333333333333bbbbbbb3333333300000000000000000000000000qqqb3333qq33333bbbbbbb333333bbbbbbbbbb3bq333bb3333bb
0000000000000003333333333333333333bbbbbbbb33333333000000000007000000000000qqq3333bbqq333333bbbbbbbbbbbbbb3bbbbbbbbbqq333bbb3333b
0000700000000003333333333333333333bbbbbbbb3333333300000000000000000000000qq333bbbbbq3333b33bb3bbbbb3bbbbb3bbb3bbbbqq333bbbb3333b
0000000000000000333333333333333333bbbbbbbbb3333333000000000000000000000bbbb3bbbqqqq333bbb33bb3bbbbb3bbbbbbbbb3bbbqq333bbbbbb3333
000000000000000033333333333333333bbbbbbbbbb333333300000000000000000000bbbbbbbbbb33333bbbbb33bbbbbbbbbbbbbbbbbbbbqq3333bbbbbbb333
000000000000000003333333333333333bbbbbbbbbb33333330000000000000000bbbbbbbbbbbbbbbbbb3bbbbbb3bbbbbbbbbbbbbbbbbbbb33bb33b3bbbbbbbb
000000000000000003333333333333333bbbbbbbbbb3333333000000000000000bbbbbbbbbbbbbbb3bbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbb3b3bbbbbbbb
000000000000000003333333333333333bbbbbbbbbbb333333sssssssssssbbbbbbbbbbbbbbbbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbb3bbb3bbbbbbbbbb
00000000000a00a80003333333333333bbbbbbbbbbbb333333ssssssssssbbbbbbbbbbbbbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbbbbbb33bbbbbbbbb
00000000000000a00003333333333333bbbbbbbbbbbb333333ssssssssssbbbbbbbbbbbbbbb33bbbbbbbbbbbbbbbbbbbaaaaaaabbbbbbbbbbbbbbb33bbbbbbbb
000000008000a0a000a033333333333bbbbbbbbbbbbbb3333sssssssssssssssssssssbbbbb34bbbbbbbbbbbaaaaaaaasssssssaaabbbbbbbbbbbbbbbbbbbbbb
0000000000000000000033333333333bbbbbbbbbbbbbb3333ssssssssssssssssssssssbbbbbbbbbbbbbbbbassssssssssssssssssabbbbbbbbbbbbbbbbbbbbb
000000000a8assassssss3333333333bbbbbbbbbbbbbb3333sssssssssssssssssssssabbbbbbbbbbbbbbbbssssssssssssssssssssaabbbbbbbbbbbbbbbbbbb
000ssssssssss8ssasass333333333bbbbbbbbbbbbbbbb333sssssssssssssssssssssabbbbbbbbbbb33bbbbsssssssssssssssssssssabbbbbbbsssssssssss
sssss8ssssssss8sssssss33333333bbbbbbbbbbbbbbbb333ssssssssssssssssssssaabbbbbbbbbbb33bbbbbbbbbbssssssssssssssssbbssssssssssssssss
ssssssssss8ssasss8ssas33333333bbbbbbbbbbbbbbbb333sssssssssssssssssssaabbbbbbbbbbbb43bbbbbbbbbbbbbbbbssssssssssssssssssssssssssss
sssssssssssssssssasssss333333bbbbbbbbbbbbbbbbbb33ssssssssssssssssssaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbsssssssssssssssssssssssssss
sssssssa8sssasassssssss333333bbbbbbbbbbbbbbbbbb33sssssssssssssssssaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbssssssssssssssssssssssssss
sss8sssssss8ss8asssssass3333bbbbbbbbbbbbbbbbbbb33sssssssssssssssaaaaabbbbbbb33bbbbbbbbbbbbbbbbbbbbbbbbbsssssssssssssssssssssssss
8sssssssss8sssssssasssss3333bbbbbbbbbbbbbbbbbbbb3sssssssssssaaaaaaabbbbbbbbb33bbbbbbbbbbbbbbbbbb33bbbbbbbbbssssssssssssssssbbbbb
ssssssssssssssssss8ssssss333bbbbbbbbbbbbbbbbbbbb3ssssssssaaaaaaaabbbbbbbbbbb333bbbbbbbbbbbbbbbbb33bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
ssss88ssssassasssssasssss33bbbbbbbbbbbbbbbbbbbbb3ssssaaaaaaaaaabbbbbbbbbbbbbb43bbbbbbbbbbbbbbbbb33bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
sssssssssssssssassssssssss3bbbbbbbbbbbssssssssssssssaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb433bbbbbbbbbbbbbbbbbbbbbbbbbbbbb
ssssssssssssssssss8sssssssbbssssssssssssssssssssssaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb5555555555556bbbbbbbbbbbbbbbbqqqq
ssssssss8sss8sssssasssssssbbsssssssssssssssssssssaaaaaaabbbbbbbbbbebbbbbbbbbbbbbbbbbbbbbbb3bbbbb55555555556666bbbbbbb4444444444q
ss8ssssssssssssssassssssssssssssssssssssssssssssaaaaaabbbbbb3bbbbeebbbbbbbbbbbbbbbbbbbbbb33bbbbbb5555555556666666qqqq44444444444
ssssssssssssssssssssssssssssssssssssssssssssssaaaaabbbbbbbb33bbbbeebbbbbbbebbbbbbbbbbbbbb33bbbbbbb55555555666666666qqq4444444444
sssss8ssssssssssssssssssssssssssssssssssssssaaaaaaabbbbbbb333bbbbeebbbbbbeebbbbbbbbbbbbbb33bbbbbbb65555555666666666666q444444444
ssssssssssssssssssssssssssssssssssssssssssaaaaaaaabbbbbbb3333bbbeeebbbbbbeebbbbbbbbbb84443334666666855555666666666666666q4444444
ssssssssss8sssssssssssssssssssssssssssssaaaaaaabbbbbbbbbb334bbbbeeebbbbbbeebbbb88q8q8qq43333448a8a8a855556666666666666666qqqqqqq
sss8sssssssssssssssssssssssssssssssssssaaaaaaabbbbbbbbbbbbb4bbbbeeebbbbbqeee8888qqqqqqq433334448a8a8a8555666666666666bbbbbbqqqqq
ssssssssssssssssssssssssssssssssssssssaaaaaaabbbbbbbbbbbbbbbbbbbeeeq8q8qeeee8888qqqqqq3a3333444b444444455666666qqqbbbbbbbbbbqqqq
sssssssssssssssssssssssssssssssssssssaaaaaaabbbbbbbbbbbbbbb4444444444444eeee88888qqqq33a33333bbbb444444456csssqqqqqbbbbbbbbbbqqq
ssssssssssssssssssssssssssssssssssssaaaaaaaabbbbbbbbbq444448qqqqqqq44444eeee888888888338844bbbbbbbq64646ccccssqqqqqqbbbbbbbbbqqq
sssssssssssssssssssssssssssssssssssaaaaaaaaaeb4qqqqq68888888qqqqqqq44444eeeee88888888333844qqqq0qqqq6464ccccssssqqqqqbbqqqqqqbbb
ssssssssssssssssssssssssssssssssssaaaaaa444ee446666688888388qqqqqqbbbbbbb4488888884a83338a8qqqq000qqq646ccccssss4646464qqqqqqqbb
sssssssssssssssssssssssssssssssssa4444444e4eee6e666688883384bbbbbbbbbbbbb44444444448a333a8a8qqqq0000qqqcccccssss44646464qqqqqqqb
ssssssssssssssssssssssssssssssssaa4444444eeeeee666644444334bbbbbbbbbbb4646444444444483333a8a8qqqq000000cccccssss444646e646qqqqqq
sssssssssssssssssssssssssssssssaa444444444eeeee444444444334bbbbbbb446464646444444444a33338a8a4q8q800000cccccssss4444eee46465qqqq
ssssssssssssssssssssssssssssssaa44444bbbbbbb444444444443336444444446464646444444444443333344444a8a80000cccccssss4444eee6464664qq
sssssssssssssssssssssssssssssaa44bbbbbbbbbb44444448666633364444444446464646q44444444433333444444a8a000000cccsss00004eee66666665q
ssssssssssssssssssssssssssssaabbbbbbbbbbbb4888888866666333344444444qqqqqqqqq444444444333334444444a8q0000000css000000eee066666666
sssssssssssssssssssssssssssaabbbbbbbbb444488888888666633333444qqqqqqqqqqqqqq4444444444444444444444qqq0000000ss000000eeee66666666
ssssssssssssssssssssssssssaabbbbbba444444488888888666633333qqqqqqqqqqqqqqqqqq444444444444444444444qqqq00000000000000eeee66666666
sssssssssssssssssssssssssaaaaaaaaa444444488888888b444433333qqqqqqqqqqqqqqqqqq44444bbbbbb44444444444qqqq0000000006666eeee66666666
ssssssssssssssssssssssssaaaaaaaaa44444444888bbbbb4444433333qqqqqqqqqqqqqqqqqqbbbbbbbbbbb444444444444qqqq00000qqq6666eeee66666a44
sssssssssssssssssssssssaaaaaaaaa44444444abbbbbbbb444444444qqqqqqqqqqbbbbbbbbbbbbbbbbbbbbb444444444444qqqqqqqqqqqq666eeeee8a8a8a4
ssssssssssssssssssssssaaaaaaaaaaaaaaaaaabbbbbbbb4444444444qqqqqqqqqqbbbbbbbbbbbbbbbbbbbbb4444444444444qqqqqqqqqqqq6aeeeeea8a8a8a
ssssssssssssssssssssssaaaaaaaaaaaaaaaaabbbbbbbbb444844444qqqqqqqqqqqbb8bbbbbbbbbbbbbbbbbbb444444444444q666666666666eeeeee8a8a8a8
sssssssssssssssssssssaaaaaaaaaaaaaaaaaabbbbbbbbaaaaaaaaaaqqqqqqqqqqqbbbbbbbbbbbbbbbbbbbbbb444444qqqqqqq666666666666eeeeeea8a8a8a
sssssssssssssssssssaaaaaaaaaaaaaaaaaaabbbbaaaaaaaaaaaaa8aqqqqqqq88qqbbbbbbb8bbbbbbbbbbbbbb4qqqqqqqqqqqqq66666666666eeeeeeee8a8a8
ssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaqqqqqqq88qqbbbbbbbbbbba44444444444qqqqqqqqqqqqq66666666666eeeeeeeea8a8a
sssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaqqqqqqqqqqqabbbbaaaaaaa444444444444qqqqqqqqqqqqq6666666666eeeeeeee8a8a8
ssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88aaaaaqqqqqqqqqqaaaaaaaaaaaaa444444444444qqqqqqqqqqqqqq666666666eeeeeeeea8a8a
ssssssssssssssssaaaaaaaaaaaaaaaaaaaaaa8aaaaaaaaaaa88aaaaa8qqqaaaaaaa8aaaaa88aaaa4444444444444qqqqqqqqqqqqq666666666eeeeeeeeea8a8
sssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88aaaaa448444444444qqqqqqqqqqqqqq66666666eeeeeeeee8a8a
ssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa8aaaaacccccccssaaaaaaaaaaaaaaa4444444444444qqqqqqqqqqqqqq6666666eeeeeeeeea8a8
sssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacccccccssaaaaaaaaaaaaaaa4444444444444qqqqqqqqqqqqqq8aaaaaaeeeeeeeeeaa8a
ssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccsssssccssccssaaaaaaaaaaaa4444444444444qqqqqq8q8q8q8aaaaaaeeeeeeeeeeaaa8
ssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaa8aaaaaaaaaccccsssssccssccssaaaaaaa8aaaa4444444444444q8q8q8a8a8a8a8aaaaaeeeeeeeeeeeaaa
sssssssssssssaaaaaaaaaaaaaasssssaaaaaaa88aaaaaaaasssssssssscccccssssccssssaaaaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8aaaaeeeeeeeeeeeaaa
ssssssssssssaaaaaaaaasssssssssssaaaaaaa88aaaa8aaasssssss8sscccccssssccssssaaaaaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8aaaeeeeeeeeeeeaaa
sssssssssssaaaasssssssssssssssssaaaaaaa88aaaaaaaasssssssscccccccssssccccsssssaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8aaeeeeeeeeeeeaaa
ssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaasssssssscccccccssssccccsssssaaaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8aeeeeeeeeeeeeaa
sssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaasssscccccccccssssssssccccsssssssaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8eeeeeeeeeeeeaa
sssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaasssscccccccccssssssssccccsssssssaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8aeeeeeeeeeeeeaa
ssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaassscccccccccccsssssssscccccssssssaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8eeeeeeeeeeeeaa
ssssssssssssssssssssssssssssssaa8aaaaaaaasssssssssscccccccccccsssssssssscccccssssaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a844444aaaaaaaa
sssssssssssssssssssssssssssssaaaaassssssssssssssssscccccccccccssssssssssccc88ssssaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a44444aaaaaaa8
sssssssssssssssssssssssssssssssssssssssssssss8ssssssscccccccssssssssssssccc88ccssaaaaa8a8a8a8a8a8a8a8a8a8a8a8a8a8a8444448a8a8a8a
ssssssssssssssssssssssssssssssssssssssssssssssssssssscccccccsss8sssssssscccccccssaaaa8a8a8a8a8a8a8a8a8a8a8a8aaaaaaa0000008a8a8a8
ssssssssssssssssssssssssssssssssssssssssssssssssssssssscccccsssssssssssssscccccccccaaa8a8a8a8a8a8a8a8aaaaaaaaaaaaaa0000000008a8a
ssssssssssssssssssssssssssssssssssssss88ssssssssssssssacccccsssssssssssssscccccccccaa8a8a8a8a8a8a8a8a8aaaaaaaaaaaa000000000008a8
ssssssssssssssssssssssssssssssssssssss88ssssssssssssssaaaaacsssssssssssssscccccaaaaaas8a8a8a8a8a8a8a8a8aaaaaaaaaaa0000000000008a
ssssssssssssssssssssssssssssssssssssssssssssssssssssssaaaaacsssssssssssssscccccsssssssa8a8a8a8a8a8a8a8aaaaaaaaaaaa000000000000a8
ssssssssssssssssssssssss8sssssss8ssssssssssssss8ssssssaaaaaaaaaaaaaaaaaaaassssssssssss8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8a8a
ssssssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaasssssssssssssssssa8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaa8a8a8
ssssssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaassssssssssssssssssssssssssa8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaa8a8a
ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss0000000ssssssssssssssssssss8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8a8
sssssssssssssssssssssssssssssssssssssssssssssssssssssss000000000000000000ssssssssssssssa8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8a
sssssssssssssssssssssssssssssssssssssssssssssssssssss000000000000000000000000sssssssssssa8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8
ssssssssssssssssssssssssssssssssssssssssssssssssss0000000000000000000000000000ssssssssss8a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa
sssssssssssssssssssssssssssssssssssssss8ssssssssss0000000000000000000000000000ssssssssssa8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa8
ssssssssssssssssssssssssssssssssssssssssssssssssss0000000000000000000000000000ssssssssss8a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaaa
sssssssssssssssssssssssssssssssssssssssssssssssssss00000000000000000000000000ssssssssssss8a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaa
sssssssssssssssssssssssssssssssssssssssssssssssssssss0000000000000000000000ssssssssssssssa8a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaa
sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss8a8a8a8a8a8a8a8a8a8aaaaaaaaaaaaaaaaaaaa

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


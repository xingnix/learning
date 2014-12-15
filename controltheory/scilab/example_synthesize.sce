function [s,db,phi]=bodes(g,c)
s=%s;

if argn(2)==0
  g=7/s/(s+1)/(s+10);
  g=70/s/(1+0.12*s)/(1+0.02*s);
  gc=(1+0.25*s)*(1+0.12*s)/(1+1.33*s)/(1+0.22*s);
  g=g*gc;
end
if argn(2)==1 then
    c=5;
end
num=numer(g);
den=denom(g);
coeffn=coeff(num);
coeffd=coeff(den);
zero=roots(num);
pole=roots(den);
w=abs([zero;pole]);
w(w==0)=[];
if w==[] then w=1;
else w=gsort(w,'g','i');
end
w=[w(1)/2;w;w(length(w))*2];
db=coeffn(length(coeffn))/coeffd(length(coeffd));
for z=abs(zero)',
    if z==0 then db=db.*w;
    else
        db=db.*((w>z).*w+(w<=z)*z);
    end
end
for p=abs(pole)',
    if p==0 then db=db./w;
    else
        db=db./((w>p).*w+(w<=p)*p);
    end
end
db=20*log10(db);
xgrid

phis=logspace(log10(min(w)),log10(max(w)),100)';
[phi,mag]=phasemag(horner(g,phis'*%i),'c');

subplot(2,1,1)
plot2d(w,db,style=c,logflag='ln');
xgrid;
e=gce();
e.children(1).thickness=2;
plot(w(2:length(w)-1),db(2:length(w)-1),'r.');
subplot(2,1,2)
plot2d(phis,phi,style=c,logflag='ln');
xgrid;
e=gce();
e.children(1).thickness=2;
endfunction

s=%s;
g=200/(s*(0.1*s+1)*(0.02*s+1)*(0.01*s+1)*(0.005*s+1));ge=1/(1+2000/13^2*s)*200*(s/1.3+1)/s/(s/50+1);gc=(s/1.3+1)*(0.1*s+1)/(1+2000/13^2*s);// synthesize example 1
g=70/s/(1+0.12*s)/(1+0.02*s);ge=70*(0.25*s+1)/s/(1.33*s+1)/(0.022*s+1);gc=(1+0.25*s)*(1+0.12*s)/(1+1.33*s)/(1+0.022*s);//synthesize example 2
bodes(g,5);
bodes(g*gc,2);
bodes(ge,3);
bodes(gc,1)

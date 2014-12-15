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
//g=440/s/(0.025*s+1);lead1=0.025*s+1;lead=(0.025*s+1)/(0.0025*s+1);lag=(0.1*s+1)/(s+1);gc=lead*lag;// feedback example 1
g1=5000/(0.014*s+1);g2=12/(0.1*s+1)/(0.02*s+1);g3=0.0025/s;g=g1*g2*g3;ge=150*(0.25*s+1)/2.86/s^2/(0.013*s+1);gc=0.238*s/(0.25*s+1)// feedback example 1
bodes(g,5);
bodes(ge,3);
bodes(g1*g2/(1+g2*gc)*g3,2);

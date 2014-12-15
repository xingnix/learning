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
lead_ex1='g=200/s/(0.1*s+1);gc=(5.1*0.0066*s+1)/(0.0066*s+1)';//lead example 1
lead_ex2='g=15/s/(s+1);gc=(4.7*0.08*s+1)/(0.08*s+1)';//lead example 2
lead_ex3='g=5/s/(0.05*s+1)/(0.2*s+1);gc=(0.3*s+1)/(0.055*s+1)';//lead example 3
lead_6_5='g=40/s/(0.2*s+1)/(0.0625*s+1);gc=(0.2*s+1)/(0.0001*s+1)';//lead 6-5 (1)
lag_ex1='g=8/s/(s+1)/(0.2*s+1);gc=(14.3*s+1)/(158.7*s+1)';//lag example 1
lag_ex2='g=5/s/(s+1)/(0.5*s+1);gc=(20*s+1)/(200*s+1)';//lag example 2
//g=100/s/(0.1*s+1)/(0.01*s+1);lead1=(0.1*s+1);lead=(0.1*s+1)/(0.02*s+1);lag=(0.5*s+1)/(2.5*s+1);gc=lead*lag;//lag-lead example 1
//g=(10*s+1)/s/(s+1)^2/(0.01*s+1);gc=(s+1)^2/(0.1*s+1)/(10*s+1);//lag-lead example 2
//execstr(lead_ex2);
execstr(lead_6_5);
bodes(g,5);
bodes(g*gc,3);
bodes(gc,2)
margins(g*gc)

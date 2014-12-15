function [s,db,phi]=bodes(g,c)
s=%s;
//g=(s+1)/s/(s+10)/(s+100);
if argn(2)==0
  g=70/s/(1+0.12*s)/(1+0.02*s);
  gc=(1+0.25*s)*(1+0.12*s)/(1+1.33*s)/(1+0.22*s);
  g=g*gc;
end
if argn(2)==1 then
    c=5;
end
//g=1/s;

n=numer(g);
coeffn=coeff(n);
//m=coeff(n);
//m(m==0)=[];
//m=m(1);
nz=real(-roots(n));
d=denom(g);
coeffd=coeff(d);
np=real(-roots(d));
s=[nz;np];
s(s==0)=[];
if s==[] s=1; end
s=gsort(s,'g','i');
s=[min(s)/10;s;max(s)*10];
s=logspace(log10(min(s)),log10(max(s)),100)';
nz(nz==0)=%eps;
np(np==0)=%eps;
nz=[nz;1];
np=[np;1];
iz=(1.0)./nz;
ip=(1.0)./np;
sz=s*ones(iz');
sp=s*ones(ip');
ze=ones(s)*iz';
pe=ones(s)*ip';
kz=sz.*ze;
kp=sp.*pe;
db=20*log10(coeffn(length(coeffn))/coeffd(length(coeffd))*prod((kz>=1).*sz+(kz<1).*(ones(s)*nz'),'c')./prod((kp>=1).*sp+(kp<1).*(ones(s)*np'),'c'));
//phis=logspace(log10(min(s)),log10(max(s)),100);
phis=s;
[phi,mag]=phasemag(horner(g,phis'*%i),'c');

subplot(2,1,1)
//plot2d(s,[db,mag'],style=[5,2],logflag='ln');
plot2d(s,db,style=c,logflag='ln');
//plot2d(s,db,style=5,logflag='ln');
//plot2d(phis,mag,style=2,logflag='ln');
xgrid;
e=gce();
//e.children(2).polyline_style=2;
e.children(1).thickness=2;
//e.children(2).thickness=2;
//e.children(1).line_style=2;
subplot(2,1,2)
plot2d(phis,phi,style=c,logflag='ln');
xgrid;
e=gce();
//e.children(1).polyline_style=2;
e.children(1).thickness=2;
//bode(s,db',phi');

endfunction

s=%s;
lead_ex1='g=200/s/(0.1*s+1);gc=(5.1*0.0066*s+1)/(0.0066*s+1)';//lead example 1
lead_ex2='g=15/s/(s+1);gc=(4.7*0.08*s+1)/(0.08*s+1)';//lead example 2
lead_ex3='g=5/s/(0.05*s+1)/(0.2*s+1);gc=(0.3*s+1)/(0.055*s+1)';//lead example 3
lag_ex1='g=8/s/(s+1)/(0.2*s+1);gc=(14.3*s+1)/(158.7*s+1)';//lag example 1
lag_ex2='g=5/s/(s+1)/(0.5*s+1);gc=(20*s+1)/(200*s+1)';//lag example 2
g=100/s/(0.1*s+1)/(0.01*s+1);lead1=(0.1*s+1);lead=(0.1*s+1)/(0.02*s+1);lag=(0.5*s+1)/(2.5*s+1);gc=lead*lag;//lag-lead example 1
//execstr(laglead_ex1);
bodes(g,5);
bodes(g*lead1,3);
bodes(g*gc,2);
bodes(gc)

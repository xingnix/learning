deff('[y]=L(x)','y=(abs(x)>1).*x+(abs(x)<=1).*1')
deff('[y]=h(w)','y=(70)./w./L(w*0.12)./L(w*0.02)')
w=[1/0.12/10,1/0.12,1/0.02,1/0.02*2];
[phi,mag]=phasemag(h(w*%i));
plot2d(w,mag,logflag='ln',style=2);
xgrid;
//plot2d(w,20*log10(abs(h(w*%i))),logflag='ln');

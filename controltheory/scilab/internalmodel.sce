// input: sint(t) 1/(s^2+1)
// use internalr model controller to get ess=0
s=%s;
g=1/(1+s);
//gc=(1+2*s)^3/s/(1+s^2);
//gc=(1+2*s)^2/(1+s^2);
gc=(1+2*s)/(1+s^2); //the denominator of gc should contain (1+s^2)
gnew=g*gc;
t=0:0.1:50;
plot(t,sin(t),'b-',t,csim(sin(t),t,syslin('c',gnew/(1+gnew))),'r-');

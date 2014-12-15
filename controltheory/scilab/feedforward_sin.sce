// input: sin(t)   1/(s^2+1)
// use feed forward mechanism to get ess=0
s=%s;
g=1/(s+1);
//gr=(3*s^2+2*s+1)/(s+1)^2;
gr=2*s/(s+1);// the numerator of (1-gr*g) should contain (1+s^2)
t=0:0.01:20;
plot(t,sin(t),'b-',t,csim(sin(t),t,syslin('c',(g+gr*g)/(1+g))),'r-');


// differential with delay
// gr=(s+1)e^-s;
scf;
plot(t,sin(t),'b-',t,csim(sin(t)+(sin(t)+cos(t)).*(t-0.1>0),t,syslin('c',g/(1+g))),'r-');

scf;
dt=0.01;
plot(t,sin(t),'b-',t,csim(sin(t)+(sin(t)+(sin(t+dt)-sin(t-dt))/2/dt).*(t-dt>0),t,syslin('c',g/(1+g))),'r-');
//plot(t,sin(t)-csim(sin(t)+(sin(t)+(sin(t+dt)-sin(t-dt))/2/dt).*(t-dt>0),t,syslin('c',g/(1+g))),'r-');
scf;
dt=0.01;
plot(t,sin(t),'b-',t,csim(sin(t)+sin(t)+((sin(t+dt)-sin(t-dt))/2/dt).*(t-dt>0),t,syslin('c',g/(1+g))),'r-');
//plot(t,sin(t)-csim(sin(t)+sin(t)+((sin(t+dt)-sin(t-dt))/2/dt).*(t-dt>0),t,syslin('c',g/(1+g))),'b-');

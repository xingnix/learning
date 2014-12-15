z=%z;

dt=3;
n=10;
N=n*dt;
g1=syslin('d',1/(1-exp(-1/dt)*z^-1));
g2=syslin('d',1/(1-exp(-1)*z^-1));
g=syslin('d',1/(1-exp(-1/d)*z^-1));
t1=[0:N];
//input1=[1 0 0 1 0 0 1  0 0 1  0 0 1 0 0];
input1=double(~modulo(t1,dt))
t2=[0:dt:N];
input2=ones(1,floor(N/dt)+1);
plot(t2/dt,flts(input2,g2),'o-.',t1/dt,flts(input1,g1),'.-')

//plot2d2(t1,rtitr(g1('num'),g1('den'),input1),style=5);
//plot2d2(t2,rtitr(g2('num'),g2('den'),input2),style=3);

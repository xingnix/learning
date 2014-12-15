z=%z;
g1=syslin('d',1/(1-exp(-1/3)*z^-1));
g2=syslin('d',1/(1-exp(-1)*z^-1));
t1=[0:14];
//input1=[1 0 0 1 0 0 1  0 0 1  0 0 1 0 0];
input1=double(~modulo(t1,3))
t2=[0 3 6 9 12 ];
input2=[1 1  1 1 1];
plot(t1,flts(input1,g1),'-o',t2,flts(input2,g2),'o-.')

//plot2d2(t1,rtitr(g1('num'),g1('den'),input1),style=5);
//plot2d2(t2,rtitr(g2('num'),g2('den'),input2),style=3);

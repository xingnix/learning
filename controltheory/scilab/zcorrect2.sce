function zcorrect(g,n,d,in,c)
    N=n*d;
    t=[0:N];
    input1=zeros(1,n*d+1);
    input1(1:d:n*d+1)=in;
    plot(t/d,flts(input1,g),c)
endfunction


z=%z;


n=10;
input2=ones(1,n+1);

dt=1;
g2=syslin('d',1/(1-exp(-1/dt)*z^-1));
zcorrect(g2,n,1,input2,'ro');

dt=3;
g1=syslin('d',1/(1-exp(-1/dt)*z^-1));
zcorrect(g1,n,dt,input2,'b.');


dt=100;
g=syslin('d',1/(1-exp(-1/dt)*z^-1));
zcorrect(g,n,dt,input2,'g-');

//plot2d2(t1,rtitr(g1('num'),g1('den'),input1),style=5);
//plot2d2(t2,rtitr(g2('num'),g2('den'),input2),style=3);

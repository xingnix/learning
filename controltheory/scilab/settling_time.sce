// g(s)=omegan^2/(s^2+2*xi*omegan*s+omegan^2)
// omegan=1;xi changes from 1/sqrt(2) to 1
// calculating settling time ts
y0=[0,0]';
x=0.999;
c=[];
xi=[0.71:0.001:0.999];
for x=xi;
deff("[ydot]=f(t,y)","ydot=[y(2) ; -2*"+string(x)+"*y(2)-y(1) + 1]");
deff("[z]=g(t,y)","z=y(1)-0.95");
ng=1;
[y,rd]=ode("roots",y0,0,[0:0.001:10],f,ng,g);
c=[c rd(1)*x];
end
plot(xi,c);

//s=poly(0,'s');
// g=1/(s^2+2*1*s+1);
// t=[0:0.001:10];
// plot(t,csim('step',t,g));
 

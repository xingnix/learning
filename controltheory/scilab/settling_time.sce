// g(s)=omegan^2/(s^2+2*xi*omegan*s+omegan^2)
// omegan=1;xi changes from 0.1 to 1.1
// calculating real settling time ts, approximate ts and the usually used ts
y0=[0,0]';
x=0.999;
c=[];
xi=[0.1:0.01:1.1];
err=0.05;
for x=xi;
  if x >=1
    deff("[ydot]=f(t,y)","ydot=[y(2) ; -2*"+string(x)+"*y(2)-y(1) + 1]");
    deff("[z]=g(t,y)","z=y(1)-(1-err)");
    ng=1;
    [y,rd]=ode("roots",y0,0,[0:0.001:50],f,ng,g);
    c=[c rd(1)];
  else
    // exp(-\xi\omega_n t)/sqrt(1-\xi^2) \approx 0.05
    T=(-log(err)-1/2*log(1-x^2))/x;
    for t=T:-0.01:0,
        if abs(exp(-x*t)/sqrt(1-x^2) *sin(sqrt(1-x^2)*t+acos(x)))>err,
            c=[c t];
            break;
        end
    end
  end
end
plot(xi,c,'r.-');
x=[0.1:0.01:0.99];
plot(x,(-log(err)-1/2*log(1-x.^2))./x,'b.-');
plot(xi,-(log(err)+log(1-0.8^2)/2)./xi,'g.-'); //equals 3.5/\xi/\omega_n when err=0.5
legend(['real','approx(drop sin(...))','coarse(let \xi=0.8)']);

//s=poly(0,'s');
// g=1/(s^2+2*1*s+1);
// t=[0:0.001:10];
// plot(t,csim('step',t,g));
 

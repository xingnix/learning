function u=nonlinear0(e)
k=0.5;
if e>0 then u=k*e+1;
elseif e<0 then u=k*e-1;
    else u=0;
end
endfunction


function u=nonlinear1(e)
k=2;
if e>1 then u=k;
elseif e<-1 then u=-k
    else u=e*k;
end
endfunction


function u=nonlinear2(e)
k=1;
if e>0.5 then u=k;
elseif e<-0.5 then u=-k
    else u=0;
end
endfunction

function ina=inversena(A,f)
N=2^8;
T=2*%pi*[0:(N-1)]/N;
M=length(A);
for m=1:M
  for n=1:N,
    y(n)=f(A(m)*sin(T(n)));
  end
  fy=fft(y);
  na(m)=conj(fy(2)*%i)/N*2/A(m);
end
//plot(A,(-1.0./(na)),'.')
ina=-1.0./na';
endfunction



s=%s;

g0=10/s/(s+1)/(4*s+1);
K=15;
g1=K/s/(0.1*s+1)/(0.2*s+1);
g2=10/s/(0.5*s+1)/(0.125*s+1);
g3=10/s/(0.5*s+1)/(0.125*s+1)*(0.25*s+1)/(0.03*s+1)/8.3;

A1=1:1:10; //example1
A2=0.51:0.1:3; //example2
A0=0.01:100:1000; //example0

select 2,
case 1, A=A0;f=nonlinear0;g=g0;fmin=0.05;
case 2, A=A1;f=nonlinear1;g=g1;fmin=0.5;
case 3, A=A2;f=nonlinear2;g=g2;fmin=0.5;
case 4, A=A2;f=nonlinear2;g=g3;fmin=0.5;
end

ina=inversena(A,f);
nyquist(syslin('c',g),fmin,10);
plot2d4(real(ina),imag(ina),style=5);

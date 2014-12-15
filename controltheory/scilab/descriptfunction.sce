function dx=linear1(t,x,u)
s=%s;
K=15;
c=coeff(s*(0.1*s+1)*(0.2*s+1));
h=-c(1:3)*x;
dx=[x(2);x(3);(h+u*K)/c(4)];
endfunction

function u=nonlinear1(e)
k=2;
if e>1 then u=k;
elseif e<-1 then u=-k
    else u=e*k;
end
endfunction


function dx=linear2(t,x,u)
s=%s;
K=10;
c=coeff(s*(0.5*s+1)*(0.125*s+1));
h=-c(1:3)*x;
dx=[x(2);x(3);(h+u*K)/c(4)];
endfunction

function u=nonlinear2(e)
k=1;
if e>0.5 then u=k;
elseif e<-0.5 then u=-k
    else u=0;
end
endfunction

function dx=f(t,x)
u=nonlinear1(-x(1));dx=linear1(t,x,u); //example 1
//u=nonlinear2(-x(1));dx=linear2(t,x,u); // example 2
endfunction

t=[0:0.01:20];
y=ode([10,0,0]',0,t,f)
plot(t,y(1,:));xgrid
scf;
plot(y(1,:),y(2,:));xgrid

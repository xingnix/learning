//G(s)=1/(T_1s+1)
//ess compensation: Gr1(s)=((T_1+T )s+1)/(Ts+1)
// frequency compensation: Gr2(s)=(T_1 s+1)/(Ts+1)
// Gr2 is worse than Gr1 for ess, which is proved easily
// Gr1 is worse than Gr2 for some frequency interval, which is illustrated in following example
T=[0:0.001:0.1];
error1=((1+(T1+T).^2)./(1+T1^2)./(1+T^2)-1).^2;
error2=((1)./(1+T^2)-1).^2;
plot(T,error1,'r',T,error2,'b')     
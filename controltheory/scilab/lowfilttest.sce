function lowtest(k)
r=[zeros(1,100),ones(1,100),zeros(1,100)]+rand(1,300)*0.1;//  square smoothing
//r=[zeros(1,100),zeros(1,99),1,zeros(1,100)]+rand(1,300)*0.1;// impulse elimination
fr=fft(r);
//if argn(2)==0 k=0.1;end;
lf=[exp(-k*[0:149]),exp(-k*[149:-1:0])];
lf=lf/sum(lf);
flf=fft(lf);
//lowfilter=(1)./(1-exp(-0.1)*exp((-%i*2*%pi/300)*[0:(300-1)]));
plot(r,'r');
plot(real(ifft(flf.*fr)),'b')
xgrid
scf
plot(abs([fr(151:300),fr(1:150)]),'r')
plot(abs([lf(151:300),lf(1:150)]),'g')
plot(abs([fr(151:300),fr(1:150)].*[flf(151:300),flf(1:150)]),'b')

xgrid
endfunction

lowtest(0.2)

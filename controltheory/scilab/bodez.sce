s=%s;
g=7/s/(s+1)/(s+10);
num=numer(g);
den=denom(g);
coeffn=coeff(num);
coeffd=coeff(den);
zero=roots(num);
pole=roots(den);
w=abs([zero;pole]);
w(w==0)=[];
if w==[] then w=1;
else w=gsort(w,'g','i');
end
w=[w(1)/2;w;w(length(w))*2];
db=coeffn(length(coeffn))/coeffd(length(coeffd));
for z=abs(zero)',
    if z==0 then db=db.*w;
    else
        db=db.*((w>z).*w+(w<=z)*z);
    end
end
for p=abs(pole)',
    if p==0 then db=db./w;
    else
        db=db./((w>p).*w+(w<=p)*p);
    end
end
plot2d(w,20*log10(db),logflag='ln')
plot(w,20*log10(db),'r*-')
xgrid

k=[-10:10];
l=[-10:10];
[k,l]=meshgrid(k,l);
d=1/2*k.^2+l.*(1-k);
%contour(d)
%surf(k,l,d)
mesh(k,l,d)
pause

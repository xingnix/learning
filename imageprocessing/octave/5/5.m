% display fft with low frequency(DC) centered

im=imread("martian_mariner_6.png");
%size(im)
%ans =
%
%   362   370     3
%
fm=fft2(im(:,:,1));
am=abs(fm);
surf((am/max(am(:)))*255)
lm=log(am);
s=lm/max(lm(:));
[n,m]=size(s);
imshow([s(n/2+1:n,m/2+1:m),s(n/2+1:n,1:m/2);s(1:n/2,m/2+1:m),s(1:n/2,1:m/2)]);
imwrite([s(n/2+1:n,m/2+1:m),s(n/2+1:n,1:m/2);s(1:n/2,m/2+1:m),s(1:n/2,1:m/2)],"./martian_mariner_6_fft.png")

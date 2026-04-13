% -*- coding: utf-8 -*-
% sampling with 1.9 stride
%

pkg load image

l=155
a=abs(round(sin(pi*(1:l)/2)));
sprintf("%d",a)
%ans =10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
sprintf("%d",a(ceil(1:1.9:l)) )
%ans = 1111111111000000000011111111110000000000111111111100000000001111111111000000000011


% sobel filter (frequency)
a=zeros(100,100);
a(2:4,2:4)=[-1 0 1; -2 0 2; -1 0 1];
w=(imag(fft2(a)));
v1=[w(51:100,:) ;w(1:50,:)];
v2=[v1(:,51:100) v1(:,1:50)];
surf((v2))
imshow(abs(v2))


% restore image with phase
im=imresize(imread("../../beamer/4/image/Grenoble_-_ancien_évêché_-_Joseph_Fourier.JPG"),0.1);
%im1=im(1:10:end,1:10:end,1);
im1=im;
fm1=fft2(im1);
re=ifft2(exp(i*angle(fm1)));
surf(abs(re(:,:,1))/max(abs(re(:))))
imshow(abs(re(:,:,1))/max(abs(re(:))))


% restore image with phase
im=imread("Treasure_Hunt_Map_Outdoor_color_garden_screen1_b6736c9f-f66a-452d-8ee2-d2563090a4f7.webp");
f=fft2(im);
a=angle(f);
b=ifft2(exp(i*a))(:,:,1);
imshow(b/max(max(b)))


%  image style change by magnitude and phase
im1=imread("n07740461_11597.jpg");
im2=imread("n07749192_7154.jpg");
fm1=fft2(im1);
fm2=fft2(im2);
r1=(abs(ifft2(abs(fm1).*exp(i*angle(fm1)))));
imshow(uint8(r1))
r1=(abs(ifft2(abs(fm2).*exp(i*angle(fm1)))));
imshow(uint8(r1))
%imwrite(uint8(r1),"n07740461_11597.png")
r2=(abs(ifft2(abs(fm1).*exp(i*angle(fm2)))));
imshow(uint8(r2))
%imwrite(uint8(r2),"n07749192_7154.png")


% image style change by magnitude and phase
im1=resize(imread("Screenshot_20240408_092418.png"),[255,255,3]);
im2=resize(imread("Screenshot_20240408_092506.png"),[255,255,3]);
fm1=fft2(im1);
fm2=fft2(im2);
r1=(abs(ifft2(abs(fm2).*exp(i*angle(fm1)))));
r2=(abs(ifft2(abs(fm1).*exp(i*angle(fm2)))));
imshow(uint8(r1))
imshow(uint8(r2))
%imwrite(uint8(r1),"Screenshot_20240408_092418.jpg")
%imwrite(uint8(r2),"Screenshot_20240408_092506.jpg")


% image style change by magnitude and phase
im1=resize(imread("Screenshot_20240408_092418.png"),[255,255,3]);
im2=resize(imread("0f0a513035709bfd1da42901a889160c4c864f09f32c9c35c17d641cb8c181bb.jpg"),[255,255,3]);
fm1=fft2(im1);
fm2=fft2(im2);
r1=(abs(ifft2(abs(fm2).*exp(i*angle(fm1)))));
r2=(abs(ifft2(abs(fm1).*exp(i*angle(fm2)))));
imshow(uint8(r1))
imshow(uint8(r2))
%imwrite(uint8(r1),"Screenshot_20240408_092418.jpg")
%imwrite(uint8(r2),"Screenshot_20240408_092506.jpg")


% correlation filtering
pkg load image

i=imread("n07740461_11597.jpg");
%imshow(i)
o=(i(47:93,31:120,:));
f1=fft2(i(:,:,1));
f2=fft2(o(:,:,1),256,256);
r=abs(ifft2(f1./f2));
imshow(r/max(r(:)))
%imshow(r2>=max(r2(:)))
%surf(r)

i=imread("Treasure_Hunt_Map_Outdoor_color_garden_screen1_b6736c9f-f66a-452d-8ee2-d2563090a4f7.webp");
i=i(:,:,1);
o=i(500:527,1550:1718);
r2=abs(ifft2(fft2(i)./fft2(o,1740,2000)));
imshow(r2/max(r2(:)))
%imshow(r2>=max(r2(:)))
%surf(r2)

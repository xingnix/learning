im=imread("RGV_color_wheel_1908.png");
im(:,2:2:end,:)=0;
im(2:2:end,:,:)=0;
imshow(im)
% imwrite(im,"RGV_color_wheel_1908_1.png");
r=im(:,:,1);
g=im(:,:,2)*0;
g(1:2:end-1,2:2:end-1)=im(1:2:end-1,1:2:end-1,2)/2;
g(2:2:end,1:2:end-1)=im(1:2:end-1,1:2:end-1,2)/2;
b=im(:,:,3)*0;
b(2:2:end,2:2:end)=im(1:2:end-1,1:2:end-1,3);
im1=cat(3,r,g,b);
imshow(im1)
% imwrite(im,"RGV_color_wheel_1908_2.png");

g(1:2:end-1,2:2:end-1)=im(1:2:end-1,1:2:end-1,2);
g(2:2:end,1:2:end-1)=im(1:2:end-1,1:2:end-1,2);
b=im(:,:,3)*0;
b(2:2:end,2:2:end)=im(1:2:end-1,1:2:end-1,3);
im2=cat(3,r,g,b);
% imwrite(im,"RGV_color_wheel_1908_3.png");
imshow(im2)

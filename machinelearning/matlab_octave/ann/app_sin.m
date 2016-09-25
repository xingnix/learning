function  data=app_sin()
%data=app_sin()

num=40;
data.value=rand(num,1)*2*pi;
%max(data.value)
data.value=sort(data.value);
%data.value=([1:40]-20)/20;
%data.value=data.value';

data.y=sin(data.value/1)*0.4+0.5;
%data.y=data.value*0.4/(2*pi)+0.5;

%data=f(data);

%a=sqrt(0.03);
%z=rand(size(data.value))*2*a-a;
z=rand(size(data.value))*0.01;
%size(data.value)
data.value(:,1)=data.value(:,1)+z; % add white noise power equals 0.01
data.value(:,size(data.value,2)+1)=[1:size(data.value,1)];  % store y index in data.value
%plot(data.value(:,1),data.y);

M=max(data.value(:,1));
temp(:,1)=sin(data.value(:,1)*2*pi/M);
temp(:,2)=cos(data.value(:,1)*2*pi/M);
temp(:,3)=data.value(:,2);
data.x=data.value(:,1);
data.value=temp;
%disp(data.value)
return

function data=f(data)   
   [n1,n2]=size(data.value);
   data.y=data.value*0.4/(2*pi)+0.5;
   %data.y=sin(data.value/4)*0.4+0.5;
   data.y(n1+1:2*n1,1)=data.y(n1:-1:1);
   data.value(n1+1:2*n1,1)=2*pi-data.value(n1:-1:1)+2*pi;
   %disp(data.value')
   %disp(data.y')
%figure
%plot(data.value,data.y)
   return
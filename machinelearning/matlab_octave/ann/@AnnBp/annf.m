function out=annf(net,d)
% neural function
% sigmoid:y=1/(1+exp(-x)
% gauss:y=exp(-(x-c)^2/(2*d^2))

switch nargin
  case 1,
    d=0;  
end
%disp(net.th)
%disp(net.x)
name=net.f;
%a=net.a;
x=net.x;
switch name,
  case 's',
      a=1;
      if d==0,
         y=1./(1+exp(-x.*a));
      else
         y=a./(exp(-x.*a/2)+exp(x.*a/2)).^2; 
         y=diag(y);
      end   
  case 'g',
      c=0;
      b=sqrt(0.5);
      a=1;
      if d==0,
         y=exp(-(a.*x-c).^2/(2*b^2));
      else
         y=-a.*(a.*x-c).*exp(-(x-c).^2./(2*b^2))/b^2;
         y=diag(y);
      end
   case 'k',
      k=1;
      a=4;
      c=0;
      x=x/k;
      if d==0,
         %y=x;         
         y=1/(1+exp(-x.*a))-c;
      else
         y=a./(exp(-x.*a/2)+exp(x.*a/2)).^2; 
         y=diag(y);          
         %y=eye(size(x,1));
      end
      y=y*k;
end
out=y;
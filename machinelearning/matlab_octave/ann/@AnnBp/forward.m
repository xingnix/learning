function [net,y]=forward(net,x)
% culculate output of ANN


if nargin==2,
    net(1).x=x;
end
net(1).out=net(1).x;

%---------
%m=max(abs(net(1).out));
%net(1).out=net(1).out/m;
%----------
for i=2:size(net,2),
    net(i).x=net(i).w*net(i-1).out;
    net(i).x=net(i).x.*net(i).a;
    net(i).x=net(i).x+net(i).th;
    %net(i).out=annf(net(i),'signoid');
    %net(i).out
    %net(i).w
    
    %disp([ 'forward  '  num2str(net(size(net,2)).out)])
    net(i).out=annf(net(i));
end

%disp(['x '  num2str(net(1).x')  '  y ' num2str(net(size(net,2)).out')]) 
%disp('i,net(i).out')
%disp([i ; net(i).out])

if nargout==2,
    y=net(size(net,2)).out;
end
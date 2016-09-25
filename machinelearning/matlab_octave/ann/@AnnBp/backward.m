function [net,e]=backward(net,y,d)
%correct the matrix w by Bp algorithm
%d:deviation
%y:expect output vector

if nargin==2,
    d=0.7;
end

K=size(net,2); % K layer neural network
de_y=net(K).out-y;
e=de_y'*de_y/2;

%disp(['net out: ' num2str(net(K).out) 'expect out: ' num2str(y)])

% get value of de/dnet 
%net(K).de_x=de_y'*annf(net(K),'signoid',1);
net(K).de_x=de_y'*annf(net(K),1);
net(K).de_x=net(K).de_x';
for i=K-1:-1:2,
    %net(i).de_x=net(i+1).de_x'*net(i+1).w*annf(net(i),'signoid',1);
    net(i).de_x=net(i+1).de_x'*net(i+1).w*annf(net(i),1);
    %disp(['net(i).de_x=' int2str(net(i).de_x)])
    net(i).de_x=net(i).de_x';
end
%disp(net(K).w)
%get dw ,correct w & threshold
for i=2:K,
    %disp(net(i).de_x)
    %disp(net(i-1).out)
    
    dw=(net(i).de_x).*(net(i).a)*(net(i-1).out)';
    da=(net(i).de_x).*(net(i).w*net(i-1).out);
    %disp(net(i).w)
    %disp(dw)
    %size(net(i).w)
    %size(dw)
    net(i).w=net(i).w-d*dw;
    net(i).a=net(i).a-d*da;
    net(i).th=net(i).th-d*(net(i).de_x);
end
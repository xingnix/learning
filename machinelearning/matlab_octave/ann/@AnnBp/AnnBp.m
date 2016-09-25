function   net=AnnBp(layer,str)
% construct artificial neural network with Bp algorithm
% layer is a row vector of cell number of each layer
% or a struct with fields x,out,w,de_x.

switch nargin,
case 0,
   layer=[3 1];
   str=['k' 's' 's'];
case 1,
   str=['k' 's' 's'];
end

if isa(layer,'struct'),       
       net=class(layer,'AnnBp');   
else   
    %str(1)   
    net(1)=struct('x',[],'out',[],'w',[],'th',[],'a',[],'de_x',[],'f',str(1));
    for i=2:size(layer,2),
        %i
        %str(i)
        net(i)=struct('x',[],'out',[],'w',(rand(layer(i),layer(i-1))-0.5)*2,'th',rand(layer(i),1)-0.5,'a',ones(layer(i),1),'de_x',[],'f',str(i)); 
        %disp(net(i).w)
    end
    net=class(net,'AnnBp');   
end

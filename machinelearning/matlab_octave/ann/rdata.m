function  data=rdata(data)
%get random data

kinds=size(data,2);             % the number of kinds 
for i=1:kinds,
    num=size(data(i).value,1);    % the dimension of every input
    r=rand(1,num);
    [temp I]=sort(r);
    for j=1:size(data(i).value,2),
        data(i).value(:,j)=data(i).value(I,j);
    end
end
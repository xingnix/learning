function  result=chknet(net,data,y)
%net=chknet(net,trndata,chkdata)
%get the classify quality
%with training data
for n=1:size(trndata,2),
    result(n).correct=0;
    result(n).wrong=0;
    result(n).refuse=0;    
    for i=1:size(data(n).value,1),
        net(1).x=data(n).value(i,1:size_in)';
        net=forward(net);
        
        for j=1:size(data,2),
        if abs(net(size(net,2)).out-y(:,j))<0.3,
            if n==j,
               result(n).correct=correct+1;
            else
               result(n).wrong=wrong+1;
            end
        else
            result(n).refuse=refuse+1;
        end
    end
end
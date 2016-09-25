function [net,total,result]=train(net,data,trndata,chkdata,y,e0,times)
% train ANN 
%[net,total,result]=train(net,data,trndata,chkdata,y,e0,times)
% data is a struct with two fields.One of them is a M*N matrix 
% in which there are M group data which is N dimension.
% The other is a string indicating the class the data belong to.

%---------------------------network training with iris.data/append.txt---------------------------------

switch nargin
case 5,    
    e0=0.01;
case 6,
    times=1000;
end
size_out=size(y,1);
size_in=size(data,2)-1;

disp(['Starting Artificial Neural Network Training ...']);
d=0.7;  %initial step size
for t=1:times,
    total(t)=0;    
    %disp(['This is the ' int2str(t) 'th time computing..']);
    for i=1:size(data,1),
        net(1).x=data(i,1:size_in)';
        %disp(net(2).w)
        %disp(net(2).out)
        net=forward(net);
        [net,e]=backward(net,y(:,data(i,size_in+1)),d);
        total(t)=total(t)+e;
    end
    if rem(t,4)==0,
       temp1=total(t:-1:t-3);
       temp2=sort(temp1);
       if(temp1==temp2),
          d=min(d*1.1,1.2);
          disp(['The step size increase to  ' num2str(d) ]);
       else
          if total(t)>total(t-1),
             d=max(d*0.9,0.01);
             disp(['The step size decrease to  ' num2str(d) ]);
          end
       end
    end              
    disp(['The ' int2str(t) 'th time computing error is   ' num2str(total(t)) ]);
    if total(t)<e0,
       break;
    end 
    %temp.value=data;
    %temp=rdata(temp);
    %data=temp.value;
end
%store 500 step error
store=500;
size_total=size(total,2);
if size_total<store,
    total(size_total+1:store)=NaN;
elseif size_total>500,
    temp=total(size_total-store:size_total);
end
disp(['In this group the error is ' num2str(total(t)) ]);
if size(trndata,2)==0,
   result=0;
   return
end

% -------------------------------check with trndata----------------------------
for n=1:size(trndata,2),    
    result.train(n).correct=0;
    result.train(n).wrong=0;
    result.train(n).refuse=0;    
    for i=1:size(trndata(n).value,1),
        %i
        net(1).x=trndata(n).value(i,1:size_in)';
        %disp(net(1).x')
        net=forward(net);
        %disp(net(4).out')
        result.train(n).value(i,:)=net(size(net,2)).out';        
        result.train(n).e(i,:)=(net(size(net,2)).out-y(:,n))';
        %disp([net(size(net,2)).out  y(:,n)])
        %disp([ 'net in:'  num2str(net(1).x')  '   net out:'  num2str(net(3).out)])
        refuse=1;        
        for j=1:size(y,2),
            ex=net(size(net,2)).out-y(:,j);
            %result.train(n).value
            %result.train(n)
            %disp(['absresult.train(' int2str(n) ').e(' int2str(i) ',:)'])
            %abs(result.train(n).e(i,:))
            %n
            %j
            if abs(ex)<0.3,
               if n==j,
                  %if n==2,
                  %    disp('ok')
                  %end
                  result.train(n).correct=result.train(n).correct+1;
                  refuse=0;
                  break;
               else
                  result.train(n).wrong=result.train(n).wrong+1;
                  refuse=0;
                  break;
               end
            end
        end           
        result.train(n).refuse=result.train(n).refuse+refuse;
    end
end
% ----------------------------------------check with chkdata------------------------------------
for n=1:size(chkdata,2),
    result.check(n).correct=0;
    result.check(n).wrong=0;
    result.check(n).refuse=0;    
    for i=1:size(chkdata(n).value,1),
        net(1).x=chkdata(n).value(i,1:size_in)';
        net=forward(net);
        result.check(n).value(i,:)=net(size(net,2)).out';
        result.check(n).e(i,:)=(net(size(net,2)).out-y(:,n))';
        refuse=1;
        for j=1:size(y,2),
            ex=net(size(net,2)).out-y(:,j);
            if abs(ex)<0.3,
               if n==j,
                  result.check(n).correct=result.check(n).correct+1;
                  refuse=0;
                  break;
               else
                  result.check(n).wrong=result.check(n).wrong+1;
                  refuse=0;
                  break;
               end
           end
        end       
        result.check(n).refuse=result.check(n).refuse+refuse;        
    end
end
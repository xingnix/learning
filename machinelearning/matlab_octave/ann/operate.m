function  nn=operate(str,group)
%main function
%operate(group)

tic;  % start timer
switch nargin,
case 0,
    str='iris_data';
    group=1;
case 1,
    group=1;    
end

% -----------------------load data form file and preparing work------------------------------
switch str,
   case 'iris_data',     
        data=iris_data;
        data=rdata(data);
        [trndata,trndata0,chkdata,y]=prepare(data);
        midlayer=[8] ;      %hidden layer nodes number
        netstr=['k' 's' 's'];
        draw=1; 
   case 'append_txt',
        data=append_txt;
        data=rdata(data);
        [trndata,trndata0,chkdata,y]=prepare(data);   
        midlayer=[8] ;      %hidden layer nodes number
        netstr=['k' 's' 's'];
        draw=1;
    case 'classify',
        load data.mat; % import variable 'data' 
        data=rdata(data);
        [trndata,trndata0,chkdata,y]=prepare(data);
        midlayer=[8] ;      %hidden layer nodes number
        netstr=['k' 's' 's'];
        draw=1;
   case 'app_sin',
        data=app_sin;
        %trndata=rdata(data);
        trndata=data;
        y=trndata.y';
        trndata0(max(group)).data=[];
        chkdata(max(group)).data=[];
        midlayer=[20] ;      %hidden layer nodes number
        netstr=['k' 's' 's'];
        draw=2;
    case 'approach',
        group=1;
        load data.mat; % import variable 'data' 
        trndata=rdata(data);
        y=trndata.y';
        trndata0(max(group)).data=[];
        chkdata(max(group)).data=[];
        midlayer=[18] ;      %hidden layer nodes number
        netstr=['k' 's' 's'];
        draw=2;
end    
% -----------------------------------initialize the Ann------------------------------------ 
size_out=size(y,1);
size_in=size(trndata(1).value,2)-1;

%---------------------------------------------training-------------------------------------------------
for i=1:size(group,2),
    net=AnnBp([size_in,midlayer,size_out],netstr);
    [net,e(group(i),:),result(group(i))]=train(net,trndata(group(i)).value,trndata0(group(i)).data,chkdata(group(i)).data,y,0.001,200);
    nn(i).net=net;
end    
timer=toc; %close timer

%************************************----graphic----*****************************************

if draw==1,%--------------------------------------------graphic for classifying ANN---------------------------------------
   disp(['-------Mission complete , using time:  ' num2str(timer) '  seconds----------- ']);
   for n=1:size(group,2),
       figure;
       g=group(n);
       plot(e(g,:));
       title(['This is the group ' int2str(g) '  training error']);

       figure;
       hold on;
       title(['This is the group  ' int2str(g) '  training data error']);
       for i=1:size(result(g).train,2), 
           disp(['group  ' int2str(g)  '   class ' int2str(i)  ' training data correct number:' int2str(result(g).train(i).correct)]);
           N=result(g).train(i).correct+result(g).train(i).refuse+result(g).train(i).wrong;
           percent=result(g).train(i).correct/N;
           disp([ 'Data number is  ' int2str(N)  '.  correct percent ;' num2str(percent*100) ' %']);
           %disp(['size(result(g).train(i).value)']);
           %size(result(g).train(i).value)        
           %result(g).train(i).value
           %min(i,size(e,2))
           %size(result(g).train(i).e)
           j=min(i,size(result(g).train(i).e,2));
           %result(g).train(i).e(:,i)
           plot(result(g).train(i).e(:,j),'o-');
       end
       hold off;
       figure;
       hold on;
       title(['This is the group ' int2str(g) ' checking data error']);
       for i=1:size(result(g).check,2),        
           disp(['group  ' int2str(g) '  class' int2str(i)  ' checking data correct number:' int2str(result(g).check(i).correct)]);
           N=result(g).check(i).correct+result(g).check(i).refuse+result(g).check(i).wrong;
           percent=result(g).check(i).correct/N;
           disp(['Data number is ' int2str(N)  '.    correct percent ;'  num2str(percent*100)  ' %']);
           %disp(['size(result(g).check(i).value)']);
           %result(g).check(i).e       
           j=min(i,size(result(g).check(i).e,2));
           plot(result(g).check(i).e(:,j),'o-');
       end
       hold off;
   end 
else%--------------------------------------------graphic for approaching ANN---------------------------------------
    figure;
    plot(e);
    title(['This is the  training error']);
    I1=size(data.value,1);
    I2=size(data.value,2)-1;  % Under the condition dimension of y is 1.
    for i=1:I1,
        [net,out(i,:)]=forward(net,trndata.value(i,1:I2)');
    end
    figure;
    plot(data.x(:,1),out,data.x(:,1),y); % Under the condition dimension of x is 1.
    %plot(out);
    %hold on;
    %plot(data.x(:,1),y);
    legend('ANN output','Training data');
    %plot(y);
    %hold off;
    %trndata.value
    %out
    %hold on;
    %plot(trndata.value(:,1),y); 
end

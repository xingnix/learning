function [trndata,trndata0,chkdata,y]=prepare(data)
%function [trndata,trndata0,chkdata,y]=prepare(data)
%prepare data for training classifying nnet



%----------------------------set net output width---------------------------
size_out=size(data,2);
if size_out~=2,
   y=eye(size_out); % system expected output
else
   y=[1 0];   % single node to classify two class
end
data=rdata(data); % get random data

F=1;
add=0; 
normal=0;
%------add one dimension of amplitude (1)
if add~=0&F~=1,   
   for i=1:size(data,2),        
       [n1,n2]=size(data(i).value);
       for j=1:n1,
           A=norm(data(i).value(j,:));
           %data(i).value(j,:)=data(i).value(j,:)/A;
           data(i).value(j,n2+1)=A;
       end
   end
end
%-----------select 10 group for every kind of data for training and checking------------
for s=1:10,
    
    for i=1:size_out,
      num=size(data(i).value,1);
      d=size(data(i).value,2);
      n=floor(num/10);         %the number of check group (10%)
      r=rem(num,10);
      chkdata(s).data(i).value=data(i).value(n*(s-1)+1:n*s+r,:);
      trndata0(s).data(i).value(1:n*(s-1),:)=data(i).value(1:n*(s-1),:);
      trndata0(s).data(i).value(n*s+1-n:num-n-r,:)=data(i).value(n*s+r+1:num,:);
      trndata0(s).data(i).value(:,d+1)=ones(size(trndata0(s).data(i).value,1),1)*i;      
    end     
    
    % eliminate quantity effect (1)
    c1=[];
    %c2=[];
    for i=1:size_out,    
      c1=[c1 size(trndata0(s).data(i).value,1)];
      %c2=[c2 sum(c1)];    
    end
    %c1
    %r=rand;
    [max1,Ia]=max(c1);
    [min1,Ii]=min(c1);
    n=round(max1/min1);
    
    temp=[];
    for i=1:size_out,  
      %prepare for cross training 
      if i==Ii & n>=2,
         for k=1:n,
             temp=[temp;trndata0(s).data(i).value];   % eliminate quantity effect (2)
             %size(temp)
         end
         %size(temp)
      else
         temp=[temp;trndata0(s).data(i).value]; 
      end      
      %i
      %size(temp)
    end
    %--------------------------- a(:,i)/abs(max(a)) ------------------------------------
    [n1,n2]=size(temp);
    if normal==1,
       for k=1:n2-2,
           m=max(temp(:,k));
           n=min(temp(:,k));
           m=m+(m-n)/n2;
           n=n-(m-n)/n2;  % prevent  1*2pi=0
           mn=(m-n);
           mn2=mn/2;
           temp(:,k)=(temp(:,k)-n-mn2*1);%/mn2;
           for q=1:size_out,
               chkdata(s).data(q).value(:,k)=(chkdata(s).data(q).value(:,k)-n-mn2*1);%/mn2;
               trndata0(s).data(q).value(:,k)=(trndata0(s).data(q).value(:,k)-n-mn2*1);%/mn2;
           end
       end
       for r=1:size(temp,1),
           temp(r,n2-1)=norm(temp(r,1:n2-2));
           temp(r,1:n2-2)=temp(r,1:n2-2)/temp(r,n2-1);    
       end
       m=max(temp(:,n2-1));
       n=min(temp(:,n2-1));
       n=n-(m-n)/n2;
       m=m+(m-n)/n2;
       mn2=(m-n)/2;
       temp(:,n2-1)=(temp(:,n2-1)-n-mn2)/mn2;
       %temp(:,n2-1)=temp(:,n2-1)/m;
       % row 1:n2-2 direction . row n2-1 amplitude .row n2  y
       for q=1:size_out,
           for r=1:size(chkdata(s).data(q).value,1),
               A=norm(chkdata(s).data(q).value(r,1:n2-2));
               chkdata(s).data(q).value(r,1:n2-2)=chkdata(s).data(q).value(r,1:n2-2)/A;
               chkdata(s).data(q).value(r,n2-1)=(A-n-mn2)/mn2;
           end
           for r=1:size(trndata0(s).data(q).value,1),
               A=norm(trndata0(s).data(q).value(r,1:n2-2));
               trndata0(s).data(q).value(r,1:n2-2)=trndata0(s).data(q).value(r,1:n2-2)/A;
               trndata0(s).data(q).value(r,n2-1)=(A-n-mn2)/mn2;%A/m;
           end
       end 
    end
    if add==1,% add one dimension of amplitude (2)---change amplitude to phase
           temp1=temp(:,1:n2-2);
           temp1(:,n2-1)=sin(pi*temp(:,n2-1));
           temp1(:,n2)=cos(pi*temp(:,n2-1));
           temp1(:,n2+1)=temp(:,n2);
           temp=temp1;
           for q=1:size_out,
               tempvalue=chkdata(s).data(q).value;
               temp1=tempvalue(:,1:n2-2);
               temp1(:,n2-1)=sin(pi*tempvalue(:,n2-1));
               temp1(:,n2)=cos(pi*tempvalue(:,n2-1));
               chkdata(s).data(q).value=temp1;
               
               tempvalue=trndata0(s).data(q).value;
               temp1=tempvalue(:,1:n2-2);
               temp1(:,n2-1)=sin(pi*tempvalue(:,n2-1));
               temp1(:,n2)=cos(pi*tempvalue(:,n2-1));
               trndata0(s).data(q).value=temp1;
           end           
    elseif add==2,% add one dimension of amplitude (2)---change amplitude to phase
           K=5;
           K1=5;
           a=2;
           temp1=temp(:,1:n2-2);
           temp1(:,n2-1)=K*cos(pi*temp(:,n2-1)/a); %sphere (1)
           temp1(:,n2)=temp(:,n2);
           for r=1:n2-2,
               temp1(:,r)=K1*temp(:,r).*abs(sin(pi*temp(:,n2-1)/a));  %sphere (2)
           end
           temp=temp1;
           for q=1:size_out,              
               tempvalue=chkdata(s).data(q).value;
               temp1=tempvalue(:,1:n2-2);
               temp1(:,n2-1)=K*cos(pi*tempvalue(:,n2-1)/a);
               for r=1:n2-2,
                   temp1(:,r)=K1*tempvalue(:,r).*abs(sin(pi*tempvalue(:,n2-1)/a));
               end
               chkdata(s).data(q).value=temp1;
               
               tempvalue=trndata0(s).data(q).value;
               temp1=tempvalue(:,1:n2-2);
               temp1(:,n2-1)=K*cos(pi*tempvalue(:,n2-1)/a);
               for r=1:n2-2,
                   temp1(:,r)=K1*tempvalue(:,r).*abs(sin(pi*tempvalue(:,n2-1)/a));
               end
               trndata0(s).data(q).value=temp1;
           end
    elseif F==1,
           for k=1:n2-1,
               m=max(temp(:,k));
               n=min(temp(:,k));
               n=n-(m-n)/n2;  % prevent  1*2pi=0
               mn=(m-n);
               mn2=mn/2;
               temp(:,k)=(temp(:,k)-n-mn2*0)/mn;
               for q=1:size_out,
                   chkdata(s).data(q).value(:,k)=(chkdata(s).data(q).value(:,k)-n-mn2*0)/mn;
                   trndata0(s).data(q).value(:,k)=(trndata0(s).data(q).value(:,k)-n-mn2*0)/mn;
               end
           end
           temp1=[];
           for r=1:n2-1,
               temp1(:,2*r)=sin(2*pi*temp(:,r)); 
               temp1(:,2*r-1)=cos(2*pi*temp(:,r)); 
           end
           temp1(:,size(temp1,2)+1)=temp(:,n2);
           temp=temp1;
           for q=1:size_out,              
               tempvalue=chkdata(s).data(q).value;
               temp1=[];
               for r=1:n2-1,
                   temp1(:,2*r)=sin(2*pi*tempvalue(:,r));
                   temp1(:,2*r-1)=cos(2*pi*tempvalue(:,r));
               end
               chkdata(s).data(q).value=temp1;
               
               tempvalue=trndata0(s).data(q).value;
               temp1=[];
               for r=1:n2-1,
                   temp1(:,2*r)=sin(2*pi*tempvalue(:,r));
                   temp1(:,2*r-1)=cos(2*pi*tempvalue(:,r));
               end
               trndata0(s).data(q).value=temp1;
           end
    end
    %temp
    trndata(s).value=temp;    
    %size(trndata(s).value)
    trndata(s)=rdata(trndata(s)); % get random data for training
end

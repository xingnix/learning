function    [Data]=iris_data(N,n,m)
%[Data]=iris_data(N,n,m)
%Get data from iris.data
%N:total data number
%n:one kind data number
%m:dimension of input value

if nargin==0,
    N=150;
    n=50;
    m=4;
end
fid=fopen('iris.data');
for i=1:N/n,
    for j=1:n,
        for k=1:m,
            Data(i).value(j,k)=fscanf(fid,'%f',1);
            temp=fscanf(fid,'%c',1);
        end
        temp=fscanf(fid,'%s',1);
    end
    Data(i).name=temp;
end
fclose(fid);
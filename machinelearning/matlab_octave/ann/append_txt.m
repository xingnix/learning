function    [Data]=append_txt()
%Get data from append.txt

fid=fopen('append.txt');
fscanf(fid,'%s',1); %get string 'n='
n=fscanf(fid,'%f',1);
fscanf(fid,'%s',1); %get string 'l='
l=fscanf(fid,'%f',1); 
fscanf(fid,'%s',1); %get string 'yflag='
yflag=fscanf(fid,'%f',inf);  % get yflag
fscanf(fid,'%s',1);  %get string 'Y'
Y=fscanf(fid,'%f',inf); %get data of Y 
fscanf(fid,'%s',1);
Data1=fscanf(fid,'%f',[n,inf]);
Data1=Data1';
fclose(fid);
%put data into a struct
temp=Y(1);
c=1;
i_1=1;
for i=1:size(Y,1),
    if Y(i)~=temp,
      Data(c).name=temp;
      Data(c).value=Data1(i_1:i-1,1:n);
      c=c+1;
      i_1=i;
      temp=Y(i);
    end   
end
Data(c).name=temp;
Data(c).value=Data1(i_1:i,1:n);
input_string=[[
Example Sky AirTemp Humidity Wind Water Forecast  EnjoySport
1       Sunny  Warm  Normal  Strong  Warm  Same   Yes
2       Sunny  Warm  High    Strong  Warm  Same   Yes
3       Rainy  Cold  High    Strong  Warm  Change No
4       Sunny  Warm  High    Strong  Cool  Change Yes ]]

s={}  -- rule
-- get names
first_line_end=string.find(input_string,'\n');
name_line=string.sub(input_string,1,first_line_end-1)
names={}
for item in string.gmatch(name_line.." ","[^ ]+ ") do
             table.insert(names,string.sub(item,1,#item-1)) 
end
--- get data
data_lines=string.sub(input_string,first_line_end+1)
samples={}
lines={}  
for line in string.gmatch(data_lines.."\n","[^\n]+\n") do 
        table.insert(lines,line)
        items={}
	for item in string.gmatch(string.sub(line,1,#line-1).." ","[^ ]+ ") do
             table.insert(items,string.sub(item,1,#item-1)) 
	end
	sample={}
	for index,name in ipairs(names) do
	     if(index~=1) then
	           sample[name]=items[index] 
	     end
	end
	table.insert(samples,sample)
end

-- train
for _,sample in ipairs(samples) do
	if (sample[names[#names]]=='Yes') then
        	for _,name in ipairs({table.unpack(names,2,#names-1)}) do
        		       if(s[name]==nil) then
        		             s[name]=sample[name]
        	               elseif(s[name]~=sample[name]) then
        		             s[name]='?'
        		       end
        	end
	end
end

function treeview(tree,space)
print(space .. "{")
for k,v in pairs(tree) do
   if type(v)=="table" then
       print(space .. k)
       treeview(v,  space .. ".......")
   else
      print(space .. k , v)
   end
end
print(space .. "}")
end
print("s=")
treeview(s,"")

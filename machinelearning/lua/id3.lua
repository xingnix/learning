input_string=[[
Day Outlook   Temperature  Humidity   Wind   PlayTennis
D1  Sunny     Hot          High       Weak   No
D2  Sunny     Hot          High       Strong No
D3  Overcast  Hot          High       Weak   Yes
D4  Rain      Mild         High       Weak   Yes
D5  Rain      Cool         Normal     Weak   Yes
D6  Rain      Cool         Normal     Strong No
D7  Overcast  Cool         Normal     Strong Yes
D8  Sunny     Mild         High       Weak   No
D9  Sunny     Cool         Normal     Weak   Yes
D10 Rain      Mild         Normal     Weak   Yes
D11 Sunny     Mild         Normal     Strong Yes
D12 Overcast  Mild         High       Strong Yes
D13 Overcast  Hot          Normal     Weak   Yes
D14 Rain      Mild         High       Strong No
]]


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

table.remove(names,1)  -- remove the name "Day"
targetname=table.remove(names,#names)  -- remove  "PlayTennis", assign to targetname
P='Yes'
N='No'

-- get the set of various values
value_set={}
for i,name in ipairs(names) do
    value_set[name]={} 
end
for _,sample in ipairs(samples) do
      for i,name in ipairs(names) do
            function insert_different_value(values,value)
               for i,v in ipairs(values) do
	             if(v==value) then return end
	       end
	       table.insert(values,value)
	    end
	    insert_different_value(value_set[name],sample[name])
      end
end

function pncount(indices)
local p=0
local n=0
local majority="unknown"
for _,i in ipairs(indices) do
    if samples[i][targetname]==P  then 
        p=p+1 
    else
        n=n+1
    end
end
if p>n then 
    majority=P
elseif n>p  then
    majority=N
end
return p,n,majority
end
function entropy(indices)
local p,n,majority=pncount(indices)
if p*n~=0 then
    return -p/#indices*math.log(p/#indices)/math.log(2)-n/#indices*math.log(n/#indices)/math.log(2)
else
	return 0
end
end
function gain(indices,a)
local e=entropy(indices)
if a==nil then return e end
for _,v in ipairs(value_set[a]) do
    local indices_v=filt(indices,a,v)
    e=e-#indices_v/#indices*entropy(indices_v)
end
return e
end
function bestattribute(indices,attributes)
local maxgain=0
local A=nil
for _,a in ipairs(attributes) do
    newgain=gain(indices,a)
    if newgain>maxgain then
        A=a
	maxgain=newgain
    end
end
return A
end
function filt(indices,name,v)
local indices_v={}
for _,index in ipairs(indices) do
   if samples[index][name]==v then
       table.insert(indices_v,index)
   end
end
return indices_v
end
function id3(indices,attributes)
local p,n,majority=pncount(indices)
if p==0 then return {label=N} end
if n==0 then return {label=P} end
if #attributes==0 then return {label=majority} end

local node={decision=bestattribute(indices,attributes)}
for _,v in ipairs(value_set[node.decision]) do
    indices_v=filt(indices,node.decision,v)
    if #indices_v ==0 then
       node[v]={label=majority}
    else
       attributes_v={}
       for j,x in ipairs(attributes) do
           if x~=node.decision then table.insert(attributes_v,x) end
       end
       node[v]=id3(indices_v,attributes_v)
    end
end
return node
end

indices={}
for i=1,14 do indices[i]=i end
attributes=names
tree=id3(indices,attributes)

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
-- treeview(tree,"")
function prettytreeview(tree,space)
if tree["label"]==nil then
    print(space .. "|--" .. "decision" , tree["decision"])
    for _,v in ipairs(value_set[tree["decision"]]) do
        print ( space .. "|--" .. v)
	prettytreeview(tree[v], space .. ":       ")
    end
else 
    print(space .. "" .. "label" , tree["label"])
end
end
prettytreeview(tree,"")

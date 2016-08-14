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

table.remove(names,1)  -- remove the name "Example"
targetname=table.remove(names,#names)  -- remove  "EnjoySport", assign to targetname
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




function consistent_one(h,sample)
    for n,v in pairs(h) do
        if(v~='?' and sample[n]~=v) then 
                    if(sample[targetname]==P) then 
                        return false
                    else
                         return true
	            end
        end
    end
    if(sample[targetname]==P) then
        return 	true 
    else
        return false
    end
end

function minigeneralize(S,G,s,sample)
local h={}
for n,v in pairs(s) do
   if(v=='none') then h[n]=sample[n]
   else
       if(v~=sample[n]) then h[n]='?' 
       else h[n]=v end
   end
end
function moregeneral(G,h)
return true
end
if(moregeneral(G,h)) then table.insert(S,h) end
end

function generalize(S,G,sample)
    local newS={}
    for _,s in ipairs(S) do
        if(consistent_one(s,sample)) then 
            table.insert(newS,s)
	else
	    minigeneralize(newS,G,s,sample)
	end
    end
    return newS
end

function minispecialize(G,S,g,sample)
    function morespecial(S,g)
	function morespecial_one(s,g)
	   for n,v in pairs(s) do
	      if(g[n]~='?' and g[n]~=v) then return false end
	   end
	   return true
	end
	for _,s in ipairs(S) do
	    if(morespecial_one(s,g)) then return true end
	end
        return false
    end
    for name,values in pairs(value_set) do
        if(g[name]=='?') then
            for _,value in ipairs(values) do
    	       if(value~=sample[name]) then
                       h={}
                       for n,v in pairs(g) do
    	                   if(name==n) then 
    	                      h[n]=value
    	                   else
    	                      h[n]=v
    	                   end
    	               end
                       if(morespecial(S,h)) then table.insert(G,h) end
    	       end
            end
        end
    end
end

function specialize(G,S,sample)
    local newG={}
    for _,g in ipairs(G) do
        if(consistent_one(g,sample)) then 
            table.insert(newG,g)
	else
	    minispecialize(newG,S,g,sample)
	end
    end
    return newG
end

function filter(H,sample)
	local newH={}
	for _,h in ipairs(H) do
	    if(consistent_one(h,sample)) then
	        table.insert(newH,h)
	    end
	end
	return newH
end

-- test

h={}
for _,name in ipairs(names) do
h[name]='?'
end

s={}
for n,v in pairs(h) do s[n]='none' end
S={s}

g={}
for n,v in pairs(h) do g[n]='?' end
G={g}

vs={}
vg={}
for i,sample in ipairs(samples) do
    if(sample[targetname]==P) then
        G=filter(G,sample)
        S=generalize(S,G,sample)
    else 
        S=filter(S,sample)
        G=specialize(G,S,sample)
    end
    table.insert(vs,S)
    table.insert(vg,G)
end

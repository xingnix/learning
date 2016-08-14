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

--    first attempt  start ----------------------------------------
--  expand in state space
states={}
for i,name in ipairs(names) do
    states[name]={} 
end
state_sets={}
function expand(sample)
state_set={sample}
for name,values in pairs(value_set) do
    states={}
    for _,state in ipairs(state_set) do
        for _,value in ipairs(values) do
            if(state[name]=='?') then 
	           newstate={}
                   for n,v in pairs(state) do
    	              if(n==name) then
    		          newstate[n]=value
    		      else
                          newstate[n]=v
    		      end
    	           end
    		   table.insert(states,newstate)
            end
        end
    end
    table.insert(state_sets,states)
    state_set=states
end
return state_set
end

h={}
for _,name in ipairs(names) do
h[name]='?'
end
e=expand(h)

-- eliminate unconsistant
function consistent_one(h,sample)
    for n,v in pairs(h) do
        if(sample[n]~=v) then 
		  return true
        end
    end
    if(sample[targetname]==P) then 
        return 	true 
    else
        return false
    end
end
function consistent_all(h,samples)
    for _,sample in ipairs(samples) do
        if(not consistent_one(h,sample)) then return false end
    end
    return true
end

remains={}
for _,h in ipairs(e) do
   if(consistent_all(h,samples)) then table.insert(remains,h) end
end

--- WARNING: remains are individual specialist rules consistent to  samples
--    first attempt  end ----------------------------------------


--    second attempt  start ----------------------------------------
--  expand in state space
states={}
for i,name in ipairs(names) do
    states[name]={} 
end
state_sets={}
function expand(sample)
state_set={sample}
for name,values in pairs(value_set) do
    valuesclone={table.unpack(values)}
    table.insert(valuesclone,'?')
    states={}
    for _,state in ipairs(state_set) do
        for _,value in ipairs(valuesclone) do
            if(state[name]=='?') then 
	           newstate={}
                   for n,v in pairs(state) do
    	              if(n==name) then
    		          newstate[n]=value
    		      else
                          newstate[n]=v
    		      end
    	           end
    		   table.insert(states,newstate)
            end
        end
    end
    table.insert(state_sets,states)
    state_set=states
end
return state_set
end

h={}
for _,name in ipairs(names) do
h[name]='?'
end
e=expand(h)

-- eliminate unconsistant
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
function consistent_all(h,samples)
    for _,sample in ipairs(samples) do
        if(not consistent_one(h,sample)) then return false end
    end
    return true
end

remains={}
for _,h in ipairs(e) do
   if(consistent_all(h,samples)) then table.insert(remains,h) end
end

--- remains are individual specialist rules consistent to  samples
--  second attempt end ----------------------------------------



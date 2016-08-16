function quadraticform(w,b)
  local function f(x) 
	local r=0
	for i,row in ipairs(w) do
	    for j,v in ipairs(row) do
	        r=r+(x[i]-b[i])*v*(x[j]-b[j])
	    end
	end
	return  r
  end
  local function gradient(x)
	local r={}
	for i =1,#w do
	    r[i]=0
	end
	for i,row in ipairs(w) do
	    for j,v in ipairs(row) do
	        r[i]=r[i]+v*(x[j]-b[j])
	    end
	end
	return r
  end
  return f,gradient
end
f , gradient =quadraticform({{1, 0},{0,2}},{1 , 1})
x={{0 , 3}}
for n =0,100  do
    xnew={}
    for i,v in ipairs(x[#x])do
    xnew[i]=v
    end
    print("n=" .. n, "x1=" .. xnew[1],"x2=" .. xnew[2])
    for i,v in ipairs(gradient(x[#x])) do
        xnew[i]=xnew[i]-v*0.3
    end
    table.insert(x,xnew)
    local e=0
    for i,v in ipairs(x[#x]) do
        e=e+math.pow(v-x[#x-1][i],2)
    end
    if e<0.000001 then
         break
    end
end

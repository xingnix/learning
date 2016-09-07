ffi=require "ffi"
matrix=ffi.load("./matrix.so")
ffi.cdef([[
double quadratic( double w[],double x[],double b[],int i);
void gradient( double out[],double w[],double x[],double b[],int i);
void multiply(double out[], double x[],double y[],int i, int j, int k);
double norm(double x[],int n);
]])
v=ffi.typeof('double[?]')
o=v(2)
w=v(4,1,0,0,2)
x=v(2,1,1)
b=v(2,1,2)
f=v(1)
matrix.multiply(o,w,x,2,2,1)
matrix.multiply(f,o,x,1,2,1)

-- print(f[0])
-- e=matrix.norm(x,2)
-- print(e)
n=2
function quadraticform(w,b,n)
    local function f(x)
	return  matrix.quadratic(w,x,b)
    end 
    local function g(x)
	r=v(n)
	matrix.gradient(r,w,x,b,2)
	return r
    end 
    return f,g
end

f , g =quadraticform(w,b,n) 
x={v(2,0,0)}
for t =1,100  do  
	r=g(x[t])
        xnew=v(2)
	for i =0,2 do xnew[i]=x[t][i]-r[i]*0.3 	end 
	table.insert(x,xnew)
	print("t=" .. n, "x1=" .. xnew[0],"x2=" .. xnew[1])

        local e=v(2) 
	for i =0,2 do  e[i]=xnew[i]-x[t][i]end 
	if matrix.norm(e,2)<0.01 then    break	end
end

-- Illustrate interface with C in LuaJIT
-- run:
-- luajit gradientdescent_matrix.lua 

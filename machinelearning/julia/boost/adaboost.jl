using LinearAlgebra


function sigmoid_batch( w, x, y)
    k = x[1,:] * 0 + rand(size(x)[2],1) .- 0.5
    for i in range(1,100)
        o1 = 1 ./ (1 .+ exp.(-(x*k)))
        o2 = 2 * (o1 .- 0.5)
	dk = size(w)[1] * x'*diagm(w[:,1])*(o1 .* (1 .- o1) .* (o2 .- y))

        if norm(dk) < 0.001
            break
        else
            k = k - 5.3* dk
        end
    end
    o1 = 1 ./ (1 .+ exp.(-(x*k)))
    o2 = 2 * (o1 .- 0.5)
    o2[o2 .>= 0] .= 1
    o2[o2 .< 0] .= -1
    #epsilon = (exp.(-y .* o2)'*w- exp.(-abs.(y))'*w) ./ (exp.(abs.(y))'*w)
    epsilon = abs.(y - o2)'*w/2

    function test(x)
        o = x*k
        o[o .>= 0] .= 1
        o[o .< 0] .= -1
	return Int.(o)
    end
    return (test,epsilon)
end


function sigmoid_single(w, x, y)
    k = x[1,:] * 0 + rand(size(x)[2],1) .- 0.5
    for i in range(1,500)
	for t in range(1,size(x)[1])
            o1 = 1 ./ (1 .+ exp.(-(x[t,:]'*k)))
            o2 = 2 * (o1 .- 0.5)
            dk =  size(w)[1] * x[t,:] * w[t] * o1 .* (1 .- o1) .* (o2 .- y[t])

            if norm(dk) < 0.001
                break
            else
                k = k .- 5*dk
            end
         end
    end
    o1 = 1 ./ (1 .+ exp.(-(x*k)))
    o2 = 2 * (o1 .- 0.5)
    o2[o2 .>= 0] .= 1
    o2[o2 .< 0] .= -1
    #epsilon = (exp.(-y .* o2)'*w - exp.(-abs.(y))'*w) ./ exp.(abs.(y))'*w
    epsilon = abs.(y - o2)'*w/2


    function test( x)
        o = x*k
        o[o .>= 0] .= 1
        o[o .< 0] .= -1
	return Int.(o)
    end
    return (test,epsilon)
end

function decision_stump(w, x, y)
        e = Inf
	#e2=Inf
	pin=0
	index=0
	flag=0
	for i in range(1,size(x)[2])
            d = sort(x[:, i])
	    s=d[2:end]-d[1:end-1]
	    for j in (d[1:end-1] + s/2)[s.>0]
                for n in [-1, 1]
                    t = ones(size(y)) * n
		    t[x[:,i]  .< j] .= -n
		    new_e = dot(abs.(t - y),w) / 2.0
		    #new_e2= (sum(dot(w,y-t .> 0))/sum(y.>0))^2+(sum(dot(w,y-t.<0))/sum(y.<0))^2

                    if new_e < e
                        #e2 = new_e2
			e= new_e
                        pin = j
                        index = i
                        flag = n 
                    end
                 end
            end
        end
        test =  x_test-> (Int.(x_test[:, index] .> pin) * 2 .- 1) * flag
        epsilon = e
	return (test,epsilon)
end

function adaboost( x, y, T, weak)
    n = size(x)[1]
    w = ones(n,1) / n
    alpha = []
    F = []
    for t in range(1,T)
        (f,epsilon)=weak(w, x, y)
	F=vcat(F,f)
        alpha_t = 1.0 / 2 * log((1 .- epsilon) ./ epsilon)
	alpha = vcat(alpha,alpha_t)
        w = w .* exp.(-y .* alpha_t .* f(x))
        w = w ./ sum(w)
	#println(w)
    end

    function test(x)
        o = x[:, 1] * 0
	for t in range(1,size(F)[1])
	    #println("f(x)=",F[t](x)," alpha= ",alpha[t])
            o = o + F[t](x) * alpha[t]
        end

        o[o .>= 0] .= 1
        o[o .< 0] .= -1

	return Int.(o)
    end
    return test
end

println("-------------  xor problem ----------------")

# data set of xor problem
x = [1  0  1
     1  1  1
     0  0  1 
     0  1  1 ]
y = [1  -1  -1  1]'

println("input")
println(x)
println("expect")
println(y)

n = size(x)[1]
w = ones(n,1) / n

(m,epsilon) = sigmoid_batch(w, x, y)
o = m(x)
println("weak learner gradient descent (batch)")
println(o)

(m,epsilon) = sigmoid_single(w, x, y)
o = m(x)
println("weak learner gradient descent (single)")
println(o)

a = adaboost(x, y, 5, sigmoid_batch)
o = a(x)
println("adaboost (weak learner:gradient descent,batch)")
println(o)

a = adaboost(x, y, 3, sigmoid_single)
o = a(x)
println("adaboost (weak learner: gradient descent,single)")
println(o)

println("------------- 1D  ----------------")

x1 = [0  1  2   3   4   5  6  7  8   9]'
y1 = [1  1  1  -1  -1  -1  1  1  1  -1]'



println("input")
println(x1')
println("expect")
println(y1')
n1 = size(x1)[1]
w1 = ones(n1,1) / n1
(s,epsilon) = decision_stump(w1, x1, y1)
o1 = s(x1)
println("decision stump")
println(o1')

a = adaboost(x1, y1, 3, decision_stump)
o = a(x1)
println("adaboost with decision stump")
println(o')



println("------------- 2D  ----------------")

n=100
s=2
x=rand(n,s).-0.5
t=ones(n)
w=ones(n)/n
t[(x[:,1].<0) .& (x[:,2].<0)].=-1
#println(Int.(t)')


n  = size(x)[1]
w  = ones(n,1) / n
(f,epsilon) = decision_stump(w , x , t )
o = f(x)
println("total=",n,"  errors=",sum(abs.(o-t))/2)


f = adaboost(x, t, 5, decision_stump)
o = f(x)
println("total=",n,"   errors=",sum(abs.(o-t))/2)

#plot
using Plots
scatter(x[o.>0,:][:,1],x[o.>0,:][:,2])
scatter!(x[o.<0,:][:,1],x[o.<0,:][:,2])



N=100
s=2
x=rand(N,s).-0.5
t=ones(N)
w=ones(N)/N
t[x[:,1].>0].=-1
t[x[:,2].>0].=-1

function linear_classifier(x,t,w)
    x=cat(x,ones((size(x)[1],1)),dims=2)
    k=rand(s+1)
    for i in 1:1000
        # simple perceptron
        #E=exp.(-(w .* t) * sign.(x * k))
        #dk= -E .* (w .* t ) * sign(x)
        # sigmoid
        o1 = 1 ./ (1 .+ exp.(-(x * k)))
        o2 = 2 * (o1 .- 0.5)
        dk = 5 * length(w) * (w .* x)'  * (o1 .* (1 .- o1) .* (o2 - t))

        k-=0.1 * dk
    end

    function y(x)
        return sign.(x * k[1:end-1] .+ k[end])
    end
    return y
end

function train(weak,x,t)
    N=size(x)[1]
    w=ones(N)/N
    Y=[]
    Alpha=[]
    for i in 1:3
        y=weak(x,t,w)
        append!(Y,[y])
        n=sum(w .* abs.(t-y(x))/2)
        p=sum(w)-n
        append!(Alpha,log(p/n))
        w=w .* exp.(-1/2*Alpha[end]*t.*y(x))
        w=w/sum(w)
    end
    function F(x)
        return sign.(sum([alpha*y(x) for (y,alpha) in zip(Y,Alpha)]))
    end
    return F
end
y=train(linear_classifier,x,t)
o=y(x)

println("numbers of error: ",Int(sum((abs.(t-o)/2))))
println("error rate $(sum((abs.(t-o)/2)))%")

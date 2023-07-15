n1=30
n2=30
n=n1+n2
x1=randn(n1,1)
x2=randn(n2,1).+10
x=sort(vcat(x1,x2),dims=1)

k=2
mu=randn(1,2)*10
println("real mu=",[sum(x1)/n1 sum(x2)/n2])
println("initial mu=",mu)
for i in 1:10
    global mu
    p=exp.(-(x.-mu).^2)
    Ez=p./sum(p,dims=1)

    mu=sum(Ez.*x,dims=1)./sum(Ez,dims=1)
end
println("estimated mu =",mu)

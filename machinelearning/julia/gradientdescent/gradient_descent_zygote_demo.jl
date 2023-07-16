using Zygote

# simple example
function simple_example()
    f= (p)->
         (x)->p*x 
    p=randn() 
    for i in 1:50
         x=randn()
         g=gradient((p)->(f(p)(x).-x)^2,p)[1]
         p=p-0.1.*g
         println(p)
    end
    print(p)
end


# nonlinear example
function nonlinear()
    f(p,x)= p[1]*x[1]/(1+p[2]*x[2]^2)
    l(p,x,t)=sum((f(p,x)-t).^2)
    p=randn(2).+1.5
    for i in 1:5000
         x=randn(2)
         t=x[1]/(1+2*x[2]^2)
         g=gradient((p)->l(p,x,t),p)[1]
         p=p .-0.10.*g
         println(p)
    end
    print(p)
end

function main(args)
    if args[1]=="simple"
        simple_example()
    elseif args[1]=="nonlinear"
        nonlinear()
    else
       println("usage: julia gradient_descent_zygote_demo.jl  <args>\n <args>:  simple or nonlilear\n")
    end
end
main(ARGS)

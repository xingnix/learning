using LinearAlgebra

function createnetwork(n_in, n_out, n_hidden)
    return [Dict("w" => rand(n_hidden, n_in+1) .-0.5,
             "o" => zeros(n_hidden),
             "delta" => zeros(n_hidden)),
            Dict("w" => rand(n_out, n_hidden+1) .-0.5,
             "o" => zeros(n_out),
             "delta" => zeros(n_out))]
end

function forward(L, x)
    sigmoid = (y) -> 1.0 ./ (1.0 .+ exp.(-y))
    L[1]["o"] = sigmoid.(L[1]["w"] * x)
    L[2]["o"] = sigmoid.(L[2]["w"][:,1:end-1] * L[1]["o"]+L[2]["w"][:,end])
    return L[2]["o"]
end

function backward(L,o,t)
    L[2]["delta"] = o' .* (1 .-o') .* (t .-o)'
    L[1]["delta"] =  L[2]["delta"] * L[2]["w"][:, 1:end-1] .* L[1]["o"]' .* (1 .- L[1]["o"]')
    return L
end
function train(training_examples, eta, n_in, n_out, n_hidden)
    L = createnetwork(n_in, n_out, n_hidden)
    for n in 1:1000
        for (x, t) in training_examples
            o = forward(L, x)
            backward(L,o,t)
            L[2]["w"][:, 1:end-1] += eta * (L[1]["o"] *  L[2]["delta"])'
            L[2]["w"][:, end] += eta*L[2]["delta"]'
            L[1]["w"] += eta * (x * L[1]["delta"])'
        end
        p = precision(training_examples, L)
        println("iteration: ", n, "  precision: ", (p*100), "%")
        if  p == 1
            break
        end
    end
    return L
end

#	for (x,t) in training_examples
#		println(map(round,L[1]["o"]))
#		println(x,t,Int64(round(forward(L,x)[1])))
#    end


function precision(training_examples, L)
    return sum(map( xt-> sum(Float64.(abs.(forward(L, xt[1]).-xt[2]) .< 0.5)), 
                      training_examples))./length(training_examples)./length(training_examples[1][2])
end

function run_linear()
    training_examples = [([1, 1, 1], 1), ([-1, -1, 1], 0),
                         ([1, -1, 1], 0), ([-1, 1, 1], 0)]
    train(training_examples, 0.9, 2, 1, 3)
end

function run_xor()
    training_examples = [([1, 1, 1], 0), ([-1, -1, 1], 0),
                         ([1, -1, 1], 1), ([-1, 1, 1], 1)]
    train(training_examples, 0.9, 2, 1, 2)
end

function run_autoencoder()
    a = I(8)
    b = ones(8, 9)
    b[:, 1:end-1] = a
    training_examples = []
    for i in 1:8
        append!(training_examples,((b[i, :], a[i, :]),))
    end
    train(training_examples, 0.5, 8, 8, 3)
end

function usage()
    println("usage: \n julia  backpropogation.jl  <arg> \n  arg:  linear, xor, autoencoder")
end

function main(args)
if length(args) == 1
    if args[1] == "linear"
        run_linear()
    elseif args[1] == "xor"
        run_xor()
    elseif args[1] == "autoencoder"
        run_autoencoder()
    else
        usage()
    end
else
    usage()
end
end
main(ARGS)
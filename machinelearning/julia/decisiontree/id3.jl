input_string = "
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
D14 Rain      Mild         High       Strong No"

lines = map( x-> filter(y-> y != "",
                             split(x,r" +"))[2:end],  # drop first item "Example"
            filter( x-> match(r"^ *$",x)== nothing, split(input_string,"\n")))
names, data = lines[1], lines[2:end]
data_lines = map( x-> Dict(zip(names, x)), data)
values = Dict(zip(names,
                  reduce( (x, y) -> map(z-> push!(z[1],z[2]),
                                     zip(x, y)),
                         lines[2:end],
                         init=map(x->Set([]),lines[1]) )))
names, target = names[1:end-1], names[end]  # the last item is target
P = "Yes"
N = "No"


function pncount(indices)
    p = 0
    n = 0
    majority = "unknown"
    for i in indices
        if data_lines[i][target] == P 
            p = p + 1
        else
            n = n + 1
        end
    end
    if p > n 
       majority = P
    elseif n > p 
       majority = N
    end
    return p, n, majority
end

function entropy(indices)
    p,n,majority=pncount(indices)
    p=float(p)
    n=float(n)
    if p*n!=0 
        return -p/length(indices)*log2(p/length(indices))-n/length(indices)*log2(n/length(indices))
    else
        return 0
    end
end

function subindices(indices,name,v)
    return filter( x-> data_lines[x][name]==v,indices)
end

function gain(indices,name)
    e=entropy(indices)
    for v in (values[name])
        indices_v=subindices(indices,name,v)
        e=e-float(length(indices_v))/length(indices)*entropy(indices_v)
    end
    return e
end

function bestattribute(indices,attributes)
    maxgain = -1
    A = nothing
    for a in attributes
        newgain = gain(indices, a)
        if newgain > maxgain
            A = a
            maxgain = newgain
        end
    end
    return A
end


function id3(indices,attributes)
    p,n,majority=pncount(indices)
    if p==0 
        return Dict("label"=>N, "p/n"=>"["*string(p)*"+,"*string(n)*"-]")
    elseif n==0 
        return Dict("label"=>P, "p/n"=>"["*string(p)*"+,"*string(n)*"-]")
    elseif length(attributes)==0 
        return Dict("label"=>majority, "p/n"=>"["*string(p)*"+,"*string(n)*"-]")
    end

    node=Dict{Any,Any}("decision"=>bestattribute(indices,attributes),"p/n"=>"["*string(p)*"+,"*string(n)*"-]")
    for v in values[node["decision"]]
        indices_v=subindices(indices,node["decision"],v)
        if length(indices_v) ==0
            node[v]=Dict("label"=>majority,"p/n"=>"[0+,0-]")
        else
            attributes_v=filter(x->x!=node["decision"],attributes)
            tmp=id3(indices_v,attributes_v)
            node[v]=id3(indices_v,attributes_v)
        end
    end
    return node
end

tree=id3(1:14,names)

function prettytreeview(tree,space)
    if !( "label" in keys(tree))
        println(space * "|--" * "decision : " * tree["decision"] * tree["p/n"])
        for v in values[tree["decision"]]
            println( space * "|--" * v)
            prettytreeview(tree[v] , space * ":       ")
        end
    else
        println(space *"" * "label : " * tree["label"] * tree["p/n"])
    end
end
prettytreeview(tree,"")

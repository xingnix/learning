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
vals = Dict(zip(names,
                  reduce( (x, y) -> map(z-> push!(z[1],z[2]),
                                     zip(x, y)),
                         lines[2:end],
                         init=map(x->Set([]),lines[1]) )))
names, target = names[1:end-1], names[end]  # the last item is target
P = "Yes"
N = "No"


# initialize probability table
function init(names,vals)
   p=Dict()
   for t in [P,N]
        p[t]=Dict()
        for name in names
            p[t][name]=Dict()
            for v in vals[name]
                p[t][name][v]=0
            end
        end
    end
   return p
end

function init_alt(names,vals)
    return Dict(map(t->
                     [t,Dict(map(name->
                                  [name,Dict(map(v-> 
                                                [v,0],
                                               collect(vals[name])))],
                                   names))],
                     [P,N]))
end

# counting occurrance
function count(prob,data_lines,names,vals)
    for sample in data_lines
        for name in names
            prob[sample[target]][name][sample[name]]+=1.0
        end
    end
    return prob
end

function classifier(data_lines,target,names,vals)
    prob=init(names,vals)
    nums=init(names,vals)
    nums=count(nums,data_lines,names,vals)
    p_n=Dict{Any,Any}(P=>0,N=>0)
    for sample in data_lines
        p_n[sample[target]]+=1
    end
        for t in [P,N]
          for name in names
             for v in vals[name]
                k=length(vals[name])
                m=k*0.1
                nc=nums[t][name][v]
                if nc>0
                   prob[t][name][v]=(nc+m/k)/(sum(values(nums[t][name]))+m)
                else
                   prob[t][name][v]=1.0/(length(vals[name]))
                end
             end
          end
        end
    prob[target]=Dict(P=>float(p_n[P])/(p_n[P]+p_n[N]),N=>float(p_n[N])/(p_n[P]+p_n[N]))

    return prob
end

function predict(prob,sample,names,target)
        r=Dict(P=>1.,N=>1.)
        for t in [P,N]
            r[t]*=prob[target][t]
            for name in names
                r[t]*=prob[t][name][sample[name]]
            end
        end
        return Dict(P=>r[P]/(r[P]+r[N]),N=>r[N]/(r[P]+r[N]))
end

p=init(names,vals)
nums=count(p,data_lines[6:9],names,vals)
prob=classifier(data_lines[6:9],target,names,vals)
for sample in data_lines[6:9]
  r=predict(prob,sample,names,target)
  println([r[sample[target]]])
end

# a simple demo to illustrate automatic differential process

import numpy as np
import sys

def setvalue(d,k,v):
    if k in d.keys():
        d[k]+=v
    else:
        d[k]=v

def variable(n):
    return [{"value": r ,"f":[],"df/dx":[],"var":[],"vargrad":[] ,"forth":{}} for r in np.random.random(n)]

def add(x,y):
    forth={}
    for k in x["forth"].keys():
        setvalue(forth,k,x["forth"][k])
    for k in y["forth"].keys():
        setvalue(forth,k,y["forth"][k])

    z={"value":x["value"]+y["value"],"f":[],"df/dx":[],"var":[x,y],"vargrad":[1,1],"forth":forth}
    return z

def minus(x,y):
    forth={}
    for k in x["forth"].keys():
        setvalue(forth,k,x["forth"][k])
    for k in y["forth"].keys():
        setvalue(forth,k,-y["forth"][k])
    z= {"value":x["value"]-y["value"],"f":[],"df/dx":[],"var":[x,y],"vargrad":[1,-1],"forth":forth}
    return z

def times(x,y):
    forth={}
    for k in x["forth"].keys():
        setvalue(forth,k,y["value"]*x["forth"][k])
    for k in y["forth"].keys():
        setvalue(forth,k,x["value"]*y["forth"][k])
    z= {"value":x["value"]*y["value"],"f":[],"df/dx":[],"var":[x,y],"vargrad":[y["value"],x["value"]],"forth":forth}
    return z

def square(x):
    forth={}
    for k in x["forth"].keys():
        setvalue(forth,k,2*x["value"]*x["forth"][k])
    z= {"value":x["value"]**2,"f":[],"df/dx":[],"var":[x],"vargrad":[2*x["value"]],"forth":forth}
    return z

def sigmoid(x):
    y=1.0/(1.0+np.exp(-x["value"]))
    forth={}
    for k in x["forth"].keys():
        setvalue(forth,k,y*(1-y)*x["forth"][k])
    z= {"value": y ,"f":[],"df/dx":[],"var":[x],"vargrad": [y*(1-y)],"forth":forth}
    return z

def packing(a):
    return [{"value": x ,"f":[],"df/dx":[],"var":[],"vargrad":[] ,"forth":{}} for x in a]



##########################  forard grad (recursive) ############################
def reset(node):
    for v in node["var"]:
        reset(node)
    for v in node["var"]:
        for k in v["forth"]:
            node["forth"][k]=0

def auto(n):
    data=[[-2,0],[-1,0],[0,0],[1,1],[2,1],[3,1]]
    
    pdata=[ packing(a) for a in data]
    
    k=variable(1)[0]
    k["forth"]={"k":1}
    b=variable(1)[0]
    b["forth"]={"b":1}
    
    delta=1


    for i in range(n):
        for j in range(len(pdata)):
                d=pdata[j]
                x=d[0]
                t=d[1]
    # forward
                p=times(k,x)
                s=add(p,b)
                y=sigmoid(s)
                m=minus(y,t)
                e=square(m)
                print("iteration:", i, "item", j, "  error:" , e["value"])
                #print("x:",x["value"],"  t:",t["value"] , "  k: ",k["value"],"  b: ",b["value"])
    
                d_k=e["forth"]["k"]
                d_b=e["forth"]["b"]
   # update
                k["value"]=k["value"]-delta*d_k
                b["value"]=b["value"]-delta*d_b
                #print("dk:" ,d_k,"db:",d_b)
    
    print(k["value"],b["value"],e["value"])
    print("predict:",1/(1+np.exp(-(k["value"]*np.array(data)[:,0]+b["value"]))))
    print("truth:",np.array(data)[:,1])

if len(sys.argv)==2:
   if sys.argv[1]=="auto":
        auto(10)
elif len(sys.argv)==3:
   if sys.argv[1]=="auto":
        auto(int(sys.argv[2]))
else:
    auto(10)

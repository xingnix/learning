# a simple demo to illustrate automatic differential process

import numpy as np
import sys

def variable(n):
    return [{"value": r ,"f":[],"df/dx":[],"var":[],"vargrad":[] ,"back":[]} for r in np.random.random(n)]

def add(x,y):
    z={"value":x["value"]+y["value"],"f":[],"df/dx":[],"var":[x,y],"vargrad":[1,1],"back":[]}
    x["f"]+=[z]
    x["df/dx"]+=[1]
    y["f"]+=[z]
    y["df/dx"]+=[1]
    return z

def minus(x,y):
    z= {"value":x["value"]-y["value"],"f":[],"df/dx":[],"var":[x,y],"vargrad":[1,-1],"back":[]}
    x["f"]+=[z]
    x["df/dx"]+=[1]
    y["f"]+=[z]
    y["df/dx"]+=[-1]
    return z

def times(x,y):
    z= {"value":x["value"]*y["value"],"f":[],"df/dx":[],"var":[x,y],"vargrad":[y["value"],x["value"]],"back":[]}
    x["f"]+=[z]
    x["df/dx"]+=[y["value"]]
    y["f"]+=[z]
    y["df/dx"]+=[x["value"]]
    return z

def square(x):
    z= {"value":x["value"]**2,"f":[],"df/dx":[],"var":[x],"vargrad":[2*x["value"]],"back":[]}
    x["f"]+=[z]
    x["df/dx"]+=[2*x["value"]]
    return z

def sigmoid(x):
    y=1.0/(1.0+np.exp(-x["value"]))
    z= {"value": y ,"f":[],"df/dx":[],"var":[x],"vargrad": [y*(1-y)],"back":[]}
    x["f"]+=[z]
    x["df/dx"]+=[y*(1-y)]
    return z

def packing(a):
    return [{"value": x ,"f":[],"df/dx":[],"var":[],"vargrad":[] } for x in a]




#####################  back propogation (step by step)  ########################

def handcraft(n):
    data=[[-2,0],[-1,0],[0,0],[1,1],[2,1],[3,1]]
    
    pdata=[ packing(a) for a in data]
    
    k=variable(1)[0]
    b=variable(1)[0]
    
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
                print("iteration:", i,"item", j, "  error:" , e["value"])
                #print("x:",x["value"],"  t:",t["value"] , "  k: ",k["value"],"  b: ",b["value"])
    
    # backward
                e["back"]=e["vargrad"]
                m["back"]=[e["back"][0]*m["vargrad"][0],e["back"][0]*m["vargrad"][1]]
                y["back"]=[m["back"][0]*y["vargrad"][0]]
                s["back"]=[y["back"][0]*s["vargrad"][0],y["back"][0]*s["vargrad"][1]]
                d_b=s["back"][1]
                p["back"]=[s["back"][0]*p["vargrad"][0],s["back"][0]*p["vargrad"][1]]
                d_k=p["back"][0]
    # update
                k["value"]=k["value"]-delta*d_k
                b["value"]=b["value"]-delta*d_b
                #print("dk:" ,d_k,"db:",d_b)
    
    print(k["value"],b["value"],e["value"])
    print("predict:",1/(1+np.exp(-(k["value"]*np.array(data)[:,0]+b["value"]))))
    print("truth:",np.array(data)[:,1])

##########################  back propogation (recursive) ############################
def reset(node):
    node["df/dx"]=[]
    node["f"]=[]
    node["back"]=[]
    if node["var"]!=[] :
        for v in node["var"]:
            reset(v)

def back(node,e):
    if node==e:
        return 1
    if node["back"]==[]:
        b=0
        for i,f in enumerate(node["f"]):
            b+=back(f,e)*node["df/dx"][i]
        node["back"]=[b]
        return b
    else:
        return node["back"][0]

def auto(n):
    data=[[-2,0],[-1,0],[0,0],[1,1],[2,1],[3,1]]
    
    pdata=[ packing(a) for a in data]
    
    k=variable(1)[0]
    b=variable(1)[0]
    
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
    
    # backward
                d_k=back(k,e)
                d_b=back(b,e)
                reset(e)
   # update
                k["value"]=k["value"]-delta*d_k
                b["value"]=b["value"]-delta*d_b
                #print("dk:" ,d_k,"db:",d_b)
    
    print(k["value"],b["value"],e["value"])
    print("predict:",1/(1+np.exp(-(k["value"]*np.array(data)[:,0]+b["value"]))))
    print("truth:",np.array(data)[:,1])

if len(sys.argv)==2:
    if sys.argv[1]=="handcraft":
        handcraft(10)
    elif sys.argv[1]=="auto":
        auto(10)
elif len(sys.argv)==3:
    if sys.argv[1]=="handcraft":
        handcraft(int(sys.argv[2]))
    elif sys.argv[1]=="auto":
        auto(int(sys.argv[2]))
else:
    auto(10)

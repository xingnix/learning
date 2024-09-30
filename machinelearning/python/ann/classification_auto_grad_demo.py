# a simple demo to illustrate automatic differential process

import numpy as np

def variable(n):
        return [{"value": r ,"var":[],"grad":[] ,"back":[]} for r in np.random.random(n)]

def add(x,y):
        return {"value":x["value"]+y["value"],"var":[x,y],"grad":[1,1],"back":[]}

def minus(x,y):
        return {"value":x["value"]-y["value"],"var":[x,y],"grad":[1,-1],"back":[]}

def times(x,y):
        return {"value":x["value"]*y["value"],"var":[x,y],"grad":[y["value"],x["value"]],"back":[]}

def square(x):
        return  {"value":x["value"]**2,"var":[x],"grad":[2*x["value"]],"back":[]}

def sigmoid(x):
        y=1.0/(1.0+np.exp(-x["value"]))
        return  {"value": y ,"var":[x],"grad": [y*(1-y)],"back":[]}

def packing(a):
        return [{"value": x ,"var":[],"grad":0 } for x in a]

data=[[-2,0],[-1,0],[0,0],[1,1],[2,1],[3,1]]

pdata=[ packing(a) for a in data]

k=variable(1)[0]
b=variable(1)[0]

delta=1
for i in range(10):
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
            print("iteration:", i, "  error:" , e["value"])
            #print("x:",x["value"],"  t:",t["value"] , "  k: ",k["value"],"  b: ",b["value"])

# backward
            e["back"]=e["grad"]
            m["back"]=[e["back"][0]*m["grad"][0],e["back"][0]*m["grad"][1]]
            y["back"]=[m["back"][0]*y["grad"][0]]
            s["back"]=[y["back"][0]*s["grad"][0],y["back"][0]*s["grad"][1]]
            d_b=s["back"][1]
            p["back"]=[s["back"][0]*p["grad"][0],s["back"][0]*p["grad"][1]]
            d_k=p["back"][0]
# update
            k["value"]=k["value"]-delta*d_k
            b["value"]=b["value"]-delta*d_b
            #print("dk:" ,d_k,"db:",d_b)


print(k,b)

using ForwardDiff
∇=ForwardDiff.jacobian;
j=∇(y-> ∇(x->x'*x,y),[2. 5]');
print(j)

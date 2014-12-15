s=%s;
g=1/(s+1);
phi_e=1/(1+g);
r=1/s;
ess1=horner(s*phi_e*r,0); // steady state error for step input

s1=1/s;
phi_e1=horner(phi_e,s1);// substitute s with 1/s

ess2=poly(ldiv(numer(phi_e1),denom(phi_e1),5),'s','c'); // taylor expansion near s=0
coeff(ess2) // dynamic error coefficients 

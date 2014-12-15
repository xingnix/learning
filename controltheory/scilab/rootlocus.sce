//180 degree & 0 degree root locus of 1/(s^2+2as+1)
s=%s;
g180=2*s/(s^2+1);
g0=2*s/(s^2+1-2*s);
evans(g180,2);
evans(g0,2);


//180 degree & 0 degree root locus of (s^2+6*s+25)/(s*(s^2+8*s+25));
s=%s;
g0=(s^2+6*s+25)/(-10*(s^2+6*s+25)+(s*(s^2+8*s+25))); // transform for 0 degree root locus
g180=(s^2+6*s+25)/(0*(s^2+6*s+25)+(s*(s^2+8*s+25))); // transfer function
evans(g0,20)
evans(g180,20)
//sgrid;


// zero pole compensation for robust design
s=%s;
g=1/(s*(s^2+s+1));
gc=(s^2+s+0.9);
evans(g);
evans(g*gc);

phi=10*g*gc/(1+10*g*gc);
roots(numer(phi))
roots(denom(phi)) 

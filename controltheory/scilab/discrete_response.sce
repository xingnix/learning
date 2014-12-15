function response(rho,theta)
  scf;
  N=50;
  plot2d3(real((rho*exp(theta*%pi*%i)).^(0:N)))
  plot(real((rho*exp(theta*%pi*%i)).^(0:N)),'.')
endfunction

r=0.95;
response(r,0);
response(r,1);
response(r,0.5);
response(r,0.2);
response(r,0.1);

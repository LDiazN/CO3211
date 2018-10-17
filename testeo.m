%test.m
x = ones(20,1);
for z = 2:1:20
  x(z-1) = condi(z)
endfor

dominio =1:1:20
plot1 = plot(dominio,x,"r")
legend("condicion vs n")
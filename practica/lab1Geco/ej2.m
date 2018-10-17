%ej2.m
x = randi(9*10^5,1000,(10^5));
a = 10^12
b = 0
for i = 1:1:1000
  x(i) = 1/x(i);
  a = a + x(i);
  b = b + x(i);
endfor

b = b + 10^12
a
error = a - b
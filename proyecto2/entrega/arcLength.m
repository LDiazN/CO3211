%una función de prueba
function L = arcLength(P,a,b)
  x = a:0.1:b;
  y = Horner(P,x);
  n = length(x);
  L = 0;
  for i = 1:1:n-1
    L = L + sqrt((x(i+1)-x(i))^2 + (y(i+1)-y(i))^2 );
  endfor
endfunction

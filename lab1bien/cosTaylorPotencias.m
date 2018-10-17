%Coseno de taylos en potencias:
function y = cosTaylorPotencias(x1,n)
  %x es el valor del coseno que queremos aproximar, n es el número de iteraciones.
  y = 1;
  x = x1 - floor((x1/(2*pi))*2*pi);
  for i = 1:1:n
    y = y + (-1).^(i)*(((x).^(2*i))/factorial(2*i));
  endfor
  
endfunction

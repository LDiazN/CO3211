%inversa de e
function ei = inverseEuler(x)
  %calculamos primero e**x
  ei = 1;
  for i = 1:1:25
    ei = ei + (x.^(i))/factorial(i);
  endfor
  ei = 1/ei;
  
endfunction

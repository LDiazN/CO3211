%Calcula algo parecido a Newton, utiliza las primeras derivadas además de la 
%Evaluación en puntos específicos.

function [coef] = Hermit (x,f,derivadas)
  n = length(x);
  for i = 1:1:n
    z(2*i-1) = x(i);
    z(2*i) = x(i);
    Q(2*i - 1,1) = f(i);
    Q(2*i,1) = f(i);
    Q(2*i,2) = f(i);
    
    if i != 1
      Q(i,j) = (Q(2*i - 1,1) - Q(2*i - 2,1))/(z(2*i - 1) - z(2*i - 2));
    endif
  endfor
  
  for i = 3: 2*n
    for j = 3:i
      Q(i,j) = (Q(i,j-1) - Q(i-1,j-1))/z(i) - z(i-j+1);
    endfor
  endfor
  for i = 1:2*n
    coef(i) = Q(i,i);
  endfor
endfunction

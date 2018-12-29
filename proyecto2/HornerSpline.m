%HornerSpline.m: Dado un spline S, un número x, evalua x en el spline S.
%Es necesario pasar el vector de x para encontrar el intervalo en que debes 
%evaluar el polinomio

function y = HornerSpline(S,x,Xprev)
  %Primero buscamos el intervalo al que x pertenece.
  j = 0;
  for i = 1:1:length(Xprev)
    if (x <= Xprev(i))
      j = i;
      break
    endif
  endfor
  %Ahora evaluamos con el polinomio correspondiente:
  y = Horner(flip(S(j,:)),x-Xprev(j));
  
endfunction


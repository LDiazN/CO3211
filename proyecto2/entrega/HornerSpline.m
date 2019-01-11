%HornerSpline.m: Dado un spline S, un vector x, evalua los valores de x en el 
%spline S. Es necesario pasar el vector de x previos para encontrar el intervalo 
% en que debes evaluar el polinomio

function y = HornerSpline(S,x,Xprev)
  for k = 1:1:length(x)  
    %Primero buscamos el intervalo al que x pertenece.
    j = 0;
    for i = 1:1:length(Xprev)-1
      
      if (Xprev(i+1)>= x(k) && x(k) >= Xprev(i))
        j = i;
        break
      endif
    endfor
    
    %Ahora evaluamos con el polinomio correspondiente:
    y(k) = Horner(flip(S(j,:)),x(k)-Xprev(j));
  endfor
endfunction


%{
splineLength.m: dado un spline S, el conjunto de preimágenes Xprev,
calcula la longitud total de curva del spline S en su intervalo de convergencia.
%}

function l = splineLength (S, xPrev)
  l = 0;
  n = length(S(:,1))-1;
  for i = 1:1:n
    l = l + LongitudArco(S(i,:),xPrev(i),xPrev(i+1));
  endfor
endfunction

%plotHelper.m

function [x,y] = plotHelper(S,Xprev)
  %{
  Esta función recibe un spline S, y el conjunto de preimágenes Xprev 
  usados para crear S y devuelve un vector x con un dominio [Xprev(1),Xprev(n)] 
  con salto discreto 0.1 (n es la longitud de Xprev), y un vector "y" de imágenes
  de x
  %}
  x = Xprev(1):0.5:Xprev(length(Xprev));
  y = HornerSpline(S,x,Xprev);
endfunction

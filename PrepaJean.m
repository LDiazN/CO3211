%{
Los métodos iterativos se basan en conseguir una solución a un sistema de 
ecuaciones expresando la solución como x^(i+1):= Hx^(i) + c.

Para ello se necesita que sean convergentes y consistentes. La consistencia la 
obtienes con el cumplimiento de la siguiente igualdad: x =  Hx+ c. Si lo logras,
el sistema es consistente.

para que sea convergente se tiene que cumplir lim(x->inf)x^(i)=x

El método de jacobi funciona resolviendo:
A = D -E -F
donde: 
D: es la diagonal principal
E: es la triangular inferior sin diagonal
F: es triangular duperior sin diagonal.

x^(i+1) = D^-1(E+F)x^(i) + D^-1b
%}
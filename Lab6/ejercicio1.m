%Ejercicio1:
%Luis Diaz: 15-10420;

%{
a)
Cuando calculamos analíticamente det(A-cI) = 0, obtenemos el siguiente polinomio:
det(A-cI) = (1-c)((1-c) + epsilon)((1-c) - epsilon) = 0, de donde sacamos que 
los autovalores son:
c1 = 1
c2 = epsilon+1
c3 = -epsilon+1

Y observamos que claramente el mayor sería c2, mientras que el menor sería c3.
%}

% b): La función está en el archivo "ejercicio_1b.m"
disp("La primera fila es el autovalor obtenido, la segunda es la cantidad de ")
disp("iteraciones, la tercera es el error obtenido")
disp("    e = 1   |   e = 10^-2   | e = 10^-4 |   e = 10^-8   |")
x = ejercicio_1b()

%{
Como vemos, los resultados obtenidos para el mayor autovalor se corresponden
con los esperados analíticamente, salvo un cierto error.
%}

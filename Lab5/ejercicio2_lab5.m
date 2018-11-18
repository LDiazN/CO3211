%Ejercicio2, lab5
%Luis Diaz: 15-10420
%Inicializamos nuestros datos:
A1 = [7 3 -1 2; 3 8 1 -4; -1 1 4 -1; 2 -4 -1 6]
b1 = [-1; 0; -3; 1]
x1 = A1\b1

disp("")
A2 = [4 3 0; 2 3 -1; 0 -1 4]
b2 = [1;1;1]
x2 = A2\b2
disp("")

%El dominio:
x = 0.01:0.0001:1.99;
n = length(x);
y1 = 1:1:n; 
y2 = 1:1:n;

%Parámetros del SOR:
tolerancia = 10^-12
xo1 = 0*ones(4,1);
xo2 = 0*ones(3,1);
maxIt = 1000;

disp("Vamos a resolver los sistemas usando SOR con diversos valores para w:")
disp("n:"),n
for i = 1:1:n
  %Se imprime el i de cada iteración para ver el progreso del proceso:
  i
  [xTemp,kTemp] = SOR(A1,b1,xo1,x(i),maxIt,tolerancia);
  y1(i) = kTemp;
  [xTemp,kTemp] = SOR(A2,b2,xo2,x(i),maxIt,tolerancia);
  y2(i) = kTemp;
endfor
hold on
plot(x,y1)
plot(x,y2)
legend("A1","A2")
%{
Las gráficas obtenidas están en la carpeta del laboratorio. Como pudimos 
apreciar, los resultados que se obtuvieron con menos iteraciones fueron aquellos
con un w acotado en (1,1.5). A partir de cierto valor en este intervalo, se 
observó que ambas matrices tuvieron soluciones más o menos iguales.
Además, estos resultados se corresponden con el w óptimo teóricamente esperado,
que es el w = 1.5. Como vimos, los resultados son mejores mientras más se acercan
a ese valor
%}

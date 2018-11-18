%Ejercicio1:
%Luis Diaz: 15-10420
%1.b) Primero vamos a construir los datos proporcionados:
disp("Primero creamos las matrices:")
disp("A1:")
disp("")

n = 10;
X = -1 + 2*rand(n)
A1 = X + n*eye(n)
e = ones(n,1);
b1 = A1*e;

disp("")

disp("A2:")
disp("")

Y = -1 + 2*rand(n)
A2 = Y.'*Y + (10^-3)*eye(n)
b2 = A2*e;

disp("Vamos a resoolver los sistemas")
disp("Por gauss-Seidel:")
tolerancia = 10^-12;
maxIteraciones = 1000;
xv = 0*ones(n,1);

[x1_GS,k1_gs] = gauss_Seidel(A1,b1,xv,maxit,tolerancia)
[x2_GS,k2_gs] = gauss_Seidel(A2,b2,xv,maxit,tolerancia)
disp("Por Jacobi:")
[x1_J,k1_j] = jacobi(A1,b1,xv,maxit,tolerancia)
[x2_J,k2_j] = jacobi(A2,b2,xv,maxit,tolerancia)
%Como podemos ver, los resultados son coherentes.
%Ahora calcularemos los radios espectrales de cada matriz:
R1_j = abs(max(eig(iterMatrix(A1,"j"))))
R1_gs = abs(max(eig(iterMatrix(A1,"gs"))))

R2_j = abs(max(eig(iterMatrix(A2,"j"))))
R2_gs = abs(max(eig(iterMatrix(A2,"gs"))))

%{
Como vemos, se tienen resultados satisfactorios para el jacobi de A1, el GS de 
A1, y en GS de A2, pero en Jacobi de A2 los resultados son pésimos. Esto se 
corresponde con el radio espectral de la matriz iteración; en  Jacobi
para A1, GS para A1, y GS para A2, los radios espectrales de las matrices 
transformación son menores que 1, así que los métodos convergen, pero en el 
Jacobi de A2, el radio de la matriz transformación es mayor que 1, así que el 
método no converge y esto explica los malos resultados. Además, también se 
observó que, en general, GS es bastante más rápido.
%}
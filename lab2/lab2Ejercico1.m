%{ 
Laboratorio 2, Ejercicio1;
Luis Diaz: 15-10420; 
%}


%Ejercicio1: La función correspondiente está en gaussPiv.m

disp("Ejercicio1.a)")

A1 = [10^-8 -1 10^10; 10 (10^-8)-10^7 1;1 -1 1]
x1 = [1;-1;1];
b1 = A1*x1

A2 = [4 -1 1;10^-9 (10^-6)-10^7  10^-9; 10^-16 -10^-16 1]
x2 = x1;
b2 = A2*x2
%Ejercicio1.b)
disp("Veremos el determinante de ambas matrices:")
disp("")
det1 = det(A1)
det2 = det(A2)

disp("Ambos son diferentes de 0, así que el sistemas tienen solución única, la solución es:")
sol1 = A1\b1
sol2 = A2\b2

%Usamos la función de sustat.m que hace la sustitución hacia atrás para calcular el vector solución 
%Ejercicio1.c)
disp("La solución con métodos aproximados es: ")

[A1Piv,b1Piv] = gaussPiv(A1,b1,1);
[A1NoPiv,b1NoPiv] = gaussPiv(A1,b1,0);
x1Piv = sustat(A1Piv,b1Piv)
x1NoPiv = sustat(A1NoPiv,b1NoPiv)


[A2Piv,b2Piv] = gaussPiv(A2,b2,1);
[A2NoPiv,b2NoPiv] = gaussPiv(A2,b2,0);
x2Piv = sustat(A2Piv,b2Piv)
x2NoPiv = sustat(A2NoPiv,b2NoPiv)

disp("Calculamos los errores relativos usando norma1:")
disp("Para x1: ")
error1Piv = norm(x1Piv - x1,1)/norm(x1)
error1NoPiv = norm(x1NoPiv - x1,1)/norm(x1)

disp("Para x2: ")
error2Piv = norm(x2 - x2Piv,1)/norm(x2)
error2NoPiv = norm(x2 - x2NoPiv,1)/norm(x2)
%{
Vemos que el pivoteo funciona mejor para A1 que para A2, donde no tiene efecto.
Esto ocurre porque A2 ya está correctamente ordenada y no necesita que se le 
haga ningún pivoteo. Además, los números más grandes de cada fila ya están en la 
diagonal, no es necesario reubicarlos. En A1, el pivoteo reubica los números
grandes como pivotes, esto ayuda a mejorar el resultado porque se divide entre
un número grande en lugar de un número más pequeño. En conclusión, se logran mejores
resultados cuando en el pivoteo se escogen los mayores valores posibles para el pivote.
Además, lo errores que se generen se van a arrastrar a lo largo de todo el proceso
de eliminación.
%}

%Ejercicio1.d)
disp("Parámetros de A1")
det1 = det(A1)
codicion1 = cond(A1,1)
maxiAutovalor1 = abs(max(eig(A1)))
miniAutovalor1 = abs(min(eig(A1)))
disp("")
disp("Parámetros de A2: ")
det2 = det(A2)
codicion2 = cond(A2,2)
maxiAutovalor2 = abs(max(eig(A2)))
miniAutovalor2 = abs(min(eig(A2)))
%{
El determinante de la matriz nos advierte si tiene sentido resolver el sistema 
buscando una solución única, y el condicionamiento nos indica cuanto error podemos 
llegar a conseguir en caso de alterar ligeramente los datos del problema.
%}

%Ejercicio1.e):
disp("Conseguiremos los errores relativos: ")
disp("")
disp("Para A1: ")
disp("")
error_rel1Piv = norm(sol1 - x1Piv,1)/norm(sol1,1)
error_rel1NoPiv = norm(sol1 - x1NoPiv,1)/norm(sol1,1)

disp("")
disp("Para A2: ")
disp("")
error_rel2Piv = norm(sol2 - x2Piv,1)/norm(sol2,1)
error_rel2NoPiv = norm(sol2 - x2NoPiv,1)/norm(sol2,1)
disp("")

disp("Veremos si cumplen la relación dada: ")
relacion1Piv = error_rel1Piv <= cond(A1)*((norm(b1 - A1*x1Piv,1)/norm(b1,1)))
relacion1NoPiv = error_rel1NoPiv <= cond(A1)*((norm(b1 - A1*x1NoPiv,1)/norm(b1,1)))

relacion2Piv = error_rel2Piv <= cond(A2)*((norm(b2 - A2*x2Piv,1)/norm(b2,1)))
relacion2NoPiv = error_rel2NoPiv <= cond(A2)*((norm(b2 - A2*x2NoPiv,1)/norm(b2,1)))

%En todos los casos se cumple la relación dada.


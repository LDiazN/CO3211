%prueba.m
%Método con n
Matriz_Prueba = hillbert(11) + 1.025*eye(11);
x = ones(11,1)
b = Matriz_Prueba*x
t = cputime;
[x,k] = gauss_Seidel(Matriz_Prueba,b,0*ones(11,1),1500,10^-7)
disp(cputime - t)
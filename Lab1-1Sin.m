%{
    Luis Diaz; 15-10420
    Laboratorio 1, ejercicio 1, Gráfica del coseno.
%}

%Gráfica de la función:
x = -3:0.001:3;
y = (1-cos(x))./(x.^2);

figure;plot(x,y);

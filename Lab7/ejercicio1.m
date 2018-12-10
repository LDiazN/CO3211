%{
Ejercicio1, Lab7
Luis Diaz; 15-10420.
%}

%Cargamos los archivos:
load data
%1.a)
%Calculamos los coeficientes de cada sistema.
P1 = fliplr(lilSquares(xd,yd,5).')
P2 = fliplr(lilSquares(xd,yd,15).')
P3 = fliplr(lilSquares(xd,yd,4).')
x_func = 1:0.1:8;
%Ahora el error cuadrático medio para cada sistema:
%Primero valuamos nuestros sistemas con los valores de x ofrecidos:
Y1 = polyval(P1,x_func);
Y2 = polyval(P2,x_func);
Y3 = polyval(P3,x_func);

%Ahora calculamos los errores cuadráticos medios.
ECM1 = sum((yd - Y1).^2)/length(yd)
ECM2 = sum((yd - Y2).^2)/length(yd)
ECM3 = sum((yd - Y3).^2)/length(yd)

%1.b) Ahora las gráficas:
figure
plot(xd,yd,"*")

hold on
plot(x_func,Y1)

hold on
plot(x_func,Y2)

hold on
plot(x_func,Y3)
legend("datos","Grado 5","Grado15","Grado 20")
legend("Location",'southeast')
title("temperatura vs tiempo")
format long
%1.c) Tanto en las gráficas como en los ECM notamos que el mejor modelo es con 
%     el polinomio de grado 5. Lo usamos para predecir las temperaturas pedidas.

tempe_4 = polyval(P1,4.5)
temp_5 = polyval(P1,5.5)

%1.d) Ahora buscamos el tiempo para el cual la temperatura es 36.612. Notamos
% que esto se puede hacer fácilmente restando 36.612 al término independiente
% del polinomio P1 y tomando una raíz del polinomio resultante que sea coherente.
disp("Estas son las raíces que resuelven el sistema P1 igualado a 36.612")
P1_Aux = P1;
P1_Aux(6) = P1_Aux(6) - 36.612;
roots(P1_Aux)

disp("Como el tiempo es un número real, entonces el único resultado que nos")
disp("sirve es el que no tiene parte imaginaria, el tercer resultado")

%{
   6.898296185531109e+00 + 1.202665884188357e+00i
   6.898296185531109e+00 - 1.202665884188357e+00i
   4.111339614732349e+00 + 0.000000000000000e+00i
   5.119147515562081e-02 + 8.188522999225527e-01i
   5.119147515562081e-02 - 8.188522999225527e-01i

   Estos fueron los resultados obtenidos, notamos que el que estamos buscando es
el tercer resultado,  4.111339614732349. Ahora comprobaremos si efectivamente
es el número que estamos buscando, evaluando el polinomio P1 con este tiempo
a ver si da la temperatura dada.
%}

disp("Ahora comprobamos:")
tiempo =  4.111339614732349
resultado = polyval(P1,tiempo)

% Así, comprobamos que la temperatura 36.612 se alcanza en el tiempo:
% 4.111339614732349


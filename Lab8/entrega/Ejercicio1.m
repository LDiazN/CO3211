%{
Ejercicio1.
Luis Diaz; 15-10420.
%}

%Primero, vamos a declarar la función dada.
F = @(x) x*sin(x)/(x^2+1);

%Ahora vamos a declarar los intervalos que vamos a considerar:
x10 = linspace(-4*pi,4*pi,10);
x30 = linspace(-4*pi,4*pi,30);
x50 = linspace(-4*pi,4*pi,50);

y10 = linspace(-4*pi,4*pi,10);
y30 = linspace(-4*pi,4*pi,30);
y50 = linspace(-4*pi,4*pi,50);

%Llenamos los intervalos de imágenes:
for i = 1:1:length(y10)
  y10(i) = F(x10(i));
endfor


for i = 1:1:length(y30)
  y30(i) = F(x30(i));
endfor


for i = 1:1:length(y50)
  y50(i) = Fx(x50(i));
endfor


%Ejercicio1.a)

%   Ahora calculamos los distintos polinomios interpolantes de distintos grados:

%   Para grado 9:
vanPoli_g9 = (vander(x10)^-1)*y10.';

%   Para grado 29:
vanPoli_g29 = (vander(x30)^-1)*y30.';

%   Para grado 49:
vanPoli_g49 = (vander(x50)^-1)*y50.';

%Ejercicio1.b)
%Ahora vamos a conseguir los polinomios de Newton por diferencia dividida:

%   Grado 3:
newtPoli_g3x10 = poliNewtonDiv(x10(1:3:10),y10(1:3:10));
newtPoli_g3x30 = poliNewtonDiv(x30(1:8:30),y30(1:8:30));
newtPoli_g3x50 = poliNewtonDiv(x50(1:13:50),y50(1:13:50));

%   Grado 7:
newtPoli_g7x10 = poliNewtonDiv(x10(2:9),y10(2:9));
newtPoli_g7x30 = poliNewtonDiv(x30(1:4:30),y30(1:4:30));
newtPoli_g7x50 = poliNewtonDiv(x50(1:7:50),y50(1:7:50));

%   Grado 13:
newtPoli_g13x30 = poliNewtonDiv(x30(1:3.6:30),y30(1:3.6:30));
newtPoli_g13x50 = poliNewtonDiv(x50(1:3.6:50),y50(1:3.6:50));


%Ejercicio1.c)
% Ahora vamos a volver a crear el polinomio de Newton, pero en lugar de usar los 
% 10, 30, 50 puntos igualmente espaciados, vamos a usar los 10, 30, 50 puntos 
% de chebyshev.

%Preimágenes:
xCheby10 = chebyNodes(-4*pi,4*pi,10);
xCheby30 = chebyNodes(-4*pi,4*pi,30);
xCheby50 = chebyNodes(-4*pi,4*pi,50);

%Imágenes:
yCheby10 = chebyNodes(-4*pi,4*pi,10);
yCheby30 = chebyNodes(-4*pi,4*pi,30);
yCheby50 = chebyNodes(-4*pi,4*pi,50);

%Llenamos correctamente los vectores de imágenes:
for i = 1:1:length(yCheby10)
  yCheby10(i) = F(xCheby10(i));
endfor

for i = 1:1:length(yCheby30)
  yCheby30(i) = F(xCheby30(i));
endfor

for i = 1:1:length(yCheby50)
  yCheby50(i) = F(xCheby50(i));
endfor

% Ahora vamos a crear los polinomios de Newton pero con los puntos de cheby. en 
% lugar de los puntos igualmente espaciados. 

%   Grado 3:
newtPoli_g3xCheby10 = poliNewtonDiv(xCheby10(1:3:10),yCheby10(1:3:10));
newtPoli_g3xCheby30 = poliNewtonDiv(xCheby30(1:8:30),yCheby30(1:8:30));
newtPoli_g3xCheby50 = poliNewtonDiv(xCheby50(1:13:50),yCheby50(1:13:50));

%   Grado 7:
newtPoli_g7xCheby10 = poliNewtonDiv(xCheby10(2:9),yCheby10(2:9));
newtPoli_g7xCheby30 = poliNewtonDiv(xCheby30(1:4:30),yCheby30(1:4:30));
newtPoli_g7xCheby50 = poliNewtonDiv(xCheby50(1:7:50),yCheby50(1:7:50));

%   Grado 13:
newtPoli_g13xCheby30 = poliNewtonDiv(xCheby30(1:3.6:30),yCheby30(1:3.6:30));
newtPoli_g13xCheby50 = poliNewtonDiv(xCheby50(1:3.6:50),yCheby50(1:3.6:50));


% Ejercicio1.d)
%   Ahora vamos a graficar cada tipo de polinomio, vamos a usar un salto de 0.1
%   Vamos a separar cada gráfica por conjunto de puntos. Primero vamos a crear
%   el intervalo y las imágenes correctas:

x = -4*pi:0.1:4*pi;
y = ones(length(x),1);
%   Llenamos correctamente el conjunto de imágenes:
for i = 1:1:length(x)
  y(i) = F(x(i));
endfor

%   Para el conjunto x10 (10 puntos):
figure
subplot(3,2,[1,2])
plot(x,y,"+")
hold on
title("Conjunto de 10 puntos")
plot(x,polyval(vanPoli_g9,x))
plot(x,polyval(newtPoli_g3x10,x))
plot(x,polyval(newtPoli_g3xCheby10,x))
legend("f(x)","Vander grado 9","Newton Lins grado 3","Newton Cheby grado 3")
legend("Location",'southwest')

subplot(3,2,[3,4])
plot(x,y,"+")
hold on
plot(x,polyval(vanPoli_g29,x))
plot(x,polyval(newtPoli_g7x10,x))
plot(x,polyval(newtPoli_g7xCheby10,x))
legend("f(x)","Vander grado 29","Newton Lins grado 7","Newton Cheby grado 7")
legend("Location",'southwest')

subplot(3,2,[5,6])
plot(x,y,"+")
hold on
plot(x,polyval(vanPoli_g49,x))
legend("f(x)","Vander grado 49")
legend("Location",'north')

%   Para el conjunto x30 (30 puntos):
figure
subplot(3,2,[1,2])
plot(x,y,"+")
hold on
title("Conjunto de 30 puntos")
plot(x,polyval(vanPoli_g9,x))
plot(x,polyval(newtPoli_g3x30,x))
plot(x,polyval(newtPoli_g3xCheby30,x))
legend("f(x)","Vander grado 9","Newton Lins grado 3","Newton Cheby grado 3")
legend("Location",'south')

subplot(3,2,[3,4])
plot(x,y,"+")
hold on
plot(x,polyval(vanPoli_g29,x))
plot(x,polyval(newtPoli_g7x30,x))
plot(x,polyval(newtPoli_g7xCheby30,x))
legend("f(x)","Vander grado 29","Newton Lins grado 7","Newton Cheby grado 7")
legend("Location",'north')

subplot(3,2,[5,6])
plot(x,y,"+")
hold on
plot(x,polyval(vanPoli_g49,x))
plot(x,polyval(newtPoli_g13x30,x))
plot(x,polyval(newtPoli_g13xCheby30,x))
legend("f(x)","Vander grado 49","Newton lins grado 13", "Newton Cheby grado 13")
legend("Location",'north')

%   Para el conjunto x50 (50 puntos):
figure
subplot(3,2,[1,2])
plot(x,y,"+")
hold on
title("Conjunto de 50 puntos")
plot(x,polyval(vanPoli_g49,x))
plot(x,polyval(newtPoli_g3x50,x))
plot(x,polyval(newtPoli_g3xCheby50,x))
legend("f(x)","Vander grado 9","Newton Lins grado 3","Newton Cheby grado 3")
legend("Location",'north')

subplot(3,2,[3,4])
plot(x,y,"+")
hold on
plot(x,polyval(vanPoli_g49,x))
plot(x,polyval(newtPoli_g7x50,x))
plot(x,polyval(newtPoli_g7xCheby50,x))
legend("f(x)","Vander grado 29","Newton Lins grado 7","Newton Cheby grado 7")
legend("Location",'north')

subplot(3,2,[5,6])
plot(x,y,"+")
hold on
plot(x,polyval(vanPoli_g49,x))
plot(x,polyval(newtPoli_g13x50,x))
plot(x,polyval(newtPoli_g13xCheby50,x))
legend("f(x)","Vander grado 49","Newton lins grado 13", "Newton Cheby grado 13")
legend("Location",'north')


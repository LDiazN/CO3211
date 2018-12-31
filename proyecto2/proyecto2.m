%{
proyecto2.m: archivo principal del proyecto.
Luis Diaz: 15-10420;
Proyecto 2, CO3211.

Los archivos adicionales son los siguientes:
  
  -HornerSpline.m
  -LongitudArco.m
  -splineCubico.m
  -Horner.m
  -plotHelper.m
  -splineLength.m
  
  -paraguana_origin.bmp
  -paraguanai.bmp (con 1 <= i <= 14)
  -data.mat
  
Los primeros 6 son las funciones auxiliares del programa, los siguientes dos 
son las imágenes bmp que se usaron para escoger los puntos region por region,
y el último archivo son lo puntos almacenados correspondientes a las imágenes
bmp. Se prefirió almacenarlos en un .mat dado el tiempo de corrida que amerita
leer los puntos de todas las imágenes. En el archivo test.m adjunto 
adicionalmente se encuentra el código utilizado para leer los puntos de las 
imágenes.
%}

%A continuación, procedemos a crear los spline que usaremos para aproximar la 
%línea de costa. Necesitaremos 14 splines:
load data.mat
%(Para no buscar la derivada en los puntos inicial y final, usaremos un spline 
%libre)

S1 = splineCubico(paraguana_1x,paraguana_1y);
S2 = splineCubico(paraguana_2x,paraguana_2y);
S3 = splineCubico(paraguana_3x,paraguana_3y);
S4 = splineCubico(paraguana_4x,paraguana_4y);
S5 = splineCubico(paraguana_5x,paraguana_5y);
S6 = splineCubico(paraguana_6x,paraguana_6y);
S7 = splineCubico(paraguana_7x,paraguana_7y);
S8 = splineCubico(paraguana_8x,paraguana_8y);
S9 = splineCubico(paraguana_9x,paraguana_9y);
S10 = splineCubico(paraguana_10x,paraguana_10y);
S11 = splineCubico(paraguana_11x,paraguana_11y);
S12 = splineCubico(paraguana_12x,paraguana_12y);
S13 = splineCubico(paraguana_13x,paraguana_13y);
S14 = splineCubico(paraguana_14x,paraguana_14y);

%Ahora vamos a crear las imágenes y preimagenes de cada spline para luego 
%graficarlos. Para ello usaremos la función auxiliar "plotHelper", que nos
%va a devolver un vector x con el rango apropiado para graficar, y un vector y
%con las imágenes de este intervalo mediante el spline correcto:

[x1,y1] = plotHelper(S1,paraguana_1x);
plot(x1,y1)
hold on
plot(paraguana_1x,paraguana_1y,"o")

[x2,y2] = plotHelper(S2,paraguana_2x);
plot(x2,y2)
hold on
plot(paraguana_2x,paraguana_2y,"o")

[x3,y3] = plotHelper(S3,paraguana_3x);
plot(x3,y3)
hold on
plot(paraguana_3x,paraguana_3y,"o")

[x4,y4] = plotHelper(S4,paraguana_4x);
plot(x4,y4)
hold on
plot(paraguana_4x,paraguana_4y,"o")

[x5,y5] = plotHelper(S5,paraguana_5x);
plot(x5,y5)
hold on
plot(paraguana_5x,paraguana_5y,"o")

[x6,y6] = plotHelper(S6,paraguana_6x);
plot(x6,y6)
hold on
plot(paraguana_6x,paraguana_6y,"o")

[x7,y7] = plotHelper(S7,paraguana_7x);
plot(x7,y7)
hold on
plot(paraguana_7x,paraguana_7y,"o")

[x8,y8] = plotHelper(S8,paraguana_8x);
plot(x8,y8)
hold on
plot(paraguana_8x,paraguana_8y,"o")

[x9,y9] = plotHelper(S9,paraguana_9x);
plot(x9,y9)
hold on
plot(paraguana_9x,paraguana_9y,"o")

[x10,y10] = plotHelper(S10,paraguana_10x);
plot(x10,y10)
hold on
plot(paraguana_10x,paraguana_10y,"o")

[x11,y11] = plotHelper(S11,paraguana_11x);
plot(x11,y11)
hold on
plot(paraguana_11x,paraguana_11y,"o")

[x12,y12] = plotHelper(S12,paraguana_12x);
plot(x12,y12)
hold on
plot(paraguana_12x,paraguana_12y,"o")

[x13,y13] = plotHelper(S13,paraguana_13x);
plot(x13,y13)
hold on
plot(paraguana_13x,paraguana_13y,"o")

[x14,y14] = plotHelper(S14,paraguana_14x);
plot(x14,y14)
hold on
plot(paraguana_14x,paraguana_14y,"o")
title("Puntos VS Aproximación")

%Ahora presentamos un gráfico mostrando únicamente nuestra aproximación:
figure
[x1,y1] = plotHelper(S1,paraguana_1x);
plot(x1,y1)
hold on


[x2,y2] = plotHelper(S2,paraguana_2x);
plot(x2,y2)
hold on


[x3,y3] = plotHelper(S3,paraguana_3x);
plot(x3,y3)
hold on


[x4,y4] = plotHelper(S4,paraguana_4x);
plot(x4,y4)
hold on


[x5,y5] = plotHelper(S5,paraguana_5x);
plot(x5,y5)
hold on


[x6,y6] = plotHelper(S6,paraguana_6x);
plot(x6,y6)
hold on


[x7,y7] = plotHelper(S7,paraguana_7x);
plot(x7,y7)
hold on


[x8,y8] = plotHelper(S8,paraguana_8x);
plot(x8,y8)
hold on


[x9,y9] = plotHelper(S9,paraguana_9x);
plot(x9,y9)
hold on


[x10,y10] = plotHelper(S10,paraguana_10x);
plot(x10,y10)
hold on


[x11,y11] = plotHelper(S11,paraguana_11x);
plot(x11,y11)
hold on

[x12,y12] = plotHelper(S12,paraguana_12x);
plot(x12,y12)
hold on


[x13,y13] = plotHelper(S13,paraguana_13x);
plot(x13,y13)
hold on


[x14,y14] = plotHelper(S14,paraguana_14x);
plot(x14,y14)
hold on

title("Aproximación")

%A continuación vamos a calcular la longitud total de la línea de costa. Usaremos
%la función splineLength auxiliar que hicimos, que internamente usa LongitudArco:

longitud = 0;
longitud = longitud + splineLength(S1,paraguana_1x);
longitud = longitud + splineLength(S2,paraguana_2x);
longitud = longitud + splineLength(S3,paraguana_3x);
longitud = longitud + splineLength(S4,paraguana_4x);
longitud = longitud + splineLength(S5,paraguana_5x);
longitud = longitud + splineLength(S6,paraguana_6x);
longitud = longitud + splineLength(S7,paraguana_7x);
longitud = longitud + splineLength(S8,paraguana_8x);
longitud = longitud + splineLength(S9,paraguana_9x);
longitud = longitud + splineLength(S10,paraguana_10x);
longitud = longitud + splineLength(S11,paraguana_11x);
longitud = longitud + splineLength(S12,paraguana_12x);
longitud = longitud + splineLength(S13,paraguana_13x);
longitud = longitud + splineLength(S14,paraguana_14x);

longitud

%Nota: Toda justificación está explicada en el archivo .pdf del informe.


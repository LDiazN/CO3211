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
  -ContornoCosta.m
  -LongitudLineaCosta
  
  -paraguana_origin.bmp
  -paraguanai.bmp (con 1 <= i <= 14)
  -data.mat
  
Los primeros 8 son las funciones auxiliares del programa, los siguientes dos 
son las imágenes bmp que se usaron para escoger los puntos region por region,
y el último archivo son lo puntos almacenados correspondientes a las imágenes
bmp. Se prefirió almacenarlos en un .mat "data.m" dado el tiempo de corrida que amerita
leer los puntos de todas las imágenes. En el archivo test.m adjunto 
adicionalmente se encuentra el código utilizado para leer los puntos de las 
imágenes.
%}

%Graficaremos la costa con los puntos originales:
ContornoCosta(1);
%Y ahora sin los puntos originales:
figure
ContornoCosta(0);

%Ahora calculamos la longitud de la línea de costa:
longitud = LongitudLineaCosta()

%Nota: Toda justificación está explicada en el archivo .pdf del informe.


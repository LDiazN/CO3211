%Laboratorio 1.
format long;
n = 1000000;
suma = 0;
for i = 1:1:n
  suma = suma + 1/n;
endfor
p1 = suma
%El valor esperado sería 1, que es n(1/n) = 1
p = 1
error_rel = abs(p1 - p)/abs(p)
%{
El error ocurre y se vuelve mayor mientras el n sea más grande porque se están sumando
muchos números que arrastran un error al no poder representar correctamente todos los decimales
de 1/n; esto es, se representa 1/n como un número más grande que el de su valor real y se obtiene 
la suma de este valor superior n veces.
%}
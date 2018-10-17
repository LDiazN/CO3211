%{
    Luis Diaz; 15-10420
    Laboratorio 1, ejercicio 3, Varianza
%}
x = [10000000000 10000000001 10000000002];
n = length(x)
v1 = 0;
media = 0;
%Cálculo de media
for i = 1:length(x)
    media = media + x(i);
    endfor

media = media/length(x);

% Varianza con ecuación (1):
for i = 1:length(x)
    v1 = v1 + (x(i) - media).^2;
    endfor

disp("Varianza con ecuación (1)");
v1 = v1./(length(x)-1)

% Varianza con ecuación (2):
disp("Varianza con ecuación (2)");


v2 = (sum(x.^2) - (sum(x).^2)/n)/(n-1)

%{
Vemos que los resultados son muy diferentes. Esto se debe a que en el primer caso se está sumando 
constantemente un número que puede traer errores, en cambio en el segundo este número con sus
posibles errores se suman una única vez al final.    
%}
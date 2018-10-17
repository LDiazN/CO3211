%{
    Luis Diaz; 15-10420
    Laboratorio 1, ejercicio 2, serie de Taylor
%}
format long;
function value = cosTaylorSumatoria (x,n)
    alternante = -1;
    suma = 1;
    for i = 1:n
        suma += ((-1).^i)*(x.^(2*i))./(factorial(2*i));
    endfor
    value = suma;
    end

%Parte (a):
function value = cosTaylorRecursivo (x,n)
    y = (-1).^n;
    k = n;
    while (k>0)
        y = (y.*(x.^2))/(2.*k.*(2*k - 1)) + (-1).^(k-1);
        k = k - 1;
    endwhile
    value = y;
    end

x = pi*8:0.01:pi*14;
n = 51;

% Parte (c): 
disp("Resultados recursivos: ");
r1 = cosTaylorRecursivo(2*pi,n)
r2 = cosTaylorRecursivo(8*pi,n)
r3 = cosTaylorRecursivo(16*pi,n)

disp("Resultados de potencias: ");
p1 = cosTaylorSumatoria(2*pi,n)
p2 = cosTaylorSumatoria(8*pi,n)
p3 = cosTaylorSumatoria(16*pi,n)

disp("Resultados de la función cos(x): ")
c1 = cos(2*pi)
c2 = cos(8*pi)
c3 = cos(16*pi)

plot(x,cosTaylorSumatoria(x,n),'r',x,cosTaylorRecursivo(x,n),'g')
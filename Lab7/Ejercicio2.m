%{
Ejercicio2, Lab7
Luis Diaz; 15-10420.
%}

%{
2.a) En el documento adjunto se hayó el siguiente "polinomio" de Taylor:
        P(x) = Ln(x) - 5/4 + x + (1/4)*x^2
     De tal manera, definimos el polinomio de la siguiente manera:
%}
P1 = [1/4;1;-5/4]
P = @(x) polyval(P1,x) + log(x);
%Este es nuestro polinomio, ahora evualuamos en 1.1 y comparamos con la integral
%que ofrece octave.
F = @(x) exp(x)./x;

Y_poli = P(1.15)
Y_oct = integral(F,1,1.15)

%Ahora vamos a graficar ambas funciones en [1,4]
x = 1:0.1:4;
Y1_pol = 1:1:length(x);
Y1_oct = 1:1:length(x);
for i = 1:1:length(Y1_pol)
    Y1_pol(i) = P(x(i));
    Y1_oct(i) = integral(F,1,x(i));
endfor

figure

plot(Y1_oct,x)

hold on

plot(Y1_pol,x)
legend("octave","polinomio")
legend("Location",'southeast')
title("aproximación vs función de octave")

%{
Como vemos, las aproximaciones en este intervalo son bastante malas, y las fun-
ciones solo se parecen en un intervalo pequeño y cercano al 0.
%}

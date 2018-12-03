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


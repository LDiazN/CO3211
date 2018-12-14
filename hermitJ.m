#toma las coordenadas x y y (f) de ciertos puntos y ademas una lista con la derivada
#de f evaluada en dichos x y retorna el polinomio de Hermit.
function [coef] = hermite(x,f,derivada)
    n = length(x);
    for i=1:n;
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1,1) = f(i);
        Q(2*i,1) = f(i);
        Q(2*i,2) = derivada(i);
        if i~=1;
            Q(2*i-1,2) = (Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
        end
    end
    for i=3:2*n
        for j=3:i
            Q(i,j) = (Q(i,j-1)-Q(i-1,j-1))/(z(i)-z(i-j+1));
        end
    end
    for i=1:2*n
        coef(i)=Q(i,i);
end

# Que ladilla 4 clases de yriarte esta semana

# Polinomio Interpolante natural 

# Dados (Xo,Fo), (X1,F1)... (Xn,Fn)
#          Po       P1          Pn

# todos los Xi son diferentes, Xi != Xj

# a)
# grado(p) <= n

# b)
# P(Xi) = Fi

# P(t) = Ao + A1.t + A2.t**2 + ... + An.t**n

# Ver foto 1 

# El comando se ve asi:
# p = polyfit (X,Y,n)
# ver foto 2

# luego de hacer eso:
# p = [An,An-1,...,Ao]

# Ademas usaremos:
# polyval(p,k)
# que lo que hace es p(k), es decir evaluar el polinomio en k


# PrUeBaS:
x = linspace(0,4*pi,10); #esto hace un intervalo de 0 a 4pi donde hay 10 valores
# si no le pones nada te da 100 puntos.
y = sin(x);
p=polyfit(x,y,7);
x1=linspace(0,4*pi);
y1=polyval(p,x1);
figure
plot(x,y,"o");
hold on
plot(x1,y1)
hold off


#otra prueba:
x = linspace(0,1,5);
# Esta es la funcion que usaremos, con el . ya que le pasamos un vector
y = 1./(1+x);
p = polyfit(x,y,4);
x1 = linspace(0,2);
y1 = 1./(1+x1);
f1 = polyval(p,x1);
figure
plot(x,y,"o")
hold on
plot(x1,y1)
plot(x1,f1,"r--")
legend("y","y1","f1")



# Comandos:
roots(p)
# esta es para ver las raices del polinomio

error = sum( (polyval(p,x1) - y1).**2) /length(x1)
#esto da el error minimo al cuadrado, y1 es la funcion

# Eso es todo :)

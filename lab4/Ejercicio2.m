%Ejercicio2; Luis Diaz, 15-10420:

%Primero vamos a construir las matrices
n = 250;
Y = ones(n,n);

for i = 1:1:n
  for j = 1:1:n
    Y(i,j) = randi([-5 5]);
  endfor
endfor

B = Y*(Y.');
%Epsi sirve para definir A
epsi = 0.001;

A = B + (epsi - min(eig(B)))*eye(n);
% e1 es el vector solución de b = A*e
e1 = 1:1:n;

for i = 1:1:n
  ei(i) = (-1)^i;
endfor
% es el b de b = A*e
b = A*e; 
%{ a)
    Vamos a demostrar que A es simétrica y definida positiva.
    Vemos que A es la suma de una dos matrices simétricas, una matriz identidad
    multiplicada por una constante, y B que es el producto de una matriz por su 
    traspuesta, por lo tanto debe ser simétrica (suma de simétricas es simétrica).
    Vamos a demostrar que el producto de una matriz por su traspuesta es 
    simétrico:
      
      Veamos que B = (b(i,j)) es simétrica, esto es, que b(i,j)=b(j,i). 
      Como B = Y*Y', entonces:
          b(i,j) = (+k| 1<=k<=n: y(i,k)*y'(k,j)) 
          b(j,i) = (+k| 1<=k<=n: y(j,k)*y'(k,i)) 
          
      Pero como y'(j,i) = y(i,j) porque Y' es la traspuesta de Y, entonces:
          b(i,j) = (+k| 1<=k<=n: y(i,k)*y'(k,j)) 
                 = (+k| 1<=k<=n: y(i,k)*y(j,k)); [*]
          b(j,i) = (+k| 1<=k<=n: y(j,k)*y'(k,i)) 
                 = (+k| 1<=k<=n: y(j,k)*y(i,k)); [**]
      Y como [*] == [**], entonces b(i,j) = b(j,i), y por lo tanto B es simétric
      
      Ahora demostremos que A es definida positiva. Sabemos que para que una 
      matriz sea definida positiva se tiene que cumplir que su mínimo autovalor
      sea positivo; vamos a buscar ese autovalor de A
            
            A = B + (epsi - min(eig(B)))*I
              multiplicando por la derecha a ambos lados por el autovector v
              correspondiente al min(eig(B)), tenemos:
            A*v = B*v + (epsi - min(eig(B)))*v
              distribuyendo y agrupando:
            A*v = B*v - min(eig(B))*v + epsi*v
              Como el autovalor y autovector cumplen que A*v - eig(a)*v = 0:
            A*v = 0 + epsi*v
            A*v = epsi*v
            Y por definición de autovalor, entonces epsi es autovalor de A y 
            como siempre es positivo, entonces A es definida positiva.
            
%}

% b) Vamos a resolver Ax = b con cada método.
epsi1 = 10^(-12);
A1 = B + (epsi1 - min(eig(B)))*eye(n);
b1 = A1*e; 

epsi2 = 10^(-8);
A2 = B + (epsi2 - min(eig(B)))*eye(n);
b2 = A2*e; 

epsi3 = 10^(-4);
A3 = B + (epsi3 - min(eig(B)))*eye(n);
b3 = A3*e; 

  %crout:
tic
[L,U] = croutFact1(A1);
x1_crout = resLU(A1,b1,b1); 
tCrout1 = toc

tic
[L,U] = croutFact1(A2);
x2_crout = resLU(A2,b2,b2); 
tCrout2 = toc

tic
[L,U] = croutFact1(A3);
x3_crout = resLU(A3,b3,b3); 
tCrout3 = toc

  %cholesky
tic
L = cholesky(A1);
x1_chola = resLU(L,L.',b1);
tChola1 = toc

tic
L = cholesky(A2);
x2_chola = resLU(L,L.',b2);
tChola2 = toc

tic
L = cholesky(A3);
x3_chola = resLU(L,L.',b3);
tChola3 = toc
%{
Los tiempos fueron:
tCrout1 =  6.8452
tCrout2 =  6.8413
tCrout3 =  6.8466
tChola1 =  71.320
tChola2 =  72.414
tChola3 =  70.950
%}

% c) Busquemos esos datos: 
% datos_epsii = [epsii min(eig(Ai)) cond(Ai,inf) tCrouti tCholai ]
datos_epsi1 = [epsi1 min(eig(A1)) cond(A1,inf) tCrout1 tChola1]
datos_epsi2 = [epsi2 min(eig(A2)) cond(A2,inf) tCrout2 tChola2]
datos_epsi3 = [epsi3 min(eig(A3)) cond(A3,inf) tCrout3 tChola3]
%{
Tabla obtenida:
    epsii    | mínimo autovalor | condicionamiento |    t Crout   | t Cholesky
-------------------------------------------------------------------------------
 1: 10^(-12) |    1.0000e-12    |    1.3738e-12    |  8.5380e+16  | 7.0239e+01
-------------------------------------------------------------------------------
 2: 10^(-8)  |    1.0000e-08    |    1.0000e-08    |  1.0281e+13  | 7.2804e+01
-------------------------------------------------------------------------------
 3: 10^(-4)  |    1.0000e-04    |    1.0000e-04    |  1.0281e+09  | 6.8850e+00 
------------------------------------------------------------------------------- 
%}



%{ 
    d)
    El método más eficiente fue el de crout, y en esta implementación crout es
    un algoritmo de orden O(n^2), mientras que cholesky es O(n^3). 
    
    El mínimo autovalor y el epsi terminaron siendo iguales.
    
    El parámetro epsilon parece afectar el condicionamiento, en todos los casos
    tienen un condicionamiento que es múltiplo de epsilon
    
    
%}
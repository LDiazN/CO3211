%Ejercicio2:

%Ejercicio2.a).1:

%Usando la función toeplitz, crearemos la matriz de toeplitz para cada caso.

%Creamos el vector v dado con n = 5:

v1 = (1:1:5);
x1 = ones(5+1,1);
for i = 1:1:2*5+1
  v1(i) = 1/i;
endfor
%Creamos la matriz de toeplitz
T1 = toeplitz(v1)
b1 = T1*x1

%repetimos el proceso con n = 25
v2 = (1:1:25);
x2 = ones(25+1,1);
for i = 1:1:2*25+1
  v2(i) = 1/i;
endfor
%Creamos la matriz de toeplitz
T2 = toeplitz(v2)
b2 = T2*x2

%Ahora creamos el tercer sistema dado:
v3 = [-3 -2 -1 0.01 1 2 3];
x3 = ones(4,1);

T3 = toeplitz(v3)
b3 = T3*x3

%Vamos a conseguir los autovalores de cada matriz
av1 = eig(T1)
av2 = eig(T2)
av3 = eig(T3)
%Ahora los determinantes:
det1 = det(T1)
det2 = det(T2)
det3 = det(T3)
%Y las condiciones-inf de las matrices:
cond1 = cond(T1,"inf")
cond2 = cond(T2,"inf")
cond3 = cond(T3,"inf")
%Vamos a resolver los sistemas generados con los métodos dados:

%Por eliminación gaussiana sin pivoteo:

x1_GNoPiv = resGaussNoPiv(T1,b1)
x2_GNoPiv = resGaussNoPiv(T2,b2)
x3_GNoPiv = resGaussNoPiv(T3,b3)

%Por eliminación gaussiana con pivoteo:

x1_GPiv = resGaussPiv(T1,b1)
x2_GPiv = resGaussPiv(T2,b2)
x3_GPiv = resGaussPiv(T3,b3)

%Por sistema LU:

x1_LU = resLU(T1,b1)
x2_LU = resLU(T2,b2)
x3_LU = resLU(T3,b3)

%Ahora calcularemos los errores relativos para cada método (Usaremos la función 
% auxiliar RelError_N1 que calcula el error relativo en norma1)

    %gauss sin piv :
error1_NoPiv = RelError_N1(x1,x1_GNoPiv)
error2_NoPiv = RelError_N1(x2,x2_GNoPiv)
error3_NoPiv = RelError_N1(x3,x3_GNoPiv)
    %gauss con piv :
error1_Piv = RelError_N1(x1,x1_GPiv)
error2_Piv = RelError_N1(x2,x2_GPiv)
error3_Piv = RelError_N1(x3,x3_GPiv)
    %Descomposición LU :
error1_LU = RelError_N1(x1,x1_LU)
error2_LU = RelError_N1(x2,x2_LU)
error3_LU = RelError_N1(x3,x3_LU)
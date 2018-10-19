%Ejercicio3:
%Repetiremos todo el proceso pero con las matrices dadas:

v1 = [0.5, 0.6, 0.7, 0.8, 0.9];
x1 = ones(5,1);
%Creamos la matriz dada:
T1 = vander(v1)
b1 = T1*x1

%repetimos el proceso con n = 25
v2 = [0.5, 0.6, 7, 8, 91013];
x2 = ones(5,1);
%Creamos la matriz dada:
T2 = vander(v2)
b2 = T2*x2

%Vamos a conseguir los autovalores de cada matriz
av1 = eig(T1)
av2 = eig(T2)

%Ahora los determinantes:
det1 = det(T1)
det2 = det(T2)

%Y las condiciones-inf de las matrices:
cond1 = cond(T1,"inf")
cond2 = cond(T2,"inf")

%Vamos a resolver los sistemas generados con los métodos dados:

%Por eliminación gaussiana sin pivoteo:

x1_GNoPiv = resGaussNoPiv(T1,b1)
x2_GNoPiv = resGaussNoPiv(T2,b2)


%Por eliminación gaussiana con pivoteo:

x1_GPiv = resGaussPiv(T1,b1)
x2_GPiv = resGaussPiv(T2,b2)


%Por sistema LU:

x1_LU = resLU(T1,b1)
x2_LU = resLU(T2,b2)


%Ahora calcularemos los errores relativos para cada método (Usaremos la función 
% auxiliar RelError_N1 que calcula el error relativo en norma1)

    %gauss sin piv :
error1_NoPiv = RelError_N1(x1,x1_GNoPiv)
error2_NoPiv = RelError_N1(x2,x2_GNoPiv)

    %gauss con piv :
error1_Piv = RelError_N1(x1,x1_GPiv)
error2_Piv = RelError_N1(x2,x2_GPiv)

    %Descomposición LU :
error1_LU = RelError_N1(x1,x1_LU)
error2_LU = RelError_N1(x2,x2_LU)

%Ejercicio2
%Luis Diaz: 15-10420
%Inicializamos las matrices:
A = [4 -1 0 0; -1 4 -1 0; -1 -1 4 0; 1 0 -1 2+i]

B = [-4 0 1+i 3; 0 4 -2 1; 1+i 2 -2 0; 3 1 0 -4*i]

%Vamos a graficar sus discos con la función disco.m:
disp("Para A:")
disco(A)
pause
disco(B)
%Vemos marcada con una X las coordenadas del autovalor de cada matriz correspon-
%diente al círculo, calculado por matlab. (notemos que en A hay un círculo que 
%se solapa con otro)
%
%Como cada autovalor está en su respectivo disco de Gersh. entonces para calcular
%el intervalo donde pertenece el autovalor. Vemos que cada autovalor está en el 
%intervalo -S + aii <= z <= S + aii, donde S es la suma de los elementos de la 
%fila i salvo aii. Hicimos una función que calcule esa cota.

Autovalores_A = ones(2,length(A));
for i = 1:1:length(A)
  [Autovalores_A(1,i),Autovalores_A(2,i)] = intervaloAutovalori(A,i)
endfor

Autovalores_B = ones(2,length(B));
for i = 1:1:length(B)
  [Autovalores_B(1,i),Autovalores_B(2,i)] = intervaloAutovalori(B,i)
endfor

%Ahora vamos a calcular el máximo autovalor de cada matriz y luego comparamos 
%Con los resultados de octave:

disp("Autovalores de potencia.m: ")
[v,k,maxEigA_potencia] = potencia(A,10^-12,ones(length(A),1),5000)
[v,k,maxEigB_potencia] = potencia(B,10^-12,ones(length(B),1),5000)

disp("Autovalores de matlab:")
octaveEig_A = max(eig(A))
octaveEig_B = max(eig(B))
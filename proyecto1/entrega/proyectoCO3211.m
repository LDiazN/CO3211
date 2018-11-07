%{
Luis Diaz; 15-10420.
Proyecto 1, CO3211.

En los archivos randomSol1.m randomSol2.m randomSol3.m están las funciones 
correspondientes a los incisos 1, 2 y 3 del planteamiento respectivamente. 
Además, estas funciones tambien reciben un número intero que sirve para 
especificar la cantidad de soluciones aleatorias que se van a probar.

La matrix C generada por cada una de estas lista los condicionamientos aproximados
por cada uno de los vectores aleatorios creados. Em la primera fila están los 
condicionamientos en norma infinito, y en la segunda en norma 1. Usaremos
esta estructura para facilitar el manejo de los datos.
%}
load CO3211_proy1datos.mat
%A continuación vamos a descomponer en LU cada una de las matrices dadas:
[L1,U1] = LUfact(A1);
[L2,U2] = LUfact(A2);
[L3,U3] = LUfact(A3);
[L4,U4] = LUfact(A4);
[L5,U5] = LUfact(A5);

%También vamos a anotar las condiciones reales (proporcionadas por ML) de c/u:
K1_1 = cond(A1,1);
K2_1 = cond(A2,1);
K3_1 = cond(A3,1);
K4_1 = cond(A4,1);
K5_1 = cond(A5,1);

K1_inf = cond(A1,"inf");
K2_inf = cond(A2,"inf");
K3_inf = cond(A3,"inf");
K4_inf = cond(A4,"inf");
K5_inf = cond(A5,"inf");

%Ahora vamos a crear cada matrix de condiciones:
    %Para el método 1:
C1_m1 = randomSol1(L1,U1,10);
C2_m1 = randomSol1(L2,U2,10);
C3_m1 = randomSol1(L3,U3,10);
C4_m1 = randomSol1(L4,U4,10);
C5_m1 = randomSol1(L5,U5,10);

    %Para el método 2:
C1_m2 = randomSol2(L1,U1,10);
C2_m2 = randomSol2(L2,U2,10);
C3_m2 = randomSol2(L3,U3,10);
C4_m2 = randomSol2(L4,U4,10);
C5_m2 = randomSol2(L5,U5,10);
    
    %Para el método 3:
C1_m3 = randomSol3(L1,U1,10);
C2_m3 = randomSol3(L2,U2,10);
C3_m3 = randomSol3(L3,U3,10);
C4_m3 = randomSol3(L4,U4,10);
C5_m3 = randomSol3(L5,U5,10);

disp("A continuación se muestran las mejores aproximaciones para cada Método:")
disp("")
disp("  Para el método 1:")
disp("")
%Para tomar la mejor cota inferior de la condición, tomaremos la cota más alta
%de las condiciones obtenidas
K1_m1_inf = max(C1_m1(1,:))
K2_m1_inf = max(C2_m1(1,:))
K3_m1_inf = max(C3_m1(1,:))
K4_m1_inf = max(C4_m1(1,:))
K5_m1_inf = max(C5_m1(1,:))
disp("")
K1_m1_n1 = max(C1_m1(2,:))
K2_m1_n1 = max(C2_m1(2,:))
K3_m1_n1 = max(C3_m1(2,:))
K4_m1_n1 = max(C4_m1(2,:))
K5_m1_n1 = max(C5_m1(2,:))
disp("")
disp("  Para el método 2:")
disp("")
K1_m2_inf = max(C1_m2(1,:))
K2_m2_inf = max(C2_m2(1,:))
K3_m2_inf = max(C3_m2(1,:))
K4_m2_inf = max(C4_m2(1,:))
K5_m2_inf = max(C5_m2(1,:))
disp("")
K1_m2_n1 = max(C1_m2(2,:))
K2_m2_n1 = max(C2_m2(2,:))
K3_m2_n1 = max(C3_m2(2,:))
K4_m2_n1 = max(C4_m2(2,:))
K5_m2_n1 = max(C5_m2(2,:))
disp("")
disp("  Para el método 3:")
disp("")
K1_m3_n1 = C1_m3 
K2_m3_n1 = C2_m3 
K3_m3_n1 = C3_m3 
K4_m3_n1 = C4_m3 
K5_m3_n1 = C5_m3 
disp("")
disp("Ahora comparamos con las condiciones de matlab: ")
disp("  En norma inf:")

K1_inf
K2_inf 
K3_inf
K4_inf
K5_inf 
disp("")
disp("  En norma 1: ")
K1_1 
K2_1 
K3_1 
K4_1 
K5_1 


%{
Como pudimos observar, los resultados van mejorando con cada método.
Para el primero de todos, los resultados son poco satisfactorios, sin embargo
se hicieron pruebas adicionales y se observó que en muchos casos los mejores 
resultados estaban asociados a vectores aleatorios con varios signos diferentes
en sus componentes, notando que el valor numérico de la componente no variaba
mucho los resultados tanto como el patrón de signos del vector.

Como tal, y como se observó con el ejemplo de la técnica 2, los patrones de 
signos tenían cierta influencia sobre la precisión de la solución. Ahora la 
pregunta es cual y cual es el patrón de signos que mejor aproxima la solución.
También notamos mejores resultados para la norma inf. 

Por otro lado, con el tercer método tenemos que casi todos los resultados son 
sorprendentemente satisfactorios. La mayoría son idénticos al valor real de la 
norma.
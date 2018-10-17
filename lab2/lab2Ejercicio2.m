%{ 
Laboratorio 2, Ejercicio2;
Luis Diaz: 15-10420; 
%}

%Ejercicio2.a):

%Vamos a generar varias matrices de Hillbert usando la función que está en hillbert.m
disp("Generamos varias matrices de hillbert")
%n = 2
[H1,x1] = hillbert(2)
b1 = H1*x1
%n = 3
[H2,x2] = hillbert(3)
b2 = H2*x2
%n = 8
[H3,x3] = hillbert(8)
b3 = H3*x3
%n = 20
[H4,x4] = hillbert(20)
b4 = H4*x4

disp("Ahora buscamos soluciones aproximadas")
[tempA,tempB] = gaussPiv(H1,b1,0);
x1Gauss = sustat(tempA, tempB)
x1Octave = H1\b1

[tempA,tempB] = gaussPiv(H2,b2,0);
x2Gauss = sustat(tempA, tempB)
x2Octave = H2\b2

[tempA,tempB] = gaussPiv(H3,b3,0);
x3Gauss = sustat(tempA, tempB)
x3Octave = H3\b3

[tempA,tempB] = gaussPiv(H4,b4,0);
x4Gauss = sustat(tempA, tempB)
x4Octave = H4\b4
disp("Se puede ver que los valores de las soluciones van empeorando a medida que aumenta n.")

%Ejercicio2.b)
disp("")
disp("Calcularemos las normas de los restos: ")
r1 = b1 - H1*x1Octave;
delta1 = x1Gauss - x1;
Norma_r1 = norm(r1,1)
Norma_delta1 = norm(delta1,1)

disp("")

r2 = b2 - H2*x2Octave;
delta2 = x2Gauss - x2;
Norma_r2 = norm(r2,1)
Norma_delta2 = norm(delta2,1)
disp("")

r3 = b3 - H3*x3Octave;
delta3 = x3Gauss - x3;
Norma_r3 = norm(r3,1)
Norma_delta3 = norm(delta3,1)
disp("")

r4 = b4 - H4*x4Octave;
delta4 = x4Gauss - x4;
Norma_r4 = norm(r4,1)
Norma_delta4 = norm(delta4,1)
disp("")

disp("<<pausa>>")
pause

%Ejercicio2.e,d)

x = ones(20,1);
for z = 2:1:20
  x(z-1) = condi(z);
endfor

disp("A continuación se mostrará una gráfica de los números de condición de matrices de tamaños 1 a 100")
disp("<<pausa>>")
pause

dominio =1:1:20;
plot1 = plot(dominio,x,"r");
legend("condicion vs n");

%{
Como vemos en la gráfica, el condicionamiento empieza a crecer mucho para valores 
bastante pequeños de n, de manera que la posibilidad de perder dígitos incrementa
muy rápido. Cómo vimos en clase, un condicionamiento de 10^k pierde k cifras
significativas, así que a partir de n = 4 (condicionamiento = 28375.00000)
se pierden muchas cifras. Dado que la solución es un vector de forma 
(1,1,1,1...1), para n = 2 ya se corre el riesgo de perder todas las cifras significativas.
También vale la pena destacar el comportamiento errático del condicionamiento, que 
tiende a subir y bajar mucho a partir de n = 10
%} 

%{
Es lógico que el condicionamiento de una matriz de Hillbert incremente rápidamente,
pues mientras más grande es la matriz, mayor puede ser la suma de i+1-1, y por 
lo tanto los ai serán números cada vez más pequeños y difíciles de representar.
Además, los métodos de eliminación de gauss fallarán porque será muy dificil 
evitar la división entre números muy pequeños, dado que la mayoría de los números
de la matriz son muy pequeños. 
%]
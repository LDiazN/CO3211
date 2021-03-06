%LongitudArco.m

function l = LongitudArco(poli_g3,init,final)
  %{
  poli_g3 es un vector con los coeficientes a b c d de un polinomio de la forma
  a + bx + cx^2 + dx^3. Osea, en formato creciente. La derivada de este polinomio
  es b + 2cx + 3dx^2. Para calcular la longitud de arco usamos la ecuación:
  
        l = integral(sqrt(1 + d(F(x))^2)) from "init" to "final"
   
   ESTA FUNCIÓN SOLO SIRVE PARA CALCULAR LONGITUD DE ARCO DE UN POLINOMIO QUE 
   PROVENGA DE UN SPLINE, Y CUYO LÍMITE INFERIOR "init" SEA EL INICIO DEL INTERV
   VALO DE CONVERGENCIA DEL POLINOMIO. 
  
  %}
  F = @(x) (1 + (poli_g3(2) + 2*poli_g3(3)*(x - init) + 3*poli_g3(4)*((x-init).^2)).^2).^(1/2);
  l =  integral(F,init,final);
  
endfunction

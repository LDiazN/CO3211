% splineCubico.m: esta funcón recibe un conjunto de puntos (x,y) que representan 
% a una función, las derivadas primera y segunda de la función en esos puntos x,
% y devuelve un sline cúbico S que representa a esa función.

function S = splineCubico(X,Y,tiedSp_0,tiedSp_n)
  %{ 
  X: Rango. Es un vector de números.
  Y: imágenes de X mediante la función f posiblemente desconocida.
  tiedSp_0: el valor de S'(X(0)). Si no existe y tampoco existe tiedSp_n, 
            entonces se asume que el spline es de frontera libre y por lo tanto
            S''(X(0)) = S''(X(n)) = 0.
  %}
  
  %Un par de funciones axiliares:
  
  h = @(j) (X(j+1) - X(j));
  
  
  n = length(X);
  S = ones(n,4);
  %S será una matriz nx4 donde la fila j representa al polinomio correspondiente 
  %al spline Sj. La columna 1 será a, 2 será b, 3 será c, 4 será d.
  
  %Configuramos las a:
  S(:,1) = Y;
  
  %Ahora buscamos las c. Dependiendo de si queremos un spline amarrado o no, 
  %lo hacemos de formas diferentes.
  
  switch nargin
    % nargin devuelve el número de argumentos que recibió la función. Si tiene
    % 2, hacemos frontera libre, y si tiene 4 hacemos amarrado. Cualquier 
    % Otro número reporta un error.
    case 2
      %Frontera libre:
      A = zeros(n-2,n-2);
      b = zeros(n,1);      
      
      %Configuramos A:
      for i = 1:1:n-2
        A(i,i) = 2*(h(i) + h(i+1));
      endfor
      
      for i = 2:1:n-2
        A(i,i-1) = h(i-1);
      endfor
      
      for i = 1:1:n-3
        A(i,i+1) = h(i);
      endfor
      
      %Configuramos b:
      for i = 2:1:n-1
        %S(j,1) = a_j
        b(i) = (3/h(i))*(S(i+1,1) - S(i,1)) - (3/h(i-1))*(S(i,1) - S(i-1,1));
      endfor
      b = b(2:n-1);
      
      %Resolvemos:
      S(2:n-1,3) = (A)\b;
      S(1,3) = 0;
      S(n,3) = 0;
    case 4
      %Frontera amarrada:
      A = zeros(n,n);
      b = zeros(n,1); 
      
      
      A(1,1) = 2*h(1);
      A(1,2) = h(1);
      A(n,n) = 2*h(n-1);
      A(n,n-1) = h(n-1);
      
      %Configuramos A:
      for i = 2:1:n-1
        A(i,i) = 2*(h(i-1) + h(i));
        A(i,i-1) = h(i-1);
        A(i,i+1) = h(i);
      endfor
      
      %Configuramos b:
      b(1) = (3/h(1))*(S(2,1) - S(1,1)) - (3*tiedSp_0);
      b(n) = (3*tiedSp_n) - (3/h(n-1))*(S(n,1) - S(n-1,1));
      
      for i = 2:1:n-1
        %S(j,1) = a_j
        b(i) = (3/h(i))*(S(i+1,1) - S(i,1)) - (3/h(i-1))*(S(i,1) - S(i-1,1));
      endfor
      
      %Resolvemos:
      S(:,3) = (A^-1)*b;
      
    otherwise
      disp("Error: invalid number of arguments")
      
  endswitch
  
  %Ahora que tenemos calculados las c, calcularemos las b y d:
  for i = 1:1:n-1
    %S(i,2) = b_i, S(i,4) = d_i
    S(i,2) = (1/h(i))*(S(i+1,1) - S(i,1)) - (h(i)/3)*(2*S(i,3) + S(i+1,3));
    S(i,4) = (S(i+1,3) - S(i,3))/(3*h(i));
  endfor 
endfunction

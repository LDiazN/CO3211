%Ejercicio4; la función de inversa eficiente está en el archivo "inverEfi.m"

%Primero crearemos las matrices que usamos anteriormente:

v1 = [0.5, 0.6, 0.7, 0.8, 0.9];
T1 = vander(v1)

v2 = [0.5, 0.6, 7, 8, 91013];
T2 = vander(v2)

v3 = (1:1:5);
for i = 1:1:2*5+1
  v3(i) = 1/i;
endfor
T3 = toeplitz(v3)

v4 = (1:1:25);
for i = 1:1:2*25+1
  v4(i) = 1/i;
endfor
T4 = toeplitz(v4)

v5 = [-3 -2 -1 0.01 1 2 3];
T5 = toeplitz(v5)

%Ahora calcularemos sus inversas respectivamente:

iT1 = inverEfi(T1)
iT2 = inverEfi(T2)
iT3 = inverEfi(T3)
iT4 = inverEfi(T4)
iT5 = inverEfi(T5)

%Ahora calcularemos || A.A^-1 - I ||inf para cada matriz:

AbsErr1 = norm(T1*iT1 - eye(length(T1)),"inf")
AbsErr2 = norm(T2*iT2 - eye(length(T2)),"inf")
AbsErr3 = norm(T3*iT3 - eye(length(T3)),"inf")
AbsErr4 = norm(T4*iT4 - eye(length(T4)),"inf")
AbsErr5 = norm(T5*iT5 - eye(length(T5)),"inf")

%{
SALIDA:

AbsErr1 =    4.9880e-12
AbsErr2 =  5491292.46968
AbsErr3 =  0.0000000026297
AbsErr4 =  180082.84721
AbsErr5 =    4.6271e-12

Como podemos ver, los errores en los casos de las matrices T2 y T4 son bastante
grandes, aunque en las otras matrices fue más bien despreciable. En el caso de T4,
esto puede deberse a que el proceso de LU usado para cálcular la inversa conlleva 
sumas de muchos sumandos y operaciones de sustracción con números muy parecidos.
%}
%Esta función calcula la matriz de iteración de jacobi: 
%A es la matriz, m es el método. "j": jacobi, "gs": gauss_Seidel
function [Mi] = iterMatrix(A,m)
  D = tril(A) - tril(A,-1);
  L = tril(A,-1);
  U = triu(A,1);
  if m == "j"
    Mi = (D^-1)*(L+U);  
  elseif m == "gs"
    Mi = (D+U)^-1*-L;
  endif
  %{
  [Teorema]
  radioEspectral(D^-1(L+U))<1 ssi jacobi converge

  [Teorema]
  radioEspc(N^-1*P)<1 ssi seidel converge
  %}
endfunction

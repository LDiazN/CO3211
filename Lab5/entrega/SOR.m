%SOR:
%Vamos a solucionar el sistema M*x(i+1) = N*X(i) + wb. Primero vamos a construir
%El M,N:
function [Xn,k] = SOR(A,b,x0,w,itMax,tolerancia)
  L = -tril(A,-1);
  U = -triu(A,1);
  D = diag(diag(A));
  
  M = (D-w*L);
  N = w*U + (1-w)*D;
  
  Xn = x0;
  
  %Ahora vamos a resolver el sistema muchas veces:
  for k = 1:1:itMax
    
    %{
    [L1,U1] = LUfact(M);
    Xprev = Xn;
    Xn = resLU(L1,U1,N*Xn+ w*b);
    %}
    Xprev = Xn;
    Xn = M\(N*Xn + w*b);
    if norm(Xn-Xprev,inf) < tolerancia
        return
    endif
  endfor
endfunction


function [Xn,k] = jacobi1(A,b,x0,maxit,tol)
  n = length(b);
  Xn = NaN*ones(n,1);
  for k=0:1:maxit
    for i=1:1:n
      suma1=0;
      for j=1:1:i-1
        suma1+=A(i,j)*Xn(j);
      end
      suma2=0;
      for j=i+1:1:n
        suma2+=A(i,j)*x0(j);
      end
      Xn(i)=(b(i)-suma1-suma2)/A(i,i);
    end
    if norm(x0-Xn,inf)<tol
      return
    end
    x0=Xn;
  end
end
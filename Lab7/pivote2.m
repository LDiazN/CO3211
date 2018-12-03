%triangula A y b usando gauss con pivoteo
function [A, b] = pivote2(A, b)
    n = length(A);
    for k=1:1:n-1
      %aqui buscamos el maximo
      maximo = abs(A(k,k));
      imaximo = k;
      for i =k+1:1:n
        if (abs(A(i,k))> maximo)
           maximo = abs(A(i, k));
           imaximo=i;
        endif
      endfor
      %aqui hacemos el intercambio de filas con respecto al maximo
      for j = k:1:n
        temp = A(imaximo, j);
        A(imaximo,j)=A(k,j);
        A(k,j) = temp;
      endfor
      temp=b(imaximo);
      b(imaximo)=b(k);
      b(k) = temp;
      
      %aqui por fin hacemos gauss
      for i=k+1:n
        m = A(i, k)/A(k,k);
        for j = k:1:n
          A(i,j) = A(i,j)- m*A(k,j);
        end
        
        b(i)=b(i)-m*b(k);
      end
        
    endfor
endfunction
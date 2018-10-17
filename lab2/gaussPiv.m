function [A,b] = gaussPiv (A, b,piv)
  n = length(A);
  for i = 1:1:n-1
    if piv
    %Buscamos el mejor pivote para esa columna:
    maxi = i;
    
    for j = i+1:1:n
      if abs(A(j,i)) > abs(A(maxi,i))
        maxi = j;
      endif
    endfor
    
    %Ahora que tenemos el máximo pivote, lo intercambiamos con la fila que tenemos en i     
    A([i maxi],:) = A([maxi i],:); 
    b([i maxi],:) = b([maxi i],:);
    endif
    %Ahora pondremos 0's en la columna bajo el pivote
    pivote = A(i,i);
    
    for j = i+1:1:n
      alpha = A(j,i)/pivote;
      A(j,:) = A(j,:) - alpha.*A(i,:);
      b(j,:) = b(j,:) - alpha.*b(i,:);
    endfor
  endfor 
endfunction
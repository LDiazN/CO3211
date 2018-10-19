%gaussNoPiv; esta función es un simple gauss sin pivoteo

function [A,b] = gaussNoPiv(A, b,piv)
  n = length(A);
  for i = 1:1:n-1
    %Ahora pondremos 0's en la columna bajo el pivote
    pivote = A(i,i);
    
    for j = i+1:1:n
      alpha = A(j,i)/pivote;
      A(j,:) = A(j,:) - alpha.*A(i,:);
      b(j,:) = b(j,:) - alpha.*b(i,:);
    endfor
  endfor 
endfunction
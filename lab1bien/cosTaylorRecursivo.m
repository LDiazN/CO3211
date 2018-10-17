%cosTaylorRecursivo


function y = cosTaylorRecursivo(x,n)
  y1 = (-1).^n;
  y = y1;
  for k = n:-1:1
    y = (y1.*x.^2)/((2*k).*(2*k-1)) + (-1).^(k-1);
    y1 = y;
  endfor
endfunction

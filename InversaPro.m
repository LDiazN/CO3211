%InversaPro

function Inv = InversaPro(A)
  n = length(A);
  Lu = LUredox(A);
  L =tril(Lu,-1) + eye(n);
  U = triu(Lu);
  Inv = [];
  for k = 1:1:n
    e = ones(n,1);
    e(k) = 1;
    y = sustfor(L,e);
    x = sustat(U,y);
    Inv = [Inv,x];
  endfor
endfunction
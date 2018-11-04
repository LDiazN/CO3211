%resLU; Una función auxiliar para resolver sistemas mediante sustitución LU:
function x = resLU(L,U,b)
  y = sustfor(L,b);
  x = sustback(U,y);
endfunction

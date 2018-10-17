%euler negativo en potencias
function en = negaEuler(x)
  en = 1;
  for i = 1:1:25
    disp("en: ")
    en
    disp("término: ")
    a = (((-1).^i)*(x.^(i)))/factorial(i)
    
    en = en + (((-1).^i)*(x.^(i)))/factorial(i);
    
  endfor
endfunction

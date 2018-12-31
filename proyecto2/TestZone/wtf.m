[x,y] = captura_puntos('paraguana_escala.bmp');

l = 0;
for i = 1:1:length(x)-1
  l = l + sqrt((y(i+1)-y(i))^2 + (x(i+1) - x(i))^2);
endfor
l

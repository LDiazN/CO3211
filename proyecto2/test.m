%test.m
%{
x = linspace(-4*pi,4*pi,50);
y = sin(x);

y1 = splineCubico(x,y,1,1);
x1 = -4*pi:0.1:4*pi;
for i = 1:1:length(x1)
  y2(i) = HornerSpline(y1,x1(i),x);
endfor
figure
plot(x1,y2)
%}



[paraguana_1x,paraguana_1y] = captura_puntos('paraguana1.bmp');
save data.mat paraguana_1x paraguana_1y
[paraguana_2x,paraguana_2y] = captura_puntos('paraguana2.bmp');
save data.mat paraguana_2x paraguana_2y
[paraguana_3x,paraguana_3y] = captura_puntos('paraguana3.bmp');
save data.mat paraguana_3x paraguana_3y
[paraguana_4x,paraguana_4y] = captura_puntos('paraguana4.bmp');
save data.mat paraguana_4x paraguana_4y
[paraguana_5x,paraguana_5y] = captura_puntos('paraguana5.bmp');
save data.mat paraguana_5x paraguana_5y
[paraguana_6x,paraguana_6y] = captura_puntos('paraguana6.bmp');
save data.mat paraguana_6x paraguana_6y
[paraguana_7x,paraguana_7y] = captura_puntos('paraguana7.bmp');
save data.mat paraguana_7x paraguana_7y
[paraguana_8x,paraguana_8y] = captura_puntos('paraguana8.bmp');
save data.mat paraguana_8x paraguana_8y
[paraguana_9x,paraguana_9y] = captura_puntos('paraguana9.bmp');
save data.mat paraguana_9x paraguana_9y
[paraguana_10x,paraguana_10y] = captura_puntos('paraguana10.bmp');
save data.mat paraguana_10x paraguana_10y
[paraguana_11x,paraguana_11y] = captura_puntos('paraguana11.bmp');
save data.mat paraguana_11x paraguana_11y
[paraguana_12x,paraguana_12y] = captura_puntos('paraguana12.bmp');
save data.mat paraguana_12x paraguana_12y
[paraguana_13x,paraguana_13y] = captura_puntos('paraguana13.bmp');
save data.mat paraguana_13x paraguana_13y
[paraguana_14x,paraguana_14y] = captura_puntos('paraguana14.bmp');
save data.mat paraguana_1x paraguana_1y paraguana_2x paraguana_2y paraguana_3x paraguana_3y paraguana_4x paraguana_4y paraguana_5x paraguana_5y paraguana_6x paraguana_6y  paraguana_7x paraguana_7y paraguana_8x paraguana_8y paraguana_9x paraguana_9y paraguana_10x paraguana_10y paraguana_11x paraguana_11y paraguana_12x paraguana_12y paraguana_13x paraguana_13y paraguana_14x paraguana_14y

%{
plot(paraguana_1x,paraguana_1y,"+")
hold on
plot(paraguana_2x,paraguana_2y,"+")
hold on
plot(paraguana_3x,paraguana_3y,"+")
hold on
plot(paraguana_4x,paraguana_4y,"+")
hold on
plot(paraguana_5x,paraguana_5y,"+")
hold on
plot(paraguana_6x,paraguana_6y,"+")
hold on
plot(paraguana_7x,paraguana_7y,"+")
hold on
plot(paraguana_8x,paraguana_8y,"+")
hold on
plot(paraguana_9x,paraguana_9y,"+")
hold on
plot(paraguana_10x,paraguana_10y,"+")
hold on
plot(paraguana_11x,paraguana_11y,"+")
hold on
plot(paraguana_12x,paraguana_12y,"+")
hold on
plot(paraguana_13x,paraguana_13y,"+")
hold on
plot(paraguana_14x,paraguana_14y,"+")
hold on


load data.mat
S11 = splineCubico(paraguana_11x,paraguana_11y,0,0);
x = paraguana_11x(1):0.1:paraguana_11x(length(paraguana_11x));
for i = 1:1:length(x)
  y(i) = HornerSpline(S11,x(i),paraguana_11x);  
endfor

plot(x,y)
hold on
plot(paraguana_11x,paraguana_11y,"*")
%}
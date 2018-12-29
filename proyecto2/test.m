%test.m

x = linspace(-4*pi,4*pi,50);
y = sin(x);

y1 = splineCubico(x,y,1,1);
x1 = -4*pi:0.1:4*pi;
for i = 1:1:length(x1)
  y2(i) = HornerSpline(y1,x1(i),x);
endfor
figure
plot(x1,y2)


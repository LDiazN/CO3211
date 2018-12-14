%PrepaJean 9 
%Archivos de esta prepa: Newton, Hornerdezpla

x = linspace(0,4*pi,10);
y = sin(x);
polNewton = Newton(x,y);
polHermit = hermitJ(x,y,cos(x));
x1 = 0:0.1:4*pi;
y1 = sin(x);
subplot(3,2,[1,2])
plot(x1,sin(x1))
title("Newton")
hold on
vector = zeros(0,length(x1));
k = 1;
for i = 0:0.1:4*pi
  vector(k) = Hornerdespla(polNewton,i,x);
  k = k+1;
endfor

plot(x1,vector,"y")
legend("function", "Newton")

subplot(3,2,[3,4])
plot(x1,sin(x1))
title("hermit")
hold on
vector = zeros(0,length(x));
k = 1;

for i = 0:0.1:4*pi
  vector(k) = HornerdezplaHer(polHermit,i,x);
  k = k+1;
endfor
plot(x1,vector)
hold off
legend("function","Hermite")


subplot(3,2,[5,6])
plot(x1,sin(x1))
title("Newton puyado")
hold on
x = Chebyshev(0,4*pi,10);
y = sin(x);
polNewtonChe = Newton(x,y);
vector = zeros(0,length(x1));
k = 1;
for i = 0:0.1:4*pi
  vector(k) = Hornerdespla(polNewtonChe,i,x);
  k = k+1;
endfor

plot(x1,vector,"y")
legend("function", "Newton+cheb")
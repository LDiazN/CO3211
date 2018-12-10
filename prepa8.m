%Prepa post lab 7:
x = linspace(0,4*pi,10);
y = sin(x);
van = vander(x);
a = van^-1 * y.'
x1 = linspace(0,4*pi);
y1 = Horner(a,1);
figure
plot(x,y,"o")
hold on
plot(x1,y1)

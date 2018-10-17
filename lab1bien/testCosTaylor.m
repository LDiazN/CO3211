%testTaylor
range = 8*pi;
x = -range:0.01:14*pi;
plot1 = plot(x,cosTaylorRecursivo(x,51),x,cosTaylorPotencias(x,51),"r");
legend("Coseno de taylor en potencias");
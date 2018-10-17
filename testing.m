a = 10:54;
sum_vec = zeros(1,length(a));
sum_a = 0;
for i = 1:length(a)
  sum_a = sin(i) + sum_a;
  sum_vec(i) = sum_a;
endfor
figure;plot(sum_vec)
function [x,y] = captura_puntos(paraguana)
%a=imread('paraguana_puntos_en_contorno.bmp');
a=imread(paraguana); 
%escala 10 Km de (41,469) a (107,469)
pixvert=size(a,1);
pixhor=size(a,2);
x = [];
y = [];
for i=1:pixhor
    for j=1:pixvert
        rojo = a(j,i,1);
        verde = a(j,i,2);
        azul = a(j,i,3);
        
        if (rojo == 255) && (verde == 0) && (azul == 0)
            x = [x i];
            y = [y pixvert-j];
        end
    end
end
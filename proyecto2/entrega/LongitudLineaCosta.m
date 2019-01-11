%LongitudLineaCosta.m
function longitud = LongitudLineaCosta()
  %Vamos a calcular los spline para conseguir la longitud:
  load data.mat
  S1 = splineCubico(paraguana_1x,paraguana_1y);
  S2 = splineCubico(paraguana_2x,paraguana_2y);
  S3 = splineCubico(paraguana_3x,paraguana_3y);
  S4 = splineCubico(paraguana_4x,paraguana_4y);
  S5 = splineCubico(paraguana_5x,paraguana_5y);
  S6 = splineCubico(paraguana_6x,paraguana_6y);
  S7 = splineCubico(paraguana_7x,paraguana_7y);
  S8 = splineCubico(paraguana_8x,paraguana_8y);
  S9 = splineCubico(paraguana_9x,paraguana_9y);
  S10 = splineCubico(paraguana_10x,paraguana_10y);
  S11 = splineCubico(paraguana_11x,paraguana_11y);
  S12 = splineCubico(paraguana_12x,paraguana_12y);
  S13 = splineCubico(paraguana_13x,paraguana_13y);
  S14 = splineCubico(paraguana_14x,paraguana_14y);

  %A continuación vamos a calcular la longitud total de la línea de costa. Usaremos
  %la función splineLength auxiliar que hicimos, que internamente usa LongitudArco:

  longitud = 0;
  longitud = longitud + splineLength(S1,paraguana_1x);
  longitud = longitud + splineLength(S2,paraguana_2x);
  longitud = longitud + splineLength(S3,paraguana_3x);
  longitud = longitud + splineLength(S4,paraguana_4x);
  longitud = longitud + splineLength(S5,paraguana_5x);
  longitud = longitud + splineLength(S6,paraguana_6x);
  longitud = longitud + splineLength(S7,paraguana_7x);
  longitud = longitud + splineLength(S8,paraguana_8x);
  longitud = longitud + splineLength(S9,paraguana_9x);
  longitud = longitud + splineLength(S10,paraguana_10x);
  longitud = longitud + splineLength(S11,paraguana_11x);
  longitud = longitud + splineLength(S12,paraguana_12x);
  longitud = longitud + splineLength(S13,paraguana_13x);
  longitud = longitud + splineLength(S14,paraguana_14x);

  longitud = longitud*10/66;

endfunction

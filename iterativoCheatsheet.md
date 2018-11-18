### Métodos iterativos:
	
	Los métodos iterativos son aquellos que calculan algún tipo de vector en forma de recurrencia.
	Normalmente, lo que define un método iterativo es que x^(i+1) = H*x^(i) + c. Esa es la recurrencia
	que les define. Los métodos iteraqtivos tienen dos propiedades:
	
## Consistencia:
	La consistencia significa que, si x es la solución de A*x = b, entonces se cumple:
						x = H*x + c
								(Nota de Luis: no te preguntes que es H y c, luego lo averiguamos)

## Convergencia:
	Como x se calcula como la recurrencia que señalamos antes, entonces se dice que nuestro sistema es convergente si cumple:
						Lim  x^(i) = A^-1*b
					       x->inf
	En human-readable, esto lo que quiere decir es que cuando la recurrencia
tiende a infinito, se va acercando cada vez más a la solución original del sistema.

		"Convergencia => consistencia" (Es una implicación)
Para averiguar la consistencia basta con despejar un cierto sistema (método):
				 x^(i+1) = H*x + c
De la siguiente forma:
				x^(i+1) - x = H*x + c - x
Ejemplo: planteamos el método:
				x^(i+1) = 3x^i - 2A^-1*b
=				<Restando x a ambos lados>
	         		x^(i+1) - x = 3*x^i - 2A^-1*b - x
=			       < A^-1*b = x; asociatividad; >
				x^(i+1) - x = 3(x^i - x)
Como se supone que en el infinito x^i = x, es claro que esta igualdad se cumple.

	Además, de esta relación también podemos deducir que el método no es convergente, porque para cada iteración, la diferencia entre x(i) y x
	aumenta el triple.
Los métodos que vamos a utilizar se basan en separar la matriz A en dos matrices, M y N tal que:
			A = M - N
			(M-N)x = b
			Mx - Nx = b
			Mx = Nx + b
			x = M^-1* N * x + M^-1b; haciendo H = M^-1 * N, c = M^-1 * b
			x = Hx + c
 

# Primer ejercicio

## Descripción

Usando **Ruby**, crear un algoritmo al cual se le deba ingresar un array de N números, más un número de resultado. Ejemplo:

`numbers = [2, 7, 11, 15], target = 9`

Este algoritmo debe ser capaz de encontrar dos números dentro de un array
que sumados, sean igual al número _target_. Obviamente el algoritmo no puede ser un `for` que vaya sumando todos los números de uno en uno, debe tener mayor inteligencia. El resultado debe indicar la posición del array
de los números que sumados dan el resultado esperado. Ejemplo:

`index1 = 1, index2 = 2`

## Solución

El archivo [`algorithm.rb`](./algorithm.rb) está compuesto de cuatro (4) métodos:

### [`user_input`](./algorithm.rb#L30)

El método `user_input` se encarga de manejar los valores ingresados por el usuario. En primera instancia, tomará una serie de números enteros separados entre sí y se generará un array en base a ellos. Seguidamente, el usuario procederá a ingresar el valor que espera obtener.

### [`reject_invalid_numbers(ary, target)`](./algorithm.rb#L12)

El segundo método, `reject_invalid_numbers(ary, target)` recibe 2 argumentos —en este caso, el array y el valor esperado ingresados por el usuario. Primero, el método descarta (haciendo uso de [`Array#reject`](https://ruby-doc.org/core-2.5.1/Array.html#method-i-reject)) **todos** los valores del array mayores al resultado esperado, pues cualquier suma que incluya dichos números **siempre** será mayor al resultado.

Posterior a ello, el método ejecutará un condicional en base al tamaño del nuevo array

1. Si el array está vacío, el algoritmo retornará un mensaje indicando al usuario que todos los elementos son mayores al valor esperado

2. Si el array contiene un solo elemento, el algoritmo retornará un mensaje indicando al usuario que el array contiene un solo elemento válido

3. Si el array contiene 2 elementos, puede ocurrir lo siguiente:

    3.1. Si la suma de dichos elementos es igual al valor esperado, se le indicará esto al usuario

    3.2. Si la suma de dichos elementos no es equivalente al valor esperado, se le indicará esto al usuario

4. Si el array contiene 3 o más elementos, se procede al siguiente método

### [`calculate_args_for_target(ary, target)`](./algorithm.rb#L7)

Este método determina todas las combinaciones posibles (de a dos valores) entre los elementos que conforman el array que recibe como argumento (haciendo uso de [`Array#combination`](https://ruby-doc.org/core-2.5.1/Array.html#method-i-combination)) y esto retorna un arreglo con múltiples sub-arreglos con las permutaciones posibles

Luego, haciendo uso de [`Array#map`](https://ruby-doc.org/core-2.5.1/Array.html#method-i-map) se procede a obtener la suma de los pares previamente obtenidos haciendo uso de [`Enumerable#reduce`](https://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-reduce) y si este resultado es equivalente al resultado esperado, se procede al siguiente (y último) método

### [`get_indexes(ary, pair, target)`](./algorithm.rb#L1)

Este último método se encarga de determinar la posición (dentro del array original) del par de números que sumados, son equivalentes al resultado esperado. Esta función hace uso del método [`Array#index`](https://ruby-doc.org/core-2.5.1/Array.html#method-i-index)

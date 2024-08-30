¡Por supuesto! A continuación, te proporcionaré una serie de ejercicios básicos sobre variables y colecciones en Apex. Estos ejercicios están diseñados para que los estudiantes comprendan bien los fundamentos, así que empezaremos desde lo más sencillo y poco a poco incrementaremos la dificultad. También incluiré pequeñas explicaciones para cada tipo de ejercicio. 

### **Ejercicios sobre Variables**

1. **Declaración de Variables**
   - **Ejercicio 1**: Declara una variable entera llamada `miEntero` y asígnale el valor 10.
   - **Ejercicio 2**: Declara una variable de tipo cadena llamada `miCadena` y asígnale el valor `"Hola Mundo"`.
   - **Ejercicio 3**: Declara una variable booleana llamada `esVerdadero` y asígnale el valor `true`.
   - **Ejercicio 4**: Declara una variable de tipo `Decimal` llamada `miDecimal` y asígnale el valor `5.75`.
   - **Ejercicio 5**: Ejercicio 5: Declara una variable de tipo fecha llamada miFecha y asígnale la fecha de hoy (Date.today()).
   - **Ejercicio 6**: Ejercicio 6: Declara una variable de tipo fecha y hora llamada miFechaHora y asígnale la fecha y hora actual (Datetime.now()).
   - **Ejercicio 7**: Declara una variable de tipo entero llamada edad y asígnale el valor 25.
   - **Ejercicio 8**: Declara una variable de tipo cadena llamada nombre y asígnale el valor "Ana".
   - **Ejercicio 9**:  Declara una variable de tipo booleano llamada esAdmin y asígnale el valor false.
   - **Ejercicio 10**:  Declara una variable de tipo decimal llamada precio y asígnale el valor 99.99.

2. **Operaciones Básicas con Variables**
   - **Ejercicio 5**: Declara dos variables enteras llamadas `numero1` y `numero2` con valores `5` y `3`, respectivamente. Declara una tercera variable entera llamada `resultado` y asígnale el resultado de la suma de `numero1` y `numero2`.
   - **Ejercicio 6**: Declara una variable de tipo cadena llamada `saludo` con el valor `"Hola"`. Luego, declara otra variable de tipo cadena llamada `nombre` con el valor `"Mundo"`. Declara una tercera variable llamada `mensajeCompleto` y asígnale la concatenación de `saludo` y `nombre`.
   - **Ejercicio 7**: Declara una variable booleana llamada `esMayor` y asígnale el resultado de comparar si `numero1` es mayor que `numero2` (usando las variables del ejercicio 5).

3. **Conversiones de Tipos**
   - **Ejercicio 8**: Declara una variable de tipo `String` llamada `numeroComoCadena` con el valor `"25"`. Luego, convierte ese valor a un entero y almacénalo en una variable llamada `numeroConvertido`.
   - **Ejercicio 9**: Declara una variable de tipo `Decimal` llamada `miDecimal2` con el valor `10.5`. Convierte este valor a un entero y almacénalo en una variable llamada `enteroConvertido`.

### **Ejercicios sobre Colecciones**

1. **Listas (Lists)**
   - **Ejercicio 10**: Declara una lista de enteros llamada `misNumeros` y añádele los valores `1`, `2`, y `3`.
   - **Ejercicio 11**: Declara una lista de cadenas llamada `misPalabras` e inicialízala con los valores `"Hola"`, `"Mundo"`, y `"Apex"`.
   - **Ejercicio 12**: Añade el valor `4` al final de la lista `misNumeros` (declarada en el ejercicio 10).
   - **Ejercicio 13**: Cambia el segundo valor de la lista `misPalabras` (declarada en el ejercicio 11) a `"Developer"`.

2. **Sets (Conjuntos)**
   - **Ejercicio 14**: Declara un conjunto de enteros llamado `miConjunto` y añádele los valores `1`, `2`, `3`.
   - **Ejercicio 15**: Añade el valor `3` a `miConjunto` (declarado en el ejercicio 14). Observa qué sucede (recuerda que los sets no permiten elementos duplicados).
   - **Ejercicio 16**: Elimina el valor `2` de `miConjunto`.

3. **Maps (Diccionarios)**
   - **Ejercicio 17**: Declara un `Map` que asocie enteros con cadenas llamado `miMapa`. Añádele los pares clave-valor `(1, "Uno")`, `(2, "Dos")`, y `(3, "Tres")`.
   - **Ejercicio 18**: Declara un `Map` que asocie cadenas con enteros llamado `mapaAlumnos` e inicialízalo con los valores `("Ana", 20)`, `("Luis", 22)`, `("Sofía", 19)`.
   - **Ejercicio 19**: Añade un nuevo par clave-valor `(4, "Cuatro")` al `miMapa` (declarado en el ejercicio 17).
   - **Ejercicio 20**: Actualiza el valor asociado con la clave `2` en el `miMapa` para que sea `"Dos Actualizado"`.
   - **Ejercicio 21**: Obtén el valor asociado a la clave `"Ana"` en `mapaAlumnos` (del ejercicio 18) y guárdalo en una variable.

4. **Iteración sobre Colecciones**
   - **Ejercicio 22**: Itera sobre la lista `misNumeros` (del ejercicio 10) y muestra cada número en la consola.
   - **Ejercicio 23**: Itera sobre el `miConjunto` (del ejercicio 14) y muestra cada valor en la consola.
   - **Ejercicio 24**: Itera sobre las claves del `miMapa` (del ejercicio 17) y muestra cada clave y su valor correspondiente en la consola.

5. **Ejercicios Combinados**
   - **Ejercicio 25**: Declara una lista de listas de enteros llamada `listaDeListas`. Añádele tres listas: `[1, 2]`, `[3, 4]`, y `[5, 6]`.
   - **Ejercicio 26**: Declara un `Map` que asocie cadenas con listas de enteros llamado `mapaConListas`. Añádele dos entradas: `("Pares", [2, 4, 6])` y `("Impares", [1, 3, 5])`.
   - **Ejercicio 27**: Itera sobre `mapaConListas` y para cada clave, muestra la lista completa asociada a ella.

Estos ejercicios están diseñados para que los estudiantes practiquen ampliamente los fundamentos de las variables y colecciones en Apex. Asegúrate de que comprendan bien cada concepto antes de avanzar al siguiente nivel de complejidad.
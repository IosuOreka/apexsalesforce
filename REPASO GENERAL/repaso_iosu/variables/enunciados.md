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
   - **Ejercicio 11**: Declara dos variables enteras llamadas a y b con valores 15 y 5, respectivamente. Declara una tercera variable entera llamada suma y asígnale el resultado de la suma de a y b.
   - **Ejercicio 12**: Declara dos variables decimales llamadas x y y con valores 12.5 y 3.75, respectivamente. Declara una tercera variable decimal llamada multiplicacion y asígnale el resultado de la multiplicación de x y y.
   - **Ejercicio 13**:  Declara una variable de tipo cadena llamada saludo con el valor "Hola". Luego, declara otra variable de tipo cadena llamada nombre con el valor "Carlos". Declara una tercera variable llamada mensaje y asígnale la concatenación de saludo y nombre.
   - **Ejercicio 14**: Declara una variable entera llamada resultado y asígnale el resultado de la división de a entre b (usando las variables del ejercicio 11).
   - **Ejercicio 15**: Declara una variable booleana llamada esIgual y asígnale el resultado de comparar si a es igual a b.
   - **Ejercicio 16**: Declara una variable entera llamada resta y asígnale el resultado de restar b de a (usando las variables del ejercicio 11).
   - **Ejercicio 17**: Declara una variable de tipo cadena llamada descripcion y asígnale el valor "Producto". Luego, concatena descripcion con el valor de precio (del ejercicio 10) y asígnale el resultado a una nueva variable llamada detalle.
   - **Ejercicio 18**: Declara una variable decimal llamada promedio y asígnale el resultado de dividir la suma de x y y (del ejercicio 12) entre 2.
   - **Ejercicio 19**: Declara una variable booleana llamada esMayorQue y asígnale el resultado de verificar si x es mayor que y (del ejercicio 12).
   - **Ejercicio 20**: Declara una variable de tipo cadena llamada estado y asígnale el valor "Activo". Luego, verifica si estado es igual a "Activo" y almacena el resultado en una variable booleana llamada esActivo.

3. **Conversiones de Tipos**
   - **Ejercicio 21**: Declara una variable de tipo String llamada edadComoTexto con el valor "30". Luego, convierte ese valor a un entero y almacénalo en una variable llamada edadNumerica.`numeroConvertido`.
   - **Ejercicio 22**: Declara una variable de tipo Decimal llamada precioDecimal con el valor 50.99. Convierte este valor a un entero y almacénalo en una variable llamada precioEntero.
   - **Ejercicio 23**: Declara una variable de tipo Integer llamada cantidad con el valor 100. Convierte este valor a una cadena y almacénalo en una variable llamada cantidadTexto.
   - **Ejercicio 24**: Declara una variable de tipo String llamada textoDecimal con el valor "123.45". Convierte este valor a un Decimal y almacénalo en una variable llamada valorDecimal.
   - **Ejercicio 25**: Declara una variable de tipo Boolean llamada esCierto con el valor true. Convierte este valor a una cadena y almacénalo en una variable llamada textoBooleano.
   - **Ejercicio 26**: Declara una variable de tipo String llamada fechaTexto con el valor "2023-08-15". Convierte este valor a un Date y almacénalo en una variable llamada fechaConvertida.
   - **Ejercicio 27**: Declara una variable de tipo Datetime llamada fechaHoraActual con el valor Datetime.now(). Convierte este valor a una cadena y almacénalo en una variable llamada fechaHoraTexto.
   - **Ejercicio 28**: Declara una variable de tipo String llamada nombreCompleto con el valor "Juan Pérez". Extrae el primer nombre (usando substring) y almacénalo en una variable llamada primerNombre.
p

### **Ejercicios sobre Colecciones**

1. **Listas (Lists)**
   - **Ejercicio 29**: Declara una lista de enteros llamada `misNumeros` y añádele los valores `1`, `2`, y `3`.
   - **Ejercicio 30**: Declara una lista de cadenas llamada `misPalabras` e inicialízala con los valores `"Hola"`, `"Mundo"`, y `"Apex"`.
   - **Ejercicio 31**: Añade el valor `4` al final de la lista `misNumeros` (declarada en el ejercicio 29).
   - **Ejercicio 32**: Cambia el segundo valor de la lista `misPalabras` (declarada en el ejercicio 30) a `"Developer"`.
   - **Ejercicio 33**: Declara una lista de String llamada nombres e inicialízala con los valores "Ana", "Luis", y "Carlos". Luego, imprime la lista en la consola.
   - **Ejercicio 34**: Declara una lista de Integer llamada edades e inicialízala con los valores 25, 30, y 35. Usa un bucle for para imprimir cada edad en la consola.
   - **Ejercicio 35**: Declara una lista de Account llamada cuentas. Luego, crea y añade tres cuentas con nombres "Cuenta1", "Cuenta2", y "Cuenta3" a esta lista. Imprime el nombre de cada cuenta en la consola.
   - **Ejercicio 36**: Declara una lista de Double llamada calificaciones e inicialízala con los valores 8.5, 9.0, y 7.5. Calcula y muestra el promedio de las calificaciones en la consola.


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
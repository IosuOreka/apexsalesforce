// Declara una lista de Integer llamada numeros con los valores 10, 20, 30, 40 y 50. Suma todos los números de la lista y muestra el resultado en la consola

List <Integer> numeros = new List<Integer>{10, 20, 30, 40, 50};

Integer suma = 0;

for( Integer numero : numeros){
    suma += numero;
}

System.debug('SUMA TOTAL: ' + suma);
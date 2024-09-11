//Declara una lista de Integer llamada temperaturas con los valores 22, 25, 27, 23, y 20. Calcula y muestra en la consola la temperatura promedio

List <Integer> temperaturas = new List<Integer> {22, 25, 27, 23, 20};

Integer suma = 0;
Integer conteo = 0;
Decimal total = 0.0;

for(Integer temperatura : temperaturas){
    suma += temperatura;
    conteo++;
}

total = suma / conteo;

System.debug('La temperatura media de los ' + conteo + ' días fue de ' + total + 'ºC.');
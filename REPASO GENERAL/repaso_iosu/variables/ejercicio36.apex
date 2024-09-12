//Declara una lista de Double llamada calificaciones e inicialízala con los valores 8.5, 9.0, y 7.5. Calcula y muestra el promedio de las calificaciones en la consola.

List<Double> calificaciones = new List<Double> {8.5, 9.0, 7.5};

Double suma = 0;
Integer asignatura = 0;

for(Double cal : calificaciones){
    suma += cal;
    asignatura += 1;
}

Decimal notaMedia = suma/asignatura;

System.debug('La nota media del curso es ' + notaMedia);
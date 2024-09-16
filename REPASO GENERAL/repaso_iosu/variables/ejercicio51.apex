// Convierte un List de enteros a un Set para eliminar duplicados.

List<Integer> misNumeros = new List<Integer>{1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4}

System.debug('Lista antes de transformar a set: ' + misNumeros);

// Si usamos una lista para alimentar un set NO PONEMOS CORCHETES. Usamos paréntesis.

Set<Integer> misNumerosTransformada = new Set<Integer>(misNumeros);

System.debug('Lista despues de ser transformada a set: ' + misNumerosTransformada);
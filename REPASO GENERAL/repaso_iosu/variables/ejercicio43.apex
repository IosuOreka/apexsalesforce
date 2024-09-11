//  Declara una lista de String llamada frutas e inicialízala con los valores "manzana", "pera", "uva", "plátano" y "mango". Reemplaza el valor "plátano" por "kiwi" e imprime la lista actualizada en la consola.

List <String> frutas = new List<String>{'manzana', 'pera', 'uva', 'plátano', 'mango'};

Integer indexPlatano = frutas.indexOf('plátano');

frutas[indexPlatano] = 'kiwi';

System.debug('Frutas tras modificación: ' + frutas);
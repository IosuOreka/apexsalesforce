// Declara una lista de String llamada nombres e inicialízala con los valores "Ana", "Carlos", "Luis" y "Sofía". Luego, agrega un nuevo nombre "María" a la lista e imprime todos los nombres en la consola, uno por línea.

List<String> nombres = new List<String>{'Ana', 'Carlos', 'Luis', 'Sofía'};

System.debug('Antes: ' + nombres);

nombres.add('María');

System.debug('Después: ' + nombres);
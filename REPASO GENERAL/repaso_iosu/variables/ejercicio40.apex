// Declara una lista de String llamada colores y añádele los valores "rojo", "verde", "azul" y "amarillo".
// Luego, elimina el color "verde" de la lista e imprime la lista actualizada en la consola.

List<String> colores = new List<String>{'rojo', 'verde', 'azul', 'amarillo'};

// Eliminar el segundo elemento (índice 1)
colores.remove(1);

System.debug('La nueva lista de colores: ' + colores);
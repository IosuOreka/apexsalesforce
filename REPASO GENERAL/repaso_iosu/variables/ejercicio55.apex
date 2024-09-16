// Convierte un Set de enteros a un List, ordena la lista y luego conviértela de nuevo a un Set.

Set<Integer> conjuntoNumeros = new Set<Integer>{5, 1, 3, 2, 4};

List<Integer> listaNumeros = new List<Integer>(conjuntoNumeros);
listaNumeros.sort();
System.debug('Lista ordenada: ' + listaNumeros);

Set<Integer> conjuntoNumerosOrdenados = new Set<Integer>(listaNumeros);
System.debug('Nuevo set creado con la lista: ' + conjuntoNumerosOrdenados);
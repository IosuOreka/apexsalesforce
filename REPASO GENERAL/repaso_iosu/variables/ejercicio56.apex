// Encuentra la diferencia entre dos conjuntos (elementos que están en el primer conjunto pero no en el segundo).

Set<Integer> conjuntoA = new Set<Integer>{1, 2, 3, 4};
Set<Integer> conjuntoB = new Set<Integer>{3, 4, 5, 6};

conjuntoA.removeAll(conjuntoB);
System.debug('Diferencia entre conjuntoA y conjuntoB: ' + conjuntoA);
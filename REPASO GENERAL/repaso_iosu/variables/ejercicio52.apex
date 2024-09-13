// Une dos conjuntos Set de enteros.
// Fuente de información para el ejercicio: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_set.htm

Set<Integer> conjuntoA = new Set<Integer>{1, 2, 3};
Set<Integer> conjuntoB = new Set<Integer>{3, 4, 5};

conjuntoA.addAll(conjuntoB);
System.debug('Unión de conjuntoA y conjuntoB: ' + conjuntoA);
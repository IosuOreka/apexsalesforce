// Encuentra la intersección de dos conjuntos de enteros.
// Fuente de información para el ejercicio: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_set.htm
// Concepto retainAll

Set<Integer> conjuntoA = new Set<integer>{1, 2, 3, 4, 5};
Set<Integer> conjuntoB = new Set<integer>{4, 5, 6, 7, 8};

conjuntoA.retainAll(conjuntoB);

System.debug('La intersección del conjunto A y B es: ' + conjuntoA);
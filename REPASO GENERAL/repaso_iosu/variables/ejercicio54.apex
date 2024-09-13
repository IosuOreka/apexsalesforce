// Borra todos los elementos de un conjunto.
// Fuente de información para el ejercicio: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_set.htm
// Concepto clear

Set<Integer> miConjunto = new Set<Integer> {1, 2, 3, 4, 5};
System.debug('Conjunto antes de clear: ' + miConjunto);

miConjunto.clear();

System.debug('Conjunto después de clear: ' + miConjunto);


// Añade el valor `3` a `miConjunto` (declarado en el ejercicio 14). Observa qué sucede (recuerda que los sets no permiten elementos duplicados).

Set<Integer> miConjunto = new Set<Integer>{1, 2, 3};

System.debug('Mi conjunto: '+miConjunto);

miConjunto.add(3);

System.debug('Mi conjunto: '+miConjunto);

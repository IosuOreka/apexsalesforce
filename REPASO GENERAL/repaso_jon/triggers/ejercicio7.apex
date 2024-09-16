### **Ejercicio 7: Prevenir que se elimine una oportunidad cerrada**
Escribe un trigger que no permita eliminar una **Opportunity** que tenga el campo **StageName** igual a "Closed Won" o "Closed Lost".

**Objetivo:**
- Aprender a utilizar el evento `before delete`.
- Aplicar lógica condicional basada en los valores de los campos.

**Pistas:**
- Usa `before delete`.
- Comprueba si el `StageName` es igual a "Closed Won" o "Closed Lost".
- Lanza un error si es así.


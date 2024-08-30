
Desencadenadores de Apex 
Información general sobre desencadenadores de Apex - Parte 1 de 2

Un **trigger** en Salesforce es un bloque de código Apex que se ejecuta automáticamente en respuesta a eventos específicos que ocurren en los registros de Salesforce. Los triggers permiten realizar acciones personalizadas, como realizar validaciones adicionales, actualizar otros registros, o integrarse con sistemas externos cuando se crean, actualizan, eliminan o se consultan registros.

### Paso 1: Conceptos Básicos de los Triggers

- **Eventos**: Los triggers se activan en respuesta a eventos como `before insert`, `before update`, `before delete`, `after insert`, `after update`, `after delete`, `after undelete`.
  - **before**: Se ejecutan antes de que se realicen las operaciones de registro (insert, update, delete) en la base de datos.
  - **after**: Se ejecutan después de que las operaciones de registro se hayan realizado.

- **Contexto de Ejecución**: Salesforce proporciona variables como `Trigger.new`, `Trigger.old`, `Trigger.isInsert`, `Trigger.isUpdate`, etc., para manejar diferentes escenarios dentro de un trigger.

### Paso 2: Crear un Trigger

Supongamos que queremos crear un trigger que se ejecute cuando se crea o actualiza un `Contact` y que valide que el campo `Email` no esté vacío. Si está vacío, se bloqueará la operación.

1. **Accede a Salesforce Developer Console**:
   - Abre la consola de desarrollador desde el menú de configuración (engranaje) en la esquina superior derecha de Salesforce.
   
2. **Crea un nuevo Trigger**:
   - Ve a **File > New > Apex Trigger**.
   - Asigna un nombre al trigger, por ejemplo, `ContactEmailValidation`, y selecciona el objeto `Contact`.

3. **Escribe el Código del Trigger**:
   - Aquí tienes un ejemplo básico de un trigger que valida que el campo `Email` no esté vacío:

```apex
trigger ContactEmailValidation on Contact (before insert, before update) {
    for (Contact c : Trigger.new) {
        if (c.Email == null || c.Email == '') {
            c.addError('El campo Email no puede estar vacío.');
        }
    }
}
```

### Paso 3: Explicación del Código

- **`trigger ContactEmailValidation on Contact (before insert, before update)`**:
  - Esto declara un trigger llamado `ContactEmailValidation` en el objeto `Contact`, que se ejecutará **antes** de que se inserte o actualice un registro de contacto.

- **`for (Contact c : Trigger.new)`**:
  - Este es un bucle que recorre todos los contactos que se están creando o actualizando. `Trigger.new` es una lista de los nuevos registros `Contact` que se están procesando.

- **`if (c.Email == null || c.Email == '')`**:
  - Aquí estamos comprobando si el campo `Email` está vacío o es nulo. Si es así, ejecutamos la siguiente línea.

- **`c.addError('El campo Email no puede estar vacío.');`**:
  - Si la condición es verdadera, añadimos un error personalizado al registro. Esto evita que el registro sea guardado y muestra un mensaje de error al usuario.

### Paso 4: Guardar y Probar el Trigger

1. **Guardar**: Haz clic en `Save` en la consola de desarrollador para guardar tu trigger.
   
2. **Probar**: Intenta crear o actualizar un contacto sin un correo electrónico en Salesforce. Deberías ver el mensaje de error "El campo Email no puede estar vacío." y la operación se debería bloquear.

### Paso 5: Consideraciones Adicionales

- **Orden de Ejecución**: Los triggers se ejecutan en un orden específico en Salesforce, que debes tener en cuenta al diseñar lógica compleja.
  
- **Trigger Recursivo**: Evita que un trigger se dispare repetidamente en bucle (por ejemplo, si actualizas un registro dentro de un trigger `after update`).

- **Buenas Prácticas**:
  - **Evitar Lógica Compleja en Triggers**: Es preferible mover la lógica compleja a clases Apex y llamar a esas clases desde el trigger. Esto mejora la legibilidad y mantenibilidad del código.
  - **Usar el Patrón Handler**: Crear una clase de manejador que se encarga de la lógica del trigger, para separar la lógica del propio trigger y hacer que el código sea más modular.

### Paso 6: Ejemplo Avanzado con Handler

Aquí tienes un ejemplo de cómo estructurar un trigger usando un manejador (handler):

**Trigger:**

```apex
trigger ContactTrigger on Contact (before insert, before update) {
    ContactTriggerHandler.validateEmail(Trigger.new);
}
```

**Handler (Clase Apex):**

```apex
public class ContactTriggerHandler {
    public static void validateEmail(List<Contact> contacts) {
        for (Contact c : contacts) {
            if (c.Email == null || c.Email == '') {
                c.addError('El campo Email no puede estar vacío.');
            }
        }
    }
}
```

Esto hace que el código sea más modular y fácil de mantener.

### Paso 7: Desactivar o Eliminar un Trigger

- **Desactivar**: Puedes desactivar un trigger temporalmente comentando el código o removiéndolo de la organización de Salesforce.
  
- **Eliminar**: Desde el Developer Console, puedes eliminar el trigger si ya no es necesario.

Siguiendo estos pasos, habrás aprendido cómo crear, entender y utilizar triggers en Salesforce. Estos son fundamentales para realizar automatizaciones y validaciones avanzadas dentro de tu organización de Salesforce.

PARTE 2 DE 2

Claro, vamos a desglosar los conceptos de **desencadenadores masivos con DML**, **triggers con DML**, y **SOQL** en Salesforce, explicándolos en detalle.

### 1. Desencadenadores Masivos con DML

En Salesforce, los desencadenadores (triggers) deben manejar eficientemente los datos en masa debido a los límites de gobernanza (governance limits). Los desencadenadores masivos se refieren a cómo los triggers deben ser diseñados para manejar operaciones que afectan a múltiples registros a la vez, como cuando un usuario actualiza un gran número de registros o cuando se realiza una operación en un proceso de carga masiva de datos.

#### Ejemplo de DML en un Trigger:

Supongamos que queremos actualizar el campo `Status__c` de un `CustomObject__c` para todos los registros a la vez. Si realizamos esta operación en un trigger, debemos asegurarnos de manejar todos los registros de forma masiva y eficiente.

**Trigger masivo básico**:
```apex
trigger UpdateCustomObjectStatus on CustomObject__c (before update) {
    List<CustomObject__c> recordsToUpdate = new List<CustomObject__c>();

    for (CustomObject__c obj : Trigger.new) {
        if (obj.SomeField__c == 'Condition') {
            obj.Status__c = 'Updated Status';
            recordsToUpdate.add(obj);
        }
    }

    // DML operation outside of the loop to handle all records at once
    if (!recordsToUpdate.isEmpty()) {
        update recordsToUpdate;
    }
}
```

**Puntos Clave:**
- **Evitar DML Dentro de Bucles**: No realices operaciones DML dentro de un bucle `for`. En su lugar, recopila todos los registros necesarios en una lista y realiza la operación DML fuera del bucle.
- **Uso de Colecciones**: Utiliza listas, conjuntos o mapas para manejar los registros en masa.

### 2. Triggers con DML

Los triggers en Salesforce pueden realizar operaciones DML para insertar, actualizar, eliminar o convertir registros. Debes ser consciente de las mejores prácticas para evitar errores comunes y alcanzar un rendimiento óptimo.

**Ejemplo de Trigger con Operaciones DML**:

Supongamos que deseas crear un `Task` para cada nuevo `Opportunity` insertada. El trigger manejará esto de manera eficiente:

```apex
trigger CreateTaskOnOpportunity on Opportunity (after insert) {
    List<Task> tasksToCreate = new List<Task>();

    for (Opportunity opp : Trigger.new) {
        Task t = new Task(
            Subject = 'Follow up on Opportunity',
            WhatId = opp.Id,
            OwnerId = opp.OwnerId,
            Status = 'Not Started',
            Priority = 'High'
        );
        tasksToCreate.add(t);
    }

    // Insert the tasks in a single DML statement
    if (!tasksToCreate.isEmpty()) {
        insert tasksToCreate;
    }
}
```

**Consideraciones:**
- **DML en Eventos de Trigger**: Usa `before insert`, `before update`, `after insert`, `after update`, etc., dependiendo de cuándo necesitas realizar la operación DML.
- **Manejo de Excepciones**: Asegúrate de manejar excepciones adecuadamente para evitar fallos en la ejecución de DML.

### 3. SOQL (Salesforce Object Query Language)

SOQL es el lenguaje de consulta utilizado en Salesforce para consultar datos en la base de datos. SOQL se utiliza para recuperar datos de Salesforce, similar a cómo se usa SQL en bases de datos relacionales.

**Ejemplo de Consulta SOQL**:
```apex
// Consulta para obtener todos los contactos asociados a una cuenta específica
List<Contact> contacts = [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :someAccountId];
```

**Puntos Clave:**
- **Consultas Selectivas**: Utiliza `WHERE` y otros filtros para limitar los resultados y mejorar el rendimiento.
- **Consultas en Triggers**: Asegúrate de que las consultas SOQL no se realicen dentro de bucles para evitar exceder los límites de SOQL.

**Ejemplo de Uso de SOQL en un Trigger**:
```apex
trigger UpdateAccountWithContactCount on Account (after insert, after update) {
    Set<Id> accountIds = new Set<Id>();

    // Recopila los IDs de las cuentas afectadas
    for (Account acc : Trigger.new) {
        accountIds.add(acc.Id);
    }

    // Consulta para obtener el conteo de contactos por cuenta
    Map<Id, AggregateResult> contactCounts = new Map<Id, AggregateResult>(
        [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId]
    );

    // Actualiza la cuenta con el conteo de contactos
    List<Account> accountsToUpdate = new List<Account>();
    for (Account acc : Trigger.new) {
        if (contactCounts.containsKey(acc.Id)) {
            acc.ContactCount__c = (Integer)contactCounts.get(acc.Id).get('contactCount');
            accountsToUpdate.add(acc);
        }
    }

    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}
```

**Aspectos Importantes:**
- **Consultas SOQL en Triggers**: Asegúrate de realizar las consultas fuera de los bucles para evitar problemas de rendimiento y superar los límites de consultas.
- **Límites de Gobernanza**: Respeta los límites de consultas y DML para evitar errores en la ejecución.

### Resumen

1. **Desencadenadores Masivos con DML**:
   - Maneja registros en masa usando colecciones y realiza operaciones DML fuera de bucles.

2. **Triggers con DML**:
   - Realiza operaciones DML basadas en eventos de trigger y maneja excepciones correctamente.

3. **SOQL**:
   - Utiliza SOQL para consultar datos de Salesforce y evita realizar consultas dentro de bucles.

Estos conceptos te ayudarán a escribir código Apex eficiente y a evitar problemas comunes en Salesforce.
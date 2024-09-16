¡Claro! Te voy a proponer más ejercicios sencillos para que puedas practicar y familiarizarte con la estructura y funcionamiento de los triggers en Salesforce. Estos ejercicios te ayudarán a entender los conceptos básicos, cómo acceder a los datos de los registros, y cómo manipularlos antes o después de las operaciones DML.

---

### **Ejercicio 7: Prevenir que se elimine una oportunidad cerrada**
Escribe un trigger que no permita eliminar una **Opportunity** que tenga el campo **StageName** igual a "Closed Won" o "Closed Lost".

**Objetivo:**
- Aprender a utilizar el evento `before delete`.
- Aplicar lógica condicional basada en los valores de los campos.

**Pistas:**
- Usa `before delete`.
- Comprueba si el `StageName` es igual a "Closed Won" o "Closed Lost".
- Lanza un error si es así.

```apex
trigger PreventOpportunityDeletion on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') {
            opp.addError('No se puede eliminar una oportunidad cerrada.');
        }
    }
}
```

---

### **Ejercicio 8: Establecer el tipo de cuenta automáticamente**
Escribe un trigger que, cuando se inserte una **Account**, si el campo **Industry** está vacío, se le asigne automáticamente el valor "Technology".

**Objetivo:**
- Manipular datos antes de insertar un registro.
- Aplicar lógica simple para establecer valores por defecto.

**Pistas:**
- Usa el evento `before insert`.
- Verifica si el campo `Industry` está vacío.

```apex
trigger SetDefaultIndustryOnAccount on Account (before insert) {
    for (Account acc : Trigger.new) {
        if (String.isBlank(acc.Industry)) {
            acc.Industry = 'Technology';
        }
    }
}
```

---

### **Ejercicio 9: Actualizar automáticamente el campo "Next Step" en Oportunidades**
Escribe un trigger que, al crear o actualizar una **Opportunity**, establezca el campo **NextStep** en "Revisar presupuesto" si el campo **StageName** es "Negotiation/Review".

**Objetivo:**
- Aprender a modificar campos basados en la condición de otro campo.
- Practicar el uso de `before insert` y `before update`.

**Pistas:**
- Usa los eventos `before insert` y `before update`.
- Verifica el valor del campo `StageName`.

```apex
trigger SetNextStepOnOpportunity on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Negotiation/Review') {
            opp.NextStep = 'Revisar presupuesto';
        }
    }
}
```

---

### **Ejercicio 10: Prevenir la creación de contactos sin email**
Escribe un trigger que evite la creación de un **Contact** si no tiene el campo **Email** lleno.

**Objetivo:**
- Aprender a validar campos obligatorios.
- Usar `before insert` para aplicar la validación antes de que se guarde el registro.

**Pistas:**
- Usa `before insert`.
- Usa la función `String.isBlank()` para verificar si el email está vacío.

```apex
trigger PreventContactWithoutEmail on Contact (before insert) {
    for (Contact con : Trigger.new) {
        if (String.isBlank(con.Email)) {
            con.addError('El contacto debe tener un email.');
        }
    }
}
```

---

### **Ejercicio 11: Establecer un valor predeterminado para "Lead Source" en Leads**
Escribe un trigger que, cuando se cree un **Lead**, si el campo **LeadSource** está vacío, se le asigne automáticamente el valor "Web".

**Objetivo:**
- Establecer valores predeterminados durante la inserción de registros.
- Trabajar con el objeto **Lead**.

**Pistas:**
- Usa el evento `before insert`.
- Verifica si el campo `LeadSource` está vacío.

```apex
trigger SetDefaultLeadSource on Lead (before insert) {
    for (Lead lead : Trigger.new) {
        if (String.isBlank(lead.LeadSource)) {
            lead.LeadSource = 'Web';
        }
    }
}
```

---

### **Ejercicio 12: Actualizar el campo "Last Activity Date" de la Cuenta cuando se inserta una tarea**
Escribe un trigger que, cuando se inserte una **Task** asociada a una **Account**, actualice el campo personalizado **Last_Activity_Date__c** de la **Account** con la **ActivityDate** de la tarea.

**Objetivo:**
- Trabajar con el objeto **Task** y actualizar un objeto relacionado (**Account**).
- Aprender a manejar `after insert` para realizar actualizaciones en objetos distintos al que disparó el trigger.

**Pistas:**
- Usa el evento `after insert`.
- Consulta y actualiza las **Accounts** relacionadas con las tareas creadas.

```apex
trigger UpdateLastActivityDateOnTask on Task (after insert) {
    Set<Id> accountIds = new Set<Id>();
    
    // Recoger los Ids de las cuentas relacionadas
    for (Task tsk : Trigger.new) {
        if (tsk.WhatId != null && tsk.WhatId.getSObjectType() == Account.SObjectType) {
            accountIds.add(tsk.WhatId);
        }
    }

    // Consultar las cuentas y actualizar la fecha de última actividad
    List<Account> accountsToUpdate = [SELECT Id, Last_Activity_Date__c FROM Account WHERE Id IN :accountIds];
    
    for (Account acc : accountsToUpdate) {
        for (Task tsk : Trigger.new) {
            if (acc.Id == tsk.WhatId) {
                acc.Last_Activity_Date__c = tsk.ActivityDate;
            }
        }
    }

    update accountsToUpdate;
}
```

---

### **Ejercicio 13: Prevenir la eliminación de contactos principales**
Escribe un trigger que no permita eliminar un **Contact** si el campo personalizado **Primary_Contact__c** está marcado como verdadero.

**Objetivo:**
- Aplicar una validación simple para evitar la eliminación de registros específicos.
- Familiarizarte con el evento `before delete`.

**Pistas:**
- Usa `before delete`.
- Verifica si el campo `Primary_Contact__c` está marcado como `true`.

```apex
trigger PreventPrimaryContactDeletion on Contact (before delete) {
    for (Contact con : Trigger.old) {
        if (con.Primary_Contact__c == true) {
            con.addError('No se puede eliminar un contacto principal.');
        }
    }
}
```

---

### **Ejercicio 14: Incrementar un campo numérico en la Cuenta cuando se inserte un nuevo contacto**
Escribe un trigger que, cuando se inserte un nuevo **Contact**, incremente el campo personalizado **Number_of_Contacts__c** en la **Account** relacionada.

**Objetivo:**
- Modificar un campo numérico basado en la inserción de un registro relacionado.
- Practicar con relaciones entre objetos.

**Pistas:**
- Usa el evento `after insert`.
- Asegúrate de incrementar el valor actual del campo.

```apex
trigger IncrementContactCountOnInsert on Contact (after insert) {
    Set<Id> accountIds = new Set<Id>();
    
    // Recoger los Ids de las cuentas relacionadas
    for (Contact con : Trigger.new) {
        if (con.AccountId != null) {
            accountIds.add(con.AccountId);
        }
    }

    // Consultar las cuentas y actualizar el contador
    List<Account> accountsToUpdate = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN :accountIds];
    
    for (Account acc : accountsToUpdate) {
        acc.Number_of_Contacts__c += 1; // Incrementar el contador
    }

    update accountsToUpdate;
}
```

¡Por supuesto! Vamos a empezar con algunos ejercicios de **Triggers** en Salesforce. Los iremos aumentando en dificultad poco a poco, ¡y al final te daré uno bien complicado para que te exprimas al máximo!

Recuerda que los **Triggers** en Salesforce son trozos de código en Apex que se ejecutan antes o después de ciertas operaciones DML (inserción, actualización, eliminación, etc.) en objetos.

---

### **Nivel 1: Básico**

#### Ejercicio 1: Trigger para prevenir la creación de oportunidades sin nombre
Escribe un trigger que evite la creación de una **Opportunity** si no tiene un **Name**.

**Objetivo:**
- Familiarizarte con los triggers básicos.
- Utilizar `before insert` y manejar la validación de datos.

**Pistas:**
- Usa la operación `before insert`.
- Verifica si el campo `Name` está vacío (puedes usar `String.isBlank()`).

```apex
trigger PreventOpportunityWithoutName on Opportunity (before insert) {
    for (Opportunity opp : Trigger.new) {
        if (String.isBlank(opp.Name)) {
            opp.addError('La oportunidad debe tener un nombre.');
        }
    }
}
```

---

### **Nivel 2: Intermedio**

#### Ejercicio 2: Trigger para actualizar el campo "Close Date" en oportunidades nuevas
Escribe un trigger que automáticamente establezca el campo **Close Date** a 30 días después de la **CreatedDate** cuando se inserte una nueva **Opportunity**.

**Objetivo:**
- Trabajar con fechas y hacer actualizaciones automáticas en un `before insert`.

**Pistas:**
- Usa `before insert` para modificar el campo antes de que se guarde.
- Para sumar 30 días a una fecha, usa el método `addDays()`.

```apex
trigger SetCloseDateOnInsert on Opportunity (before insert) {
    for (Opportunity opp : Trigger.new) {
        if (opp.CloseDate == null) {
            opp.CloseDate = Date.today().addDays(30);
        }
    }
}
```

---

### **Nivel 3: Avanzado**

#### Ejercicio 3: Trigger para sumar el monto total de todas las oportunidades de una cuenta
Escribe un trigger que actualice el campo **Amount** de la **Account** con la suma de los montos de todas sus **Opportunity**.

**Objetivo:**
- Aprender a trabajar con relaciones entre objetos (`Account` y `Opportunity`).
- Usar `after insert` y `after update` para sumar valores en otro objeto.

**Pistas:**
- Debes manejar DML sobre múltiples registros.
- Usa `AggregateResult` para sumar los montos en una sola consulta SOQL.

```apex
trigger UpdateAccountAmountOnOpportunityChange on Opportunity (after insert, after update, after delete) {
    Set<Id> accountIds = new Set<Id>();
    
    // Recoger los Ids de las cuentas relacionadas
    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Opportunity opp : Trigger.new) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
    }
    
    if (Trigger.isDelete) {
        for (Opportunity opp : Trigger.old) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
    }

    // Consultar las sumas de las oportunidades por cuenta
    List<AggregateResult> opportunitySums = [
        SELECT AccountId, SUM(Amount) totalAmount 
        FROM Opportunity 
        WHERE AccountId IN :accountIds 
        GROUP BY AccountId
    ];

    // Actualizar las cuentas con los nuevos valores
    List<Account> accountsToUpdate = new List<Account>();
    for (AggregateResult ar : opportunitySums) {
        Account acc = new Account(Id = (Id)ar.get('AccountId'));
        acc.Amount = (Decimal)ar.get('totalAmount');
        accountsToUpdate.add(acc);
    }

    update accountsToUpdate;
}
```

---

### **Nivel 4: Experto**

#### Ejercicio 4: Trigger para calcular la edad promedio de contactos por cuenta
Escribe un trigger que, cuando se cree o actualice un **Contact**, se actualice la **Account** relacionada con la edad promedio de todos sus contactos.

**Objetivo:**
- Trabajar con objetos relacionados en una operación más compleja.
- Calcular una métrica agregada y actualizar un objeto relacionado.

**Pistas:**
- Usa una consulta agregada (`AVG`) en SOQL para obtener la edad promedio.
- Asegúrate de manejar operaciones `after insert`, `after update`, y `after delete`.

```apex
trigger UpdateAverageAgeOnContact on Contact (after insert, after update, after delete) {
    Set<Id> accountIds = new Set<Id>();

    // Recoger los Ids de las cuentas relacionadas
    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Contact con : Trigger.new) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }
    }

    if (Trigger.isDelete) {
        for (Contact con : Trigger.old) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }
    }

    // Consultar la edad promedio de los contactos por cuenta
    List<AggregateResult> avgAges = [
        SELECT AccountId, AVG(Age__c) avgAge 
        FROM Contact 
        WHERE AccountId IN :accountIds 
        GROUP BY AccountId
    ];

    // Actualizar las cuentas con las nuevas edades promedio
    List<Account> accountsToUpdate = new List<Account>();
    for (AggregateResult ar : avgAges) {
        Account acc = new Account(Id = (Id)ar.get('AccountId'));
        acc.Average_Age__c = (Decimal)ar.get('avgAge');
        accountsToUpdate.add(acc);
    }

    update accountsToUpdate;
}
```

---

### **Nivel 5: Súper Desafío**

#### Ejercicio 5: Trigger para evitar un ciclo de DML infinito
Escribe un trigger que, al actualizar un **Opportunity**, actualice el **Amount** de la cuenta relacionada. Sin embargo, debes evitar que el trigger cause un ciclo de DML infinito, donde las actualizaciones se ejecutan indefinidamente.

**Objetivo:**
- Manejar transacciones DML complejas y evitar ciclos de ejecución.
- Implementar lógica de control para asegurarte de que el trigger no se dispare infinitamente.

**Pistas:**
- Usa una variable estática para evitar que el trigger se dispare más de una vez en la misma transacción.
- Este es uno de los retos más avanzados, ya que estás combinando lógica avanzada de control de flujo y conocimientos de Salesforce.

```apex
public class TriggerHelper {
    public static Boolean isTriggerExecuted = false;
}

trigger PreventInfiniteTriggerLoop on Opportunity (after update) {
    if (TriggerHelper.isTriggerExecuted) {
        return; // Evitar el ciclo infinito
    }
    
    TriggerHelper.isTriggerExecuted = true;
    
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null) {
            accountIds.add(opp.AccountId);
        }
    }
    
    // Actualizar las cuentas con alguna lógica
    List<Account> accountsToUpdate = [SELECT Id, Amount FROM Account WHERE Id IN :accountIds];
    for (Account acc : accountsToUpdate) {
        acc.Amount = acc.Amount + 1000; // Modificar alguna propiedad
    }
    
    update accountsToUpdate;
    
    TriggerHelper.isTriggerExecuted = false; // Restablecer el estado
}
```

---

### **Nivel 6: Maestro Jedi (¡Este es el reto máximo!)**

#### Ejercicio 6: Crear un trigger que evite que dos contactos con el mismo número de teléfono puedan pertenecer a la misma cuenta
Escribe un trigger que, al crear o actualizar un **Contact**, verifique si ya existe otro contacto en la misma **Account** con el mismo **Phone**. Si existe, lanza un error.

**Objetivo:**
- Profundizar en consultas SOQL complejas.
- Manejar lógica de validación personalizada.
- Asegurarte de que no haya colisiones de datos.

**Pistas:**
- Deberás hacer una consulta SOQL dinámica que busque contactos por **AccountId** y **Phone**.
- Implementa un control adecuado de errores para detener la inserción o actualización en caso de que se encuentren duplicados.

```apex
trigger PreventDuplicatePhoneOnAccount on Contact (before insert, before update) {
    Set<String> phoneNumbers = new Set<String>();
    Map<Id, String> accountPhoneMap = new Map<Id, String>();

    for (Contact con : Trigger.new) {
        if (con.Phone != null && con.AccountId != null) {
            phoneNumbers.add(con.Phone);
            accountPhoneMap.put(con.AccountId, con.Phone);
        }
    }

    // Consulta los contactos que ya tienen esos números en esas cuentas
    List<Contact> existingContacts = [
        SELECT Id, AccountId, Phone FROM Contact 
        WHERE AccountId IN :accountPhoneMap.keySet() 
        AND Phone IN :phoneNumbers
    ];

    for (Contact con : existingContacts) {
        for (Contact newCon : Trigger.new) {
            if (newCon.AccountId == con.AccountId && newCon.Phone == con.Phone && newCon.Id != con.Id) {
                newCon.addError('Ya existe otro contacto con el mismo número de

 teléfono en esta cuenta.');
            }
        }
    }
}
```


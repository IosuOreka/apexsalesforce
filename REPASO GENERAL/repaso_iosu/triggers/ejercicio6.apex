/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// scribe un trigger que, cuando se inserte una **Task** asociada a una **Account**, actualice el campo personalizado **Last_Activity_Date__c** 
// de la **Account** 
// con la **ActivityDate** de la tarea.

trigger lastActivity on Task (after insert) {

    Set<Id> accountIds = new Set<Id>();

    for (Task t : Trigger.new) {
        if (t.WhatId != null && String.valueOf(t.WhatId).startsWith('001')) { 
            accountIds.add(t.WhatId);
        }
    }

    if (!accountIds.isEmpty()) {
        List<Account> accountsToUpdate = [SELECT Id, Last_Activity_Date__c FROM Account WHERE Id IN :accountIds];

        // Creamos un mapa para actualizar los valores de Last_Activity_Date__c en las cuentas correctas
        for (Account acc : accountsToUpdate) {
            for (Task t : Trigger.new) {
                if (t.WhatId == acc.Id) {
                    // Actualizamos el campo personalizado con la ActivityDate de la tarea
                    acc.Last_Activity_Date__c = t.ActivityDate;
                }
            }
        }

        // Hacemos el update de las cuentas que han sido modificadas
        update accountsToUpdate;
    }
}

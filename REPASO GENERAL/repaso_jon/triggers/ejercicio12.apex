//Escribe un trigger que, cuando se inserte una **Task** asociada a una **Account**, actualice el campo personalizado **Last_Activity_Date__c** de la **Account** con la **ActivityDate** de la tarea.

trigger ejercicio12 on Task (after insert){
    Set<Id> accIds = new Set<Id>();
    for (Task t : Trigger.new){
        if (t.WhatId != null && String.valueOf(t.WhatId).startsWith('001')){
            accIds.add(t.WhatId);
        }
    }
    List<Account> accs = [SELECT Id, Last_Activity_Date__c FROM Account WHERE Id IN :accIds];
    for (Account a : accs){
        a.Last_Activity_Date__c = System.today();
    }
    update accs;
}
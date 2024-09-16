//Escribe un trigger que automáticamente establezca el campo **Close Date** a 30 días después de la **CreatedDate** cuando se inserte una nueva **Opportunity**.

trigger ejercicio16 on Opportunity (before insert) {
    for (Opportunity opp : Trigger.new) {
        if (opp.CloseDate == null) {
            opp.CloseDate = Date.today().addDays(30);
        }
    }
}
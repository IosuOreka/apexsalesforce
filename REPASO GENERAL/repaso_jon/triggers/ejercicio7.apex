//Escribe un trigger que no permita eliminar una **Opportunity** que tenga el campo **StageName** igual a "Closed Won" o "Closed Lost".

trigger ejercicio7 on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old){
        if (opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
            opp.addError('No puedes eliminar una oportunidad con estado "Closed Won" o "Closed Lost"');
        }
    }
}
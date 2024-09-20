/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Escribe un trigger que no permita eliminar una **Opportunity** que tenga el campo **StageName** igual a "Closed Won" o "Closed Lost".



trigger PreventDeletingOportunity on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') {
            opp.addError('No se puede eliminar una oportunidad cerrada.');
        }
    }
}
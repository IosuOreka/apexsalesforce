/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Escribe un trigger que, al crear o actualizar una **Opportunity**,
//  establezca el campo **NextStep** en "Revisar presupuesto" si el 
//  campo **StageName** es "Negotiation/Review".

trigger NextOportunity on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Negotiation/Review') {
            opp.NextStep = 'Revisar presupuesto';
        }
    }
}
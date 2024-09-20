/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// **Objetivo:**
// - Aplicar una validación simple para evitar la eliminación de registros específicos.
// - Familiarizarte con el evento `before delete`.

// **Pistas:**
// - Usa `before delete`.
// - Verifica si el campo `Primary_Contact__c` está marcado como `true`.


trigger validationBeforeDelete on Account(before delete){
    for(Account acc : Trigger.old){
        if(acc.Primary_Contact__c == true){
            opp.addError('No se puede eliminar el contacto primario.');
        }
    }
}
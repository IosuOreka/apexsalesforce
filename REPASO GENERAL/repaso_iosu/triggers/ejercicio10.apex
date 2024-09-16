/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// **Objetivo:**
// - Familiarizarte con los triggers básicos.
// - Utilizar `before insert` y manejar la validación de datos.

// **Pistas:**
// - Usa la operación `before insert`.
// - Verifica si el campo `Name` está vacío (puedes usar `String.isBlank()`).

trigger AccountNameBlank on Account(before insert){
    for(Account acc : Trigger.new){
        if(Sting.isBlank(acc.Name)){
            acc.addError('Ojo que estás dejando el nombre vacío.')
        }
    }
}
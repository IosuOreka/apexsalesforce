/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Escribe un trigger que, cuando se inserte una **Account**, si el campo **Industry** está vacío, 
// se le asigne automáticamente el valor "Technology".

// - Usa el evento `before insert`.
// - Verifica si el campo `Industry` está vacío.

trigger insertAccount on Account(before insert){
    for(Account acc: Trigger.new){
        if(acc.Industry == null || acc.Industry == ''){
            acc.Industry = 'Technology';
        }
    }
}



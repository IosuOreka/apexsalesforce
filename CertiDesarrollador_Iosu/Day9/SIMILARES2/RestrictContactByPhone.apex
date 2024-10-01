/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger RestrictContactByPhone on Contact (before insert) {
    for(Contact c : Trigger.new){
        if(c.Phone != null && c.Phone.startsWith('000')){
            c.addError('No se permiten números que empiecen en 000');
        }
    }
}
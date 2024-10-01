/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
Trtrigger RestrictContactByEmail on Contact (before insert, before update) {
    for(Contact c : Trigger.new){
        if (c.Email != null && c.Email.endsWith('@invalid.com')) {
            c.AddError('El dominio "' + c.Email + '" no está permitido para DML.');
        }
    }
}
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-19-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

// Usa un controlador estándar para un objeto Account y muestra el nombre de la cuenta y su teléfono.

<apex:page standardController="Account">
    
    <h1>
        Cuenta: {! Account.Name}
    </h1>
    <p>
        Teléfono: {! Account.Phone}
    </p>
</apex:page>
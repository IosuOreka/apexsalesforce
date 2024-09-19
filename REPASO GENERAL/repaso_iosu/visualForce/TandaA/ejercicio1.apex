/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// 1. Mostrar un Campo de Account. ID de prueba: 001WU00000Ix7YNYAZ
// Descripción: Crea una página que muestre el nombre de una cuenta usando el standardController.

<apex:page standardController="Account">
    <h1>Account Details</h1>
    <apex:outputfield value="{! Account.Name}" label="Account Name"/>
</apex:page>
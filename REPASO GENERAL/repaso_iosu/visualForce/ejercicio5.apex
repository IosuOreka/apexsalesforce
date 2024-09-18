/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// 5. Agregar un Enlace de Navegación. Descripción: Añade un enlace en la página para que el usuario pueda navegar a la página de edición de la cuenta.

<apex:page standardController="Account">
    <h1>Account Details</h1>
    
    <apex:form>
        <apex:outputField value="{!Account.Name}" label="Account Name"/>
        <apex:commandLink value="Edit Account" action="{!edit}"/>
    </apex:form>


</apex:page>

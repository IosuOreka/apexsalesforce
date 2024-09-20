/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Cambiar el Estilo de un Campo

// Descripción: Cambia el color del texto del campo de nombre en la página de detalles de la cuenta.

<apex:page standardController="Account">
    <style>
        .accountName {
            color: green;
        }
    </style>
    <h1>DETALLES DE LA CUENTA</h1>
    <apex:outputText value="{!Account.Name}" styleClass="accountName"/>
</apex:page>


// Si le pongo el label no funciona la gestión del estilo del elemento.
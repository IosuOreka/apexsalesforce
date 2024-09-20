/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Mostrar un Mensaje Condicional

// Descripción: Muestra un mensaje si el campo de "AnnualRevenue" de la cuenta es mayor a 1,000,000.

<apex:page standardController="Account">
    
    <style>
    	.ejercicio4__data__body{
        	display: flex;
        	flex-direction: column;
        }
    
    </style>
    
    <h1>Detalles de cuenta</h1>
	<div class="ejercicio4__data__body">
        Nombre de la cuenta: <apex:outputField value ="{! Account.Name}" label="Account Name" />
        Beneficio anual: <apex:outputField value ="{! Account.AnnualRevenue}" label="Annual Revenue" />
        Valoración: <apex:outputText value="High Revenue Account!" rendered="{! Account.AnnualRevenue > 1000}" styleClass="highlight" />
    </div>

</apex:page>
//Crea una página de Visualforce que permita actualizar el campo "Descripción" de una cuenta. Usa un controlador estándar para el objeto Account.

<apex:page standardController="Account">
    <apex:form>
        <apex:inputField value="{!Account.Description}" />
        <apex:commandButton value="Guardar" action="{!save}" />
    </apex:form>
</apex:page>
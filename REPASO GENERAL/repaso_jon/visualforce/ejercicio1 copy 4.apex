//Crea un controlador personalizado que pase una lista de cuentas a una página de Visualforce, y muestra el nombre de cada cuenta en la página.

<apex:page controller="listaDeCuentas">
    <apex:repeat value="{!accounts}" var="acc">
        <p>{!acc.Name}</p>
    </apex:repeat>
</apex:page>

public class listaDeCuentas {
    public List<Account>getAccounts(){
        return [SELECT Name FROM Account];
    }
}
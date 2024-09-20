//Crea una página de Visualforce que muestre un menú desplegable (picklist) con todos los nombres de cuentas. Cuando el usuario seleccione una cuenta, muestra su descripción.
public class desplegableCuentas {
    public List<SelectOption> accountOptions { get; set; }
    public String selectedAccountId { get; set; }
    public String accountDescription { get; set; }

    public desplegableCuentas() {
        accountOptions = new List<SelectOption>();
        List<Account> accounts = [SELECT Id, Name FROM Account];
        for (Account acc : accounts) {
            accountOptions.add(new SelectOption(acc.Id, acc.Name));
        }
    }

    public void fetchAccountDescription() {
        if (selectedAccountId != null) {
            Account acc = [SELECT Description FROM Account WHERE Id = :selectedAccountId LIMIT 1];
            accountDescription = acc.Description;
        } else {
            accountDescription = '';
        }
    }
}


<apex:page controller="desplegableCuentas">
    <apex:form >
        <apex:pageBlock title="Selecciona una Cuenta">
            <apex:pageBlockSection >
                <apex:selectList value="{!selectedAccountId}" size="1">
                    <apex:selectOptions value="{!accountOptions}" />
                    <apex:actionSupport event="onchange" reRender="accountName" action="{!fetchAccountName}" />
                </apex:selectList>
            </apex:pageBlockSection>
            <apex:pageBlockSection title="Descripción de la Cuenta" id="accountName">
                <apex:outputText value="{!accountName}" />
            </apex:pageBlockSection>
        </apex:pageBlock>
    </apex:form>
</apex:page>
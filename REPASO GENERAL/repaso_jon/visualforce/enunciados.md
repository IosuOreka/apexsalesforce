Ejercicio 1: Crear una página básica de Visualforce
Crea una página de Visualforce que simplemente muestre el texto: "¡Hola, Mundo!" en el navegador.

Ejercicio 2: Mostrar un campo de un objeto estándar
Crea una página de Visualforce que muestre el nombre de una cuenta de Salesforce. Usa el objeto estándar Account para ello.

Ejercicio 3: Uso de un formulario con un controlador estándar
Crea una página de Visualforce que permita actualizar el campo "Descripción" de una cuenta. Usa un controlador estándar para el objeto Account.

Ejercicio 4: Uso de controladores personalizados
Crea un controlador personalizado que pase una lista de cuentas a una página de Visualforce, y muestra el nombre de cada cuenta en la página.

Ejercicio 5: Uso de listas de selección (picklists)
Crea una página de Visualforce que muestre un menú desplegable (picklist) con todos los nombres de cuentas. Cuando el usuario seleccione una cuenta, muestra su descripción.

Ejercicio 6: Llamar a un método de controlador desde Visualforce
Crea una página de Visualforce que tenga un botón "Obtener Cuentas". Al hacer clic en el botón, la página debe llamar a un método del controlador personalizado que devuelva una lista de cuentas y las muestre.

Ejercicio 7: Usar apex:repeat para iterar sobre una lista
Crea una página de Visualforce que use apex:repeat para iterar sobre una lista de contactos relacionados a una cuenta. Muestra el nombre y el correo electrónico de cada contacto.

Ejercicio 8: Uso de apex:outputPanel y condicionales
Crea una página de Visualforce que muestre el nombre de una cuenta si tiene más de 5 contactos asociados. Usa el componente apex:outputPanel para manejar la lógica condicional.

Ejercicio 9: Creación de registros mediante Visualforce
Crea una página de Visualforce que permita crear un nuevo registro de Contact (Contacto) relacionado con una cuenta específica. El usuario debe poder ingresar el nombre y el correo del contacto.

Ejercicio 10: Paginación en Visualforce
Crea una página de Visualforce con un controlador personalizado que implemente paginación sobre una lista de cuentas. Muestra solo 10 cuentas por página y proporciona botones "Siguiente" y "Anterior" para navegar.



Respuestas
Ejercicio 1:
<apex:page>
    ¡Hola, Mundo!
</apex:page>
Ejercicio 2:
<apex:page standardController="Account">
    <apex:outputText value="{!Account.Name}" />
</apex:page>
Ejercicio 3:
<apex:page standardController="Account">
    <apex:form>
        <apex:inputField value="{!Account.Description}" />
        <apex:commandButton value="Guardar" action="{!save}" />
    </apex:form>
</apex:page>
Ejercicio 4:
public class AccountController {
    public List<Account> getAccounts() {
        return [SELECT Name FROM Account];
    }
}
<apex:page controller="AccountController">
    <apex:repeat value="{!accounts}" var="acc">
        <p>{!acc.Name}</p>
    </apex:repeat>
</apex:page>
Ejercicio 5:
public class AccountPicklistController {
    public List<SelectOption> getAccountOptions() {
        List<SelectOption> options = new List<SelectOption>();
        for(Account acc : [SELECT Id, Name FROM Account]) {
            options.add(new SelectOption(acc.Id, acc.Name));
        }
        return options;
    }
    
    public String selectedAccountId { get; set; }
    
    public Account getSelectedAccount() {
        if (selectedAccountId != null) {
            return [SELECT Description FROM Account WHERE Id = :selectedAccountId];
        }
        return null;
    }
}
<apex:page controller="AccountPicklistController">
    <apex:form>
        <apex:selectList value="{!selectedAccountId}" size="1">
            <apex:selectOptions value="{!accountOptions}" />
        </apex:selectList>
        <apex:commandButton value="Mostrar Descripción" />
    </apex:form>
    
    <apex:outputText value="{!selectedAccount.Description}" rendered="{!selectedAccount != null}" />
</apex:page>
Ejercicio 6:
public class AccountListController {
    public List<Account> accounts { get; set; }
    
    public AccountListController() {
        accounts = new List<Account>();
    }
    
    public void getAccounts() {
        accounts = [SELECT Name FROM Account];
    }
}
<apex:page controller="AccountListController">
    <apex:form>
        <apex:commandButton value="Obtener Cuentas" action="{!getAccounts}" />
    </apex:form>
    
    <apex:repeat value="{!accounts}" var="acc">
        <p>{!acc.Name}</p>
    </apex:repeat>
</apex:page>
Ejercicio 7:
public class ContactListController {
    public List<Contact> getContacts() {
        return [SELECT Name, Email FROM Contact WHERE AccountId = :ApexPages.currentPage().getParameters().get('id')];
    }
}
<apex:page controller="ContactListController">
    <apex:repeat value="{!contacts}" var="con">
        <p>{!con.Name} - {!con.Email}</p>
    </apex:repeat>
</apex:page>
Ejercicio 8:
public class ContactCountController {
    public Account getAccount() {
        return [SELECT Name, (SELECT Id FROM Contacts) FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }
}
<apex:page controller="ContactCountController">
    <apex:outputPanel rendered="{!account.Contacts.size > 5}">
        <p>La cuenta {!account.Name} tiene más de 5 contactos.</p>
    </apex:outputPanel>
</apex:page>
Ejercicio 9:
public class ContactCreateController {
    public Contact newContact { get; set; }
    
    public ContactCreateController() {
        newContact = new Contact();
    }
    
    public PageReference save() {
        insert newContact;
        return null;
    }
}
<apex:page controller="ContactCreateController">
    <apex:form>
        <apex:inputField value="{!newContact.LastName}" />
        <apex:inputField value="{!newContact.Email}" />
        <apex:commandButton value="Crear Contacto" action="{!save}" />
    </apex:form>
</apex:page>
Ejercicio 10:
public class AccountPaginationController {
    public Integer pageSize { get; set; }
    public Integer pageNumber { get; set; }
    public List<Account> accounts { get; set; }

    public AccountPaginationController() {
        pageSize = 10;
        pageNumber = 1;
        accounts = [SELECT Name FROM Account LIMIT :pageSize OFFSET :((pageNumber - 1) * pageSize)];
    }

    public void nextPage() {
        pageNumber++;
        loadAccounts();
    }

    public void prevPage() {
        if (pageNumber > 1) {
            pageNumber--;
            loadAccounts();
        }
    }

    private void loadAccounts() {
        accounts = [SELECT Name FROM Account LIMIT :pageSize OFFSET :((pageNumber - 1) * pageSize)];
    }
}
<apex:page controller="AccountPaginationController">
    <apex:form>
        <apex:repeat value="{!accounts}" var="acc">
            <p>{!acc.Name}</p>
        </apex:repeat>
        
        <apex:commandButton value="Anterior" action="{!prevPage}" rendered="{!pageNumber > 1}" />
        <apex:commandButton value="Siguiente" action="{!nextPage}" rendered="{!accounts.size == pageSize}" />
    </apex:form>
</apex:page>
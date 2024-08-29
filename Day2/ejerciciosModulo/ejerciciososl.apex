//Primero hay que escribir el contacto y el lead. Uso DML para hacer la inserción.

Contact newContact = new Contact(
    FirstName = 'John',
    LastName = 'Smith',
    Email = 'john.smith@example.com'
);
insert newContact;

Lead newLead = new Lead(
    FirstName = 'Jane',
    LastName = 'Smith',
    Company = 'Smith Co.',
    Email = 'jane.smith@example.com'
);
insert newLead;


//Creo el programa.

public class ContactAndLeadSearch {
    
    public static List<List<sObject>> searchContactsAndLeads(String parameter) {
        String searchQuery = '%' + parameter + '%';

        List<List<sObject>> searchResults = [FIND :parameter 
                                             IN Name Fields
                                             RETURNING Contact(Id, FirstName, LastName), 
                                                       Lead(Id, FirstName, LastName)];
        
        return searchResults;
    }
}

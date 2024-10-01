/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String commonLastName) {
        List<Contact> contacts = new List<Contact>();
        
        for (Integer i = 0; i < numberOfContacts; i++) {
            Contact newContact = new Contact();
            newContact.FirstName = 'Test ' + i;
            newContact.LastName = commonLastName;
            contacts.add(newContact);
        }
        
        return contacts;
    }
}

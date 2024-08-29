public class ContactSearch {
    
    public static List<Contact> searchForContacts(String name, String mailcode) {
        List<Contact> contacts = [SELECT Id, Name 
                                  FROM Contact 
                                  WHERE LastName = :name 
                                  AND MailingPostalCode = :mailcode];
        
        return contacts;
    }
}

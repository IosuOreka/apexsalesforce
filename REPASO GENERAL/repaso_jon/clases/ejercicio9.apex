// Desarrolla una clase `ContactManager` con un método `addContact` que acepte un nombre y un número de teléfono, 
// y los guarde en una lista interna.
//  Implementa otro método `getContactList` que devuelva la lista de contactos


public class ContactManager {

    private List<Contact> contactList = new List<Contact>();

    public void addContact(String nombre, String telefono) {
        Contact newContact = new Contact(Name = nombre, Phone = telefono);
        contactList.add(newContact);
    }

    public List<Contact> getContactList() {
        return contactList;
    }
}



// ContactManager contactManager = new ContactManager();

// contactManager.addContact('ASZ', '945251411');
// contactManager.addContact('Amaia', '945879851');

// List<Contact> contacts = contactManager.getContactList();

// for (Contact c : contacts) {
//     System.debug('Nombre: ' + c.Name + ', Teléfono: ' + c.Phone);
// }

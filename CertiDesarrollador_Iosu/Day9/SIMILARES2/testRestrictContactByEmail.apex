/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class TestRestrictContactByEmail{

    static void testInsertContactWithInvalidEmail() {
        Contact invalidContact = new Contact(FirstName = 'Test', LastName = 'User', Email = 'test@invalid.com');
            
        Test.startTest();
        try {
            insert invalidContact;
            System.assert(false, 'Contact with email "test@invalid.com" should have failed.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Contacts with email domain "@invalid.com" are not allowed.'), 'Expected error message not found.');
        }
        Test.stopTest();
    }
    
    static void testInsertContactWithValidEmail(){
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'User', Email = 'test@valid.com');

        Test.startTest();
        insert validContact;
        System.assertEquals(1, [SELECT COUNT() FROM Contact WHERE Email = 'test@valid.com'], 'Contact with valid email should be inserted.');
        Test.stopTest();
    }

    @isTest
    static void testUpdateContactWithInvalidEmail() {
        Contact contactToUpdate = new Contact(FirstName = 'Update', LastName = 'User', Email = 'valid@example.com');
        insert contactToUpdate;
        
        contactToUpdate.Email = 'test@invalid.com';
        
        Test.startTest();
        try {
            update contactToUpdate;
            System.assert(false, 'Contact update with email "test@invalid.com" should have failed.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Contacts with email domain "@invalid.com" are not allowed.'), 'Expected error message not found on update.');
        }
        Test.stopTest();
    }
}
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class TestRestrictContactByName {
    
    @isTest
    static void testContactWithInvalidName() {
        Contact invalidContact = new Contact(FirstName = 'Test', LastName = 'INVALIDNAME');
    
        Test.startTest();
        try {
            insert invalidContact;
            System.assert(false, 'Contact with LastName "INVALIDNAME" should have failed.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 'Expected error message was not found.');
        }
        Test.stopTest();
    }
    
    @isTest
    static void testContactWithValidName() {
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'VALIDNAME');
        
        Test.startTest();
        insert validContact;
        Test.stopTest();
    
        System.assertEquals(1, [SELECT COUNT() FROM Contact WHERE LastName = 'VALIDNAME'], 'Contact with valid LastName should have been inserted.');
    }

    @isTest
    static void testUpdateContactWithInvalidName() {
        Contact contactToUpdate = new Contact(FirstName = 'UpdateTest', LastName = 'VALIDNAME');
        insert contactToUpdate;
        
        contactToUpdate.LastName = 'INVALIDNAME';
        
        Test.startTest();
        try {
            update contactToUpdate;
            System.assert(false, 'Contact update with LastName "INVALIDNAME" should have failed.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 'Expected error message was not found on update.');
        }
        Test.stopTest();
    }
}

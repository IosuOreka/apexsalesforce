/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class testRestrictContactByPhone{

    @isTest 
    static void isInvalidPhone(){
        Contact invalidContact = new Contact(FirstName = 'Test', LastName = 'User', Email = 'test@gmail.com', Phone= '000123456');

        Test.startTest();
        try {
            insert invalidContact;
            System.assert(false, 'Contact with phone "000123456" should have failed.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Contacts with phones wich start with "000" are not allowed.'),'Expected error message not found.');
        }
        Test.stopTest();
    }

    @isTest 
    static void isValidPhone(){
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'User', Email = 'test@gmail.com', Phone= '020123456');

        Test.startTest();
        insert invalidContact;
        System.assertEquals(1, [SELECT COUNT() FROM Contact WHERE Phone = '020123456'], 'Contact with valid phone should be inserted.');
        Test.stopTest();
    }
}
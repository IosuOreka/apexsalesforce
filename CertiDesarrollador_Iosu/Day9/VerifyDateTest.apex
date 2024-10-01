/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class VerifyDateTest {
    
    @isTest
    static void testDateWithin30Days() {
        Date date1 = Date.newInstance(2024, 11, 1);
        Date date2 = Date.newInstance(2024, 11, 15); 
        Date resultado = VerifyDate.CheckDates(date1, date2);
        
        System.assertEquals(date2, resultado, 'Debería retornar la fecha date2 porque está dentro de los 30 días');
    }

    @isTest
    static void testDateOutside30Days() {
        Date date1 = Date.newInstance(2024, 11, 1);
        Date date2 = Date.newInstance(2024, 12, 15); 
        Date resultado = VerifyDate.CheckDates(date1, date2);
        Date expectedDate = Date.newInstance(2024, 11, 30);

        System.assertEquals(expectedDate, resultado, 'Debería retornar el último día del mes de date1 (30/11/2024)');
    }

    @isTest
    static void testDateInThePast() {
        Date date1 = Date.newInstance(2024, 11, 15);
        Date date2 = Date.newInstance(2024, 10, 30); 
        Date resultado = VerifyDate.CheckDates(date1, date2);
        Date expectedDate = Date.newInstance(2024, 11, 30);

        System.assertEquals(expectedDate, resultado, 'Debería retornar el último día del mes de date1 (30/11/2024) porque date2 es anterior a date1');
    }
}

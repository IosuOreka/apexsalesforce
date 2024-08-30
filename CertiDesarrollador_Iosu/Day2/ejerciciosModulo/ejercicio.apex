public class AccountHandler {
    public static Account insertNewAccount(String AccountName) {
        try {
            Account newacct = new Account(Name = AccountName);
            insert newacct;
            return newacct;
        } catch (DmlException e) {
            System.debug('Error de DML: ' + e.getMessage());
            return null;
        }
    }
}


//Ojo con la regla de validación de accountname si da problemas este ejercicico.




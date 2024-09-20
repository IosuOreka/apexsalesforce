//Crea una página de Visualforce que tenga un botón "Obtener Cuentas". Al hacer clic en el botón, la página debe llamar a un método del controlador personalizado que devuelva una lista de cuentas y las muestre.

public class obtenerCuentas{
    public List<Account> getAccounts(){
        return [SELECT Name FROM Account]
    }
}
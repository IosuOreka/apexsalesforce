// Crea una clase `Account` con propiedades para `AccountName`, `AccountNumber`, y `Balance`.
//  Agrega métodos para `deposit` y `withdraw`, asegurándote de que no se pueda retirar más de lo disponible.

public class BankAccount {

    // Propiedades
    public String AccountName { get; set; }
    public Integer AccountNumber { get; set; }
    public Decimal Balance { get; private set; } // El balance solo se puede modificar internamente

    // Constructor
    public BankAccount(String accountName, Integer accountNumber, Decimal balance) {
        this.AccountName = accountName;
        this.AccountNumber = accountNumber;
        this.Balance = balance;
    }

    // Método para depositar
    public void deposit(Decimal amount) {
        if (amount > 0) {
            Balance += amount;
            System.debug('Depositado: ' + amount + '. Nuevo Balance: ' + Balance);
        } else {
            System.debug('La cantidad a depositar debe ser positiva.');
        }
    }

    // Método para retirar
    public void withdraw(Decimal amount) {
        if (amount > 0) {
            if (Balance >= amount) {
                Balance -= amount;
                System.debug('Retirado: ' + amount + '. Nuevo Balance: ' + Balance);
            } else {
                System.debug('Fondos insuficientes para realizar este retiro.');
            }
        } else {
            System.debug('La cantidad a retirar debe ser positiva.');
        }
    }
}

// Crea una clase `Bank` con propiedades para `BankName`, `BankNumber`, y `Balance`.
//  Agrega métodos para `deposit` y `withdraw`, asegurándote de que no se pueda retirar más de lo disponible.


public class Bank {

    public String BankName { get; set; }
    public String BankNumber { get; set; }
    public Decimal Balance { get; set; }

    public Bank(String BankName, String BankNumber, Decimal Balance) {
        this.BankName = BankName;
        this.BankNumber = BankNumber;
        this.Balance = Balance;
    }

    public void deposit(Decimal amount) {
        Balance += amount;
    }

    public void withdraw(Decimal amount) {
            Balance -= amount;
    }
}
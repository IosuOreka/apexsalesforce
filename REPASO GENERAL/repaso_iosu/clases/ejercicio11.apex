// Crea una clase `Bank` con propiedades para `AccountName`, `AccountNumber`, y `Balance`.
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


//SOLUCIÓN AVANZADA.

// public class Bank {

//     public String AccountName { get; set; }
//     public String AccountNumber { get; set; }
//     private Decimal Balance { get; set; }
//     public Decimal Amount { get; set; }

//     public Bank(Decimal initialAmount, String accountName, String accountNumber) {
//         this.Balance = initialAmount;
//         this.AccountName = accountName;
//         this.AccountNumber = accountNumber;
//     }


//     public void deposit(Decimal depositAmount) {
//         this.Balance += depositAmount;  
//         System.debug('Deposited: ' + depositAmount + '. New balance: ' + this.Balance + ' euros.');
//     }
   
//     public Decimal withdraw(Decimal withdrawalAmount) {
//         if (withdrawalAmount > this.Balance) {
//             System.debug('Insufficient funds. Cannot withdraw ' + withdrawalAmount + ' euros.');
//             return this.Balance;  
//         }
//         this.Balance -= withdrawalAmount;  
//         System.debug('Withdrawn: ' + withdrawalAmount + '. Remaining balance: ' + this.Balance + ' euros.');
//         return this.Balance;  
//     }

//     public Decimal checkBalance() {
//         System.debug('Current balance: ' + this.Balance + ' euros.');
//         return this.Balance;
//     }
// }

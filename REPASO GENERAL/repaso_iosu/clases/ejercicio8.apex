// Crea una clase `Employee` con propiedades para `Name`, `Salary`, y `BonusRate`.
// Agrega un método `calculateBonus` que calcule la bonificación del empleado basada en su salario y la tasa de bonificación.


public class Employee{

    public String Name{get; set;}
    public Integer Salary{get; set;}
    public Decimal BonusRate{get; set;}


    public Employee(String n, Integer s, Decimal b){
        this.Name = n;
        this.Salary = s;
        this.BonusRate = b;
    }

    public Decimal calculateBonus(){

        Decimal result = Salary * BonusRate;

        return result;
    }
}
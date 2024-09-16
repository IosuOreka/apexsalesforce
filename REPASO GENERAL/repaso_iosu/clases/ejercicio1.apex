//Crea una clase Apex llamada `Multiplier` con un método llamado `multiply` que acepte dos números enteros como parámetros y devuelva su producto.

public class Multiplier {
    public Decimal multiply(Integer num1, Integer num2) {
        Decimal result = num1 * num2;
        System.debug('El resultado de la multiplicación es: ' + result);
        return result;
    }
}
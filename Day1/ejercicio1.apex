public class operacionesAritmeticas {

    public static void operaciones(){

        Integer a = 10;
        Integer b = 5;

        Integer sum = a + b;
        Integer resta = a - b;
        Integer multi = a * b;
        Decimal div = (Decimal)a / b;

        System.debug('El resultado de la suma es: ' + sum);
        System.debug('El resultado de la resta es: ' + resta);
        System.debug('El resultado de la multiplicación es: ' + multi);
        System.debug('El resultado de la división es: ' + div);
    }
}
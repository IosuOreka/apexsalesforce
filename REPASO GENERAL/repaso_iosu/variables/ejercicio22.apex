public class ejercicio{
    public static void solucion(){
        Decimal precioDecimal = 50.99;
        Integer precioEntero = precioDecimal.intValue();
        System.debug('El precio final es: ' + precioEntero);
    }
}

// El método intValue nos permite convertir un número decimal en un entero eliminando toda la parte decimal del mismo.
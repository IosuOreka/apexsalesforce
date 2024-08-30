
public class ejercicio24{
    public static void solucion(){
        String textoDecimal = '123.45';
        Decimal valorDecimal = Decimal.valueOf(textoDecimal);
        System.debug(valorDecimal);
    }
}

//Decimal.ValueOf() ME permite convertir a decimal un string.
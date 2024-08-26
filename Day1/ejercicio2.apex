public class Comparador {

    public static void comparadorCantidades() {
        Integer x = 15;
        Integer y = 20;

        Boolean esIgual = (x == y);
        Boolean esMenor = (x < y);
        Boolean esMayor = (x > y);
        Boolean esMenorIgual = (x <= y);
        Boolean esMayorIgual = (x >= y);

        System.debug(x + ' es igual que ' + y + ': ' + esIgual);
        System.debug(x + ' es menor que ' + y + ': ' + esMenor);
        System.debug(x + ' es mayor que ' + y + ': ' + esMayor);
        System.debug(x + ' es menor o igual que ' + y + ': ' + esMenorIgual);
        System.debug(x + ' es mayor o igual que ' + y + ': ' + esMayorIgual);
    }
}

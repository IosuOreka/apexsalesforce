public class ejercicio27 {
    public static void solucion() {
        Datetime fechaHoraActual = Datetime.now();
        String fechaHoraTexto = fechaHoraActual.format();
        System.debug(fechaHoraTexto);
    }
}

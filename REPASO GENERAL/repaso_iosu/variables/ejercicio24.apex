   - **Ejercicio 24**: Itera sobre las claves del `miMapa` (del ejercicio 17) y muestra cada clave y su valor correspondiente en la consola.

   public class ejercicio24{
       public static void solucion(){
           Map<String, Integer> miMapa = new Map<String, Integer>{
               'uno' => 1,
               'dos' => 2,
               'tres' => 3,
               'cuatro' => 4,
               'cinco' => 5
           };
           for(String clave : miMapa.keySet()){
               System.debug('La clave ' + clave + ' tiene un valor de ' + miMapa.get(clave));
           }
       }
   }
//  Declara una lista de Double llamada precios con los valores 15.99, 23.50, 9.99, y 18.75.
//  Luego, añade un nuevo precio 12.30 a la lista, y calcula el total sumando todos los precios. 
//  Imprime el total en la consola.


List <Double> precios = new List<Double> {15.99, 23.50, 9.99, 18.75};

precios.add(12.30);
Decimal total = 0.0;

for(Double precio : precios){
    total += precio;
}

System.debug('El total de los precios sumados es: ' + total);
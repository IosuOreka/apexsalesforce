//Enunciado:** Desarrolla una clase `DataProcessor` con métodos para procesar una lista de enteros. Incluye métodos como `getMax`, `getMin`, y `getAverage` que devuelvan el valor máximo, mínimo y el promedio de la lista, respectivamente.

public class DataProcessor{
    public static Decimal getMax(List<Decimal> numeros){
        Decimal maximo = numeros[0];
        for (Decimal numero : numeros){
            if (numero > maximo){
                maximo = numero;
            }
        }
        System.debug('Máximo: ' + maximo);
        return maximo;
    }

    public static Decimal getMin(List<Decimal> numeros){
        Decimal minimo = numeros[0];
        for (Decimal numero : numeros){
            if (numero < minimo){
                minimo = numero;
            }
        }
        System.debug('Mínimo: ' + minimo);
        return minimo;
    }

    public static Decimal getAverage(List<Decimal> numeros){
        Decimal total = 0;
        for (Decimal numero : numeros){
            total +=numero;
        }
        System.debug('Promedio: ' + total/numeros.size());
        return total/numeros.size();
        
    }
}


//USO
List<Decimal> numeros = new List<Decimal>{1, 2, 3, 4, 5, 6, 7, 8, 9};

Decimal maximo = DataProcessor.getMax(numeros);
Decimal minimo = DataProcessor.getMin(numeros);
Decimal promedio = DataProcessor.getAverage(numeros);
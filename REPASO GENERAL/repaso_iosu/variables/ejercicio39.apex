// Declara una lista de Boolean llamada respuestas con los valores true, false, true, true, y false.
//  Luego, recorre la lista y cuenta cuántas respuestas son true y cuántas son false.
//  Imprime ambos conteos en la consola.

List <Boolean> respuestas = new List<Boolean>{true, false, true, true, false};

Integer positivos = 0;
Integer negativos = 0;

for(Boolean respuesta: respuestas){
    if(respuesta == true){
        positivos++;
    }else{
        negativos++;
    }
}

System.debug('El números de trues es: ' + positivos);
System.debug('El números de falses es: ' + negativos);

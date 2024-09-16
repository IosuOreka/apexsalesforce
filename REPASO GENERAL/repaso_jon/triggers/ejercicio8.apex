//Escribe un trigger que, cuando se inserte una **Account**, si el campo **Industry** está vacío, se le asigne automáticamente el valor "Technology".

trigger ejercicio8 on Account (before insert){
    for (Account acc : Trigger.new){
        if (String.isBlank(acc.Industry)){
            acc.Industry = 'Technology';
        }
    }
}
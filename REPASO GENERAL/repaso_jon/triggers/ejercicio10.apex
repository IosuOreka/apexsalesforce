//Escribe un trigger que evite la creación de un **Contact** si no tiene el campo **Email** lleno.

trigger ejercicio10 on Contact (before insert){
    for (Contact co : Trigger.new){
        if(String.isBlank(co.Email)){
            con.addError('Tiene que tener email.');
        }
    }
}
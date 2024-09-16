//Escribe un trigger que no permita eliminar un **Contact** si el campo personalizado **Primary_Contact__c** está marcado como verdadero.

trigger ejercicio13 on Account (before delete){
    for(Account acc : Trigger.old){
        if (acc.Primary_Contact__c == true){
           acc.addError('Imposible eliminar')
        }
    }
}
//Escribe un trigger que, cuando se cree un **Lead**, si el campo **LeadSource** está vacío, se le asigne automáticamente el valor "Web".

trigger ejercicio11 on Lead(before insert){
    for (Lead led : Trigger.new){
        if (String.isBlank(led.LeadSource)){
            led.LeadSource = 'Web';
        }
    }
}
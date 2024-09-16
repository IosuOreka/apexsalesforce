//Escribe un trigger que evite la creación de una **Opportunity** si no tiene un **Name**.

trigger ejercicio15 on Opportunity(before insert){
    for (Opportunity op : Trigger.new){
        if(String.isBlank(op.Name)){
            op.addError('No se puede')
        }
    }
}
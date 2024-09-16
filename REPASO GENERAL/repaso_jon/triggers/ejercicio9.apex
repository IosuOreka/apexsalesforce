//Escribe un trigger que, al crear o actualizar una **Opportunity**, establezca el campo **NextStep** en "Revisar presupuesto" si el campo **StageName** es "Negotiation/Review".

trigger ejercicio9 on Opportunity(before insert, before update){
    for(Opportunity op : Trigger.new){
        if (op.StageName == 'Negotiation/Review'){
            op.NextStep = 'Revisar presupuesto';
        }
    }
}
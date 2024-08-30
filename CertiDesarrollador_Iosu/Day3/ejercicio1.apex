trigger SetContactDescription on Contact (before insert){
    for(Contact c : Trigger.new){
        c.Description = "Nuevo contacto";
    }
}
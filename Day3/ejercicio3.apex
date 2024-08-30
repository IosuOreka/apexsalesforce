trigger preventRegistryElimination on Opportunity (before delete){
    for(Opportunity o : Trigger.new){
        if(o.StageName = 'Closed Won'){
            o.addError('No se puede eliminar una oportunidad que esté en la etaba "Closed won".');
        }
    }
}
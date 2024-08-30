trigger updateAccountDescription on Account (before update){
    for (Account a : Trigger.new){
        if (a.AnnualRevenue > 1000000){
            a.Description = 'Cuenta prioritaria';
        }
    }
}
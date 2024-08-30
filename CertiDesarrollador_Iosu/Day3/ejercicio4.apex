trigger CopyPhoneFromAccount on Contact (before insert) {
    Set<Id> accountIds = new Set<Id>();
    for (Contact c : Trigger.new) {
        if (c.AccountId != null) {
            accountIds.add(c.AccountId);
        }
    }
    
    Map<Id, Account> accounts = new Map<Id, Account>([SELECT Id, Phone FROM Account WHERE Id IN :accountIds]);
    
    for (Contact c : Trigger.new) {
        if (accounts.containsKey(c.AccountId)) {
            c.Phone = accounts.get(c.AccountId).Phone;
        }
    }
}

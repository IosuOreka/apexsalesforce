trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if (acc.Match_Billing_Address__c) {
            if (Trigger.isUpdate) {
                Account oldAcc = Trigger.oldMap.get(acc.Id);
                if (oldAcc.BillingPostalCode != acc.BillingPostalCode) {
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            } else {
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
}

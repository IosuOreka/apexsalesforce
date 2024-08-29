//Creación de un nuevo registro.

Account acc = new Account(Name = 'Oreka', Phone = '625478951',  Discount_Percent__c = 0);

insert acc;

//Actualizar registros.

Account acc2 = [SELECT id, Phone FROM Account WHERE Name = 'Oreka' LIMIT 1];
acc2.Phone = '252656858';
update acc2;

//Eliminar registros.

Account acc3 = [SELECT id FROM Account WHERE Name = 'Oreka' LIMIT 1];
delete acc3;

//Actualizar registros.

Account acc4 = new Account(Name = 'Oreka2', Phone = '656454747',  Discount_Percent__c = 0);
insert acc4;
Account acc5 = new Account(Name = 'Oreka2', Phone = '555666777',  Discount_Percent__c = 0);
Account acc6 = new Account(Name = 'Oreka3', Phone = '555666777',  Discount_Percent__c = 0);
upsert acc5;
upsert acc6;

//Restaurar registros eliminados.

List<Account> cuentasBorradas = [SELECT Id FROM Account WHERE IsDeleted = TRUE LIMIT 1 ALL ROWS];
undelete cuentasBorradas;

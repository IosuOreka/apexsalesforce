// Declara una lista de Account llamada cuentas. Luego, crea y añade tres cuentas con nombres "Cuenta1", "Cuenta2", y "Cuenta3" a esta lista. Imprime el nombre de cada cuenta en la consola.

List<Account> cuentas = new List<Account>();
cuentas.add(new Account(Name='Cuenta1'));
cuentas.add(new Account(Name='Cuenta2'));
cuentas.add(new Account(Name='Cuenta3'));



for (Account cuenta : cuentas) {
    System.debug(cuenta.Name);
}


System.debug(cuentas);
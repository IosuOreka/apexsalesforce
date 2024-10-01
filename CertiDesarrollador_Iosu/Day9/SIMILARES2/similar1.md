Descripción: Crea un trigger que bloquea la inserción y actualización de cualquier contacto que tenga un correo electrónico que contenga el dominio "invalid.com".

Pasos:
Crea un trigger en el objeto Contact llamado RestrictContactByEmail.
Implementa la lógica para bloquear la operación si el correo electrónico contiene "invalid.com".
Crea una clase de prueba llamada TestRestrictContactByEmail que logre 100% de cobertura.
Ejecuta tu clase de prueba al menos una vez.
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Consulta todos los nombres de las cuentas.

SELECT Name from Account;


// #### Ejercicio 2: Filtrado básico
// Consulta todas las oportunidades que estén en la etapa "Closed Won".

SELECT Name, StageName FROM Opportunity WHERE StageName = 'Closed Won';

// #### Ejercicio 3: Ordenando los resultados
// Consulta todas las cuentas y ordénalas alfabéticamente por nombre.

SELECT Name from Account ORDER BY Name;


// #### Ejercicio 4: Limitar resultados
// Consulta las 5 primeras oportunidades de mayor cantidad (`Amount`).

SELECT Name, Amount FROM Opportunity ORDER BY Amount DESC LIMIT 5;


// #### Ejercicio 5: Condicional con múltiples filtros
// Consulta los contactos cuyo apellido es "Smith" y cuyo email contiene "gmail.com".

SELECT LastName, Email FROM Contact WHERE Lastname = 'Smith' AND Email LIKE '';

// #### Ejercicio 6: Campos null
// Consulta las cuentas que no tienen valor en el campo `Phone`.

SELECT Name FROM Account WHERE Phone = null;


// #### Ejercicio 7: Relación hijo a padre (SOQL anidado)
// Consulta todas las oportunidades junto con el nombre de la cuenta relacionada.

SELECT Name, Account.Name FROM Opportunity


#### Ejercicio 8: Relación padre a hijo (Subconsultas)
Consulta el nombre de todas las cuentas y los nombres de sus contactos.
```sql
SELECT Name, (SELECT FirstName, LastName FROM Contacts) FROM Account
```

#### Ejercicio 9: Agregación de datos (COUNT)
Consulta el número total de oportunidades que están en la etapa "Prospecting".
```sql
SELECT COUNT(Id) FROM Opportunity WHERE StageName = 'Prospecting'
```

#### Ejercicio 10: Uso de funciones agregadas (SUM)
Consulta la suma total de los importes (`Amount`) de las oportunidades ganadas.
```sql
SELECT SUM(Amount) FROM Opportunity WHERE StageName = 'Closed Won'
```

---

### Nivel 4: **El Maestro Jedi** 🌌

#### Ejercicio 11: Agrupación (GROUP BY)
Consulta cuántas oportunidades hay por cada etapa.
```sql
SELECT StageName, COUNT(Id) FROM Opportunity GROUP BY StageName
```

#### Ejercicio 12: Agrupación y agregación combinadas
Consulta la suma del importe (`Amount`) de oportunidades agrupadas por la etapa y ordénalas de mayor a menor.
```sql
SELECT StageName, SUM(Amount) FROM Opportunity GROUP BY StageName ORDER BY SUM(Amount) DESC
```

#### Ejercicio 13: WHERE con fecha relativa
Consulta todas las oportunidades cerradas en los últimos 90 días.
```sql
SELECT Name, CloseDate FROM Opportunity WHERE CloseDate = LAST_N_DAYS:90
```

#### Ejercicio 14: JOIN con relación indirecta
Consulta los casos (Case) junto con el nombre del propietario de la cuenta relacionada.
```sql
SELECT CaseNumber, Account.Owner.Name FROM Case
```

---

### Nivel 5: **El Gran Maestro Jedi** 🌠

#### Ejercicio 15: HAVING con agregación
Consulta las etapas que tienen más de 5 oportunidades.
```sql
SELECT StageName, COUNT(Id) FROM Opportunity GROUP BY StageName HAVING COUNT(Id) > 5
```

#### Ejercicio 16: Subconsultas avanzadas (SOQL anidado)
Consulta las cuentas que tienen más de 3 contactos.
```sql
SELECT Name, (SELECT COUNT(Id) FROM Contacts) FROM Account HAVING (SELECT COUNT(Id) FROM Contacts) > 3
```

#### Ejercicio 17: Subconsulta con filtrado avanzado
Consulta las cuentas con oportunidades cerradas perdidas.
```sql
SELECT Name, (SELECT Name FROM Opportunities WHERE StageName = 'Closed Lost') FROM Account
```

#### Ejercicio 18: Relación cruzada (Cross-object queries)
Consulta los contactos que tienen tareas asociadas en el último mes.
```sql
SELECT FirstName, LastName, (SELECT Subject FROM Tasks WHERE ActivityDate = LAST_MONTH) FROM Contact
```

#### Ejercicio 19: Multi-Join complicado
Consulta las oportunidades que tienen contactos relacionados a través de la cuenta, y muestra los nombres de la cuenta, la oportunidad y los contactos.
```sql
SELECT Account.Name, Name, (SELECT FirstName, LastName FROM Account.Contacts) FROM Opportunity
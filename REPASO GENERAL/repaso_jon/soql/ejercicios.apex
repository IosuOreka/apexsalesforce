### Nivel 1: **El Principiante Padawan** 🌱
 
#### Ejercicio 1: Selección básica
Consulta todos los nombres de las cuentas.
```sql
SELECT Name from Accout;
```
 
#### Ejercicio 2: Filtrado básico
Consulta todas las oportunidades que estén en la etapa "Closed Won".
```sql
SELECT Name from Opportunities WHERE StageName = 'Closed Won';
```
 
#### Ejercicio 3: Ordenando los resultados
Consulta todas las cuentas y ordénalas alfabéticamente por nombre.
```sql
SELECT * from Account ORDER BY Name;
```
 
---
 
### Nivel 2: **El Aprendiz Jedi** ⚔️
 
#### Ejercicio 4: Limitar resultados
Consulta las 5 primeras oportunidades de mayor cantidad (`Amount`).
```sql
SELECT Name, Amount FROM Opportunity ORDER BY Amount DESC LIMIT 5
```
 
#### Ejercicio 5: Condicional con múltiples filtros
Consulta los contactos cuyo apellido es "Smith" y cuyo email contiene "gmail.com".
```sql
SELECT Name, FirstName from Contact WHERE FirstName='Smith' AND Email LIKE 'gmail.com'
```
 
#### Ejercicio 6: Campos null
Consulta las cuentas que no tienen valor en el campo `Phone`.
```sql
SELECT Name from Account WHERE Phone = NULL
```
 
---
 
### Nivel 3: **El Caballero Jedi** 🧙‍♂️
 
#### Ejercicio 7: Relación hijo a padre (SOQL anidado)
Consulta todas las oportunidades junto con el nombre de la cuenta relacionada.
```sql
SELECT Name, AccountId from Opportunity
```
 
#### Ejercicio 8: Relación padre a hijo (Subconsultas)
Consulta el nombre de todas las cuentas y los nombres de sus contactos.
```sql
SELECT Name, (SELECT FirstName, LastName FROM Contacts) from Account 
```
 
#### Ejercicio 9: Agregación de datos (COUNT)
Consulta el número total de oportunidades que están en la etapa "Prospecting".
```sql

```
 
#### Ejercicio 10: Uso de funciones agregadas (SUM)
Consulta la suma total de los importes (`Amount`) de las oportunidades ganadas.
```sql

```
 
---
 
### Nivel 4: **El Maestro Jedi** 🌌
 
#### Ejercicio 11: Agrupación (GROUP BY)
Consulta cuántas oportunidades hay por cada etapa.
```sql

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
```
 
---
 
### Nivel 6: **El Nivel Maestro Jedi Supremo** 🌌👑
 
#### Ejercicio 20: Polimorfismo en consultas (¡nivel experto!)
Consulta todas las tareas y eventos asociados a cualquier objeto `Account` o `Opportunity`.
```sql
SELECT Subject, What.Name FROM Task WHERE WhatId != null AND (WhatId LIKE '001%' OR WhatId LIKE '006%')
```
 
#### Ejercicio 21: Relación polimórfica avanzada
Consulta todos los eventos y tareas asociados a oportunidades y casos, y muestra su título y el nombre de la cuenta asociada.
```sql
SELECT Subject, What.Type, What.Name, What.Account.Name FROM Event WHERE WhatId != null AND (What.Type = 'Opportunity' OR What.Type = 'Case')
```
 
#### Ejercicio 22: Queries compuestas con filtros dinámicos (¡nivel ultra experto!)
Consulta todas las cuentas con al menos 3 oportunidades cerradas ganadas en los últimos 6 meses y muestra el nombre de la cuenta y el importe total de esas oportunidades.
```sql
SELECT Name, (SELECT SUM(Amount) FROM Opportunities WHERE StageName = 'Closed Won' AND CloseDate = LAST_N_MONTHS:6) FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate = LAST_N_MONTHS:6 GROUP BY AccountId HAVING COUNT(Id) >= 3)
```
 
#### Ejercicio 23: Agregaciones con filtros complicados
Consulta todas las oportunidades por etapa y propietario que sumen un importe mayor a 100,000 y agrupa los resultados por nombre del propietario y la etapa.
```sql
SELECT Owner.Name, StageName, SUM(Amount) FROM Opportunity WHERE Amount > 100000 GROUP BY Owner.Name, StageName
```
 
---
 
### Nivel 7: **El Sabio Jedi Místico** 🔥🧙‍♂️
 
#### Ejercicio 24: Consultas de relación recursiva (mira si no explota Salesforce 🤯)
Consulta todos los empleados que reportan directamente o indirectamente al CEO de la organización (es decir, todos los subordinados del CEO usando la relación jerárquica).
```sql
SELECT Id, Name, Manager.Name, Manager.Manager.Name, Manager.Manager.Manager.Name FROM User WHERE ManagerId != null
```
 
#### Ejercicio 25: Consulta monstruosa (solo para verdaderos maestros)
Consulta todas las oportunidades que pertenecen a una cuenta con al menos 3 contactos que tienen tareas asignadas en el último mes, y que además las oportunidades estén en la etapa "Prospecting". Muestra el nombre de la oportunidad, la cuenta y los contactos.
```sql
SELECT Name, Account.Name, (SELECT FirstName, LastName FROM Account.Contacts WHERE Id IN (SELECT WhoId FROM Task WHERE ActivityDate = LAST_MONTH)) FROM Opportunity WHERE StageName = 'Prospecting' AND AccountId IN (SELECT AccountId FROM Contact WHERE Id IN (SELECT WhoId FROM Task WHERE ActivityDate = LAST_MONTH GROUP BY WhoId HAVING COUNT(Id) >= 3))
```
 
---
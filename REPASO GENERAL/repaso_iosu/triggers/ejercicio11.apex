/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// #### Ejercicio 2: Trigger para actualizar el campo "Close Date" en oportunidades nuevas
// Escribe un trigger que automáticamente establezca el campo **Close Date** a 30 días después de la **CreatedDate** cuando se inserte una nueva **Opportunity**.

// **Objetivo:**
// - Trabajar con fechas y hacer actualizaciones automáticas en un `before insert`.

// **Pistas:**
// - Usa `before insert` para modificar el campo antes de que se guarde.
// - Para sumar 30 días a una fecha, usa el método `addDays()`.


trigger updateCloseDate on Opportunity(before insert){
    for(Opportunity opp : Trigger.new){
        if(opp.CloseDate == null){
               opp.CloseDate = System.today().addDays(30);
        }
    }
}
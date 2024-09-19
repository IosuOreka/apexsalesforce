/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-19-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

// Crea un controlador personalizado en Apex que tenga una variable pública llamada mensaje y 
// asígnele un valor por defecto. Muestra el valor de esa variable en la página Visualforce.

public class variableMostrarController {
	
    public String Mensaje{get; set;}
    
    public variableMostrarController(){
        this.Mensaje = '¡A que no sabías que esto tenía tanta miga?';
    }
}


<apex:page controller="variableMostrarController">
    <h1>
        {!Mensaje}
    </h1>
</apex:page>
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-19-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

// Usa una etiqueta <apex:outputText> para mostrar un mensaje dinámico que diga 
// "El día de hoy es: [fecha actual]". Usa la expresión TODAY() para mostrar la fecha actual.

<apex:page >
    
    <header>
    	<h1>
            Ejercicio 2 TANDA B. 
        </h1>
    </header>
    
    <apex:outputText>Este es el día de hoy: <apex:outputText value="{! TODAY()}"/></apex:outputText>
</apex:page>

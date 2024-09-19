/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-19-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

// Crea un formulario que permita ingresar el nombre de un usuario. Al hacer clic en el botón, 
// cambia el mensaje de bienvenida para incluir el nombre ingresado.
//  Usa <apex:inputText> para el campo de entrada.

public class NombreUsuarioController {
    public String nombre { get; set; }
    public String mensaje { get; set; }

    public NombreUsuarioController() {
        nombre = '';
        mensaje = '';
    }

    public void saludar() {
        if (nombre != null) {
            mensaje = '¡Hola, ' + nombre + '! Bienvenido al entrenamiento SALESFORCE.';
        } else {
            mensaje = 'Por favor, ingresa tu nombre.';
        }
    }
}


<apex:page controller="NombreUsuarioController">
   <apex:form>
      <apex:inputText value="{!nombre}" label="Ingresa tu nombre: "/>
      <apex:commandButton value="Saludar" action="{!saludar}"/>
   </apex:form>

   <h1>{!mensaje}</h1>
</apex:page>
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-19-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Crea un formulario que permita seleccionar una opción de un menú desplegable (usando <apex:selectList>). 
// Al hacer clic en el botón, muestra la opción seleccionada.

<apex:page controller="SelectController" >
    <apex:form>
    	<apex:selectList value="{!opcionSeleccionada}" size="1">
            <apex:selectOptions value="{!opciones}"/>
        </apex:selectList>
        <apex:commandButton value="Mostrar Opción" action="{!mostrarOpcion}"/>
    </apex:form>
    
    <h1>
        Has seleccionado: {!mensaje}
    </h1>
</apex:page>


public class SelectController {
	
    public String opcionSeleccionada{get; set;}
    public String mensaje{get; set;}
    
    public List<SelectOption> getOpciones(){
        List<SelectOption> opciones = new List<SelectOption>();
        opciones.add(new SelectOption('opcion1', 'Opción 1'));
        opciones.add(new SelectOption('opcion2', 'Opción 2'));
        opciones.add(new SelectOption('opcion3', 'Opción 3'));
        return opciones;
    }
    
     public void mostrarOpcion() {
        if (opcionSeleccionada != null) {
            mensaje = 'Has seleccionado ' + opcionSeleccionada;
        } else {
            mensaje = 'Por favor, selecciona una opción.';
        }
    }
}
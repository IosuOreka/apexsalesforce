/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-19-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Crea un formulario con varios campos: nombre, email y teléfono. Al hacer clic en un botón,
//  muestra un resumen de los datos ingresados en la misma página.

<apex:page controller="FormularioCompletoController">
    <apex:form>
        <apex:inputText value="{!nombre}" label = "Nombre: "/>
        <br/>
        <apex:inputText value="{!email}" label = "Email: "/>
        <br/>
        <apex:inputText value="{!telefono}" label = "Teléfono: "/>
        <br/>
        <apex:commandButton value="Mostrar Resumen" action="{!mostrarRespuesta}" />
    </apex:form>
    
    <h2>
        {!resumen}
    </h2>
</apex:page>


public class FormularioCompletoController {
	
    public String nombre {get; set;}
    public String email {get; set;}
    public String telefono {get; set;}
    public String resumen {get; set;}
	

    public FormularioCompletoController() {
        nombre = '';
        email = '';
        telefono = '';
        resumen = '';
    }
    
    
     public void mostrarRespuesta() {
        resumen = 'Nombre: ' + nombre + '<br/>Email: ' + email + '<br/>Teléfono: ' + telefono;
    }
}



//VERSION MEJORADA: 

<apex:page controller="FormularioCompletoController">
    <apex:form>
        <apex:pageBlock title="Formulario de Contacto">
            <apex:pageBlockSection title="Detalles del Contacto" columns="2">
                <apex:inputText value="{!contacto.FirstName}" label="Nombre: "/>
                <apex:inputText value="{!contacto.LastName}" label="Apellido: "/>
                <apex:inputText value="{!contacto.Email}" label="Email: "/>
                <apex:inputText value="{!contacto.Phone}" label="Teléfono: "/>
                <apex:inputText value="{!contacto.Title}" label="Título: "/>
                <apex:inputText value="{!contacto.Department}" label="Departamento: "/>
                <apex:inputText value="{!contacto.MailingStreet}" label="Calle: "/>
                <apex:inputText value="{!contacto.MailingCity}" label="Ciudad: "/>
                <apex:inputText value="{!contacto.MailingState}" label="Estado: "/>
                <apex:inputText value="{!contacto.MailingPostalCode}" label="Código Postal: "/>
                <apex:inputText value="{!contacto.MailingCountry}" label="País: "/>
            </apex:pageBlockSection>
            <apex:pageBlockSection>
                <apex:commandButton value="Mostrar Resumen" action="{!mostrarRespuesta}" />
            </apex:pageBlockSection>
        </apex:pageBlock>
    </apex:form>

    <h2>{!resumen}</h2>

    <style>
        .btn-cancelar {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-cancelar:hover {
            background-color: #c9302c;
        }
        .apexPage {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .apexPageBlock {
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            padding: 15px;
        }
        .apexPageBlockSection {
            margin-bottom: 15px;
        }
        .apexPageBlockSection label {
            font-weight: bold;
        }
    </style>
</apex:page>


public class FormularioCompletoController {
    public Contact contacto { get; set; }
    public String resumen { get; set; }

    public FormularioCompletoController() {
        contacto = new Contact();
    }

    public void mostrarRespuesta() {
        resumen = 'Nombre: ' + contacto.FirstName + ' ' + contacto.LastName + '<br/>' +
                  'Email: ' + contacto.Email + '<br/>' +
                  'Teléfono: ' + contacto.Phone + '<br/>' +
                  'Título: ' + contacto.Title + '<br/>' +
                  'Departamento: ' + contacto.Department + '<br/>' +
                  'Calle: ' + contacto.MailingStreet + '<br/>' +
                  'Ciudad: ' + contacto.MailingCity + '<br/>' +
                  'Estado: ' + contacto.MailingState + '<br/>' +
                  'Código Postal: ' + contacto.MailingPostalCode + '<br/>' +
                  'País: ' + contacto.MailingCountry;
    }
}


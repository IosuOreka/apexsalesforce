/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

// 2. Mostrar una Lista de Contacts Relacionados. Descripción: Muestra una lista de contactos relacionados con una cuenta en la página de detalles de la cuenta.


<apex:page standardController="Account">
    
    <style>
        .titulo__ejercicio2 {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-direction: column;
            margin-bottom: 20px;
        }
        
        .content-container {
            margin-top: 15px;
            text-align: center;
        }
        
        .related-list-container {
            margin-top: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
    
    <div class="content-container">
        <h1 class="titulo__ejercicio2">Account and Contacts</h1>
        <apex:outputField value="{! Account.Name}" label="Nombre de la cuenta" />
        
        <div class="related-list-container">
            <apex:relatedList subject="{! Account}" list="Contacts" />
        </div>
    </div>
</apex:page>
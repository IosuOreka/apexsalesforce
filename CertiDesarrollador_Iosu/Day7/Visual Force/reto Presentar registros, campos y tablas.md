Para poder mostrar datos que se representen realizar los siguientes pasos:

1. Crear el componente. 
2. Insertar el código. Yo he puesto este según voy haciendo el tutorial que no el reto: 

<apex:page standardController="Account">
    <!-- Sección de scripts -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            console.log('Buscando el campo AccountName...');
            var accountNameField = document.querySelector("[id$='AccountName']");

            if (accountNameField) {
                console.log('Campo encontrado, aplicando estilo...');
                accountNameField.style.color = "red"; 
            } else {
                console.log('Campo no encontrado, revisar el selector.');
            }
        });
    </script>

    <!-- Cuerpo de la página con campos de la cuenta -->
<apex:pageBlock title="Account Details">
    <apex:pageBlockSection>
        <apex:outputField value="{! Account.Name }"/>
        <apex:outputField value="{! Account.Phone }"/>
        <apex:outputField value="{! Account.Industry }"/>
        <apex:outputField value="{! Account.AnnualRevenue }"/>
    </apex:pageBlockSection>
    
    <apex:pageBlockTable value="{!Account.contacts}" var="contact">
      <apex:column value="{!contact.Name}"/>
      <apex:column value="{!contact.Title}"/>
      <apex:column value="{!contact.Phone}"/>
   </apex:pageBlockTable>
</apex:pageBlock>
</apex:page>


3. Estamos trabajando con Cuentas (Account). Necesitamos un id de una cuenta para probar que funciona. Seleccinamos una cuenta cualquiera y en la url encontraremos algo parecido a esto: 001WU00000Ix7YNYAZ

4. Luego tenemos que construir una url que contendrá: el nombre de nuestra organización + /apex/+ Nombre del componente + ?id= + el número del objeto que estemos trabajando. Tendrá más o menos el siguiente aspecto:

https://brave-koala-sfvy9l-dev-ed--c.trailblaze.vf.force.com/apex/AccountDetail?id=001WU00000Ix7YNYAZ

Nota: Para este ejemplo pongo un id de una cuenta porque estoy trabajando con un componente que se llama AccountDetail.


5. Podrás visualizar el componente con el que estás trabajando.
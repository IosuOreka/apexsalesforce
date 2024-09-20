Create a Visualforce form which inserts a basic Contact record
Using the Visualforce apex:form component, create a page that inserts a Contact record based on First Name, Last Name and Email. After submitting the form, the user should be redirected to the detail page of the new Contact record.

Challenge Requirements
Create a new Visualforce page:
Label: CreateContact
Name: CreateContact
Standard controller: Contact
Your page must use a Visualforce apex:form component
Your page must have three apex:inputField components bound to the following Contact fields:
First Name
Last Name
Email
Your page must have an apex:commandButton component that uses the save method from the standard controller


<apex:page standardController="Contact" recordSetVar="contacts">
    <apex:form>
    	<h1>
            Crear un nuevo contacto.
        </h1>
    	
        <apex:inputField value="{!Contact.FirstName}" label="First Name"/>
        <apex:inputField value="{!Contact.LastName}" label="Last Name"/>
        <apex:inputField value="{!Contact.Email}" label="Email"/>
        <apex:commandButton action="{!save}" value="Save" />
        
    </apex:form>
</apex:page>
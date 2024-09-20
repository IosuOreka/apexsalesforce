Create a Visualforce page that shows a list of Accounts linked to their record pages
Use a standard list controller to display a list of account names that link to their respective record pages.

Challenge Requirements
Create a new Visualforce page:
Label: AccountList
Name: AccountList
Standard controller: Account
Your page must have a recordSetVar attribute equal to accounts
Your page must have a Visualforce apex:repeat component, with the following:
Set the var attribute of the apex:repeat component to a.
Nest a <li> list item HTML element inside the apex:repeat component.
Nest an apex:outputLink component inside the <li> element.
Hint: To link the URL of an account’s record detail page, set the value attribute of the apex:outputLink to /{!a.id}.


<apex:page standardController="Contact" extensions="CreateContactController">
    <apex:form >
        <h1>Create a New Contact</h1>
        
        <apex:inputField value="{!Contact.FirstName}" label="First Name"/>
        <apex:inputField value="{!Contact.LastName}" label="Last Name"/>
        <apex:inputField value="{!Contact.Email}" label="Email"/>
        
        <apex:commandButton action="{!save}" value="Save" />
    </apex:form>
</apex:page>
            
Account list

<apex:page standardController="Account" recordSetVar="accounts">
    <h1>Account List</h1>
    <ul>
        <apex:repeat value="{!accounts}" var="a">
            <li>
                <apex:outputLink value="/{!a.Id}">
                    {!a.Name}
                </apex:outputLink>
            </li>
        </apex:repeat>
    </ul>
</apex:page>
                 

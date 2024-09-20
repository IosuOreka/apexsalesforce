Create a Visualforce page that displays new cases
Create a Visualforce page that uses a custom controller to display a list of cases with the status of New.

Challenge Requirements
Create a new Visualforce page:
Label: NewCaseList
Name: NewCaseList
Create a custom Apex controller:
Name: NewCaseListController
Include a publicly scoped method named getNewCases
Use the return type of List<Case>
Return a list of case records that includes the ID and CaseNumber fields
Filter the results returned to only have a status of New
The NewCaseList Visualforce page must use an apex:repeat component, which is:
Bound to newCases
Refers to the var attribute as case
With the component tags, bind an apex:outputLink component to the ID of the case. This will cause the the page to direct the user to the detail page of the respective case record. 

<apex:page controller="NewCaseListController">
    <h1>Nuevos casos</h1>
    <ul>
        <apex:repeat value="{!newCases}" var="case">
            <li>
                <apex:outputLink value="/{!case.Id}">
                    {!case.CaseNumber}
                </apex:outputLink>
            </li>
        </apex:repeat>
    </ul>
</apex:page>


public class NewCaseListController {
    public List<Case> getNewCases() {
        return [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];
    }
}

Create an Apex class that returns both contacts and leads based on a parameter.
To pass this challenge, create an Apex class that returns both contacts and leads that have first or last name matching the incoming parameter.
The Apex class must be called ContactAndLeadSearch and be in the public scope
The Apex class must have a public static method called searchContactsAndLeads
The method must accept an incoming string as a parameter
The method should then find any contact or lead whose first or last name match the string
The method should finally use a return type of List<List< sObject>>
NOTE: Because SOSL indexes data for searching, you must create a Contact record and Lead record before checking this challenge. Both records must have the last name Smith. 
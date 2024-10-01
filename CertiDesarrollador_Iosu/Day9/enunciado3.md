Create a Contact Test Factory
Create an Apex class that returns a list of contacts based on two incoming parameters: the number of contacts to generate and the last name, which is common to all contacts. Do not insert the generated contact records into the database.

NOTE: For the purposes of verifying this hands-on challenge, don't specify the @isTest annotation for either the class or the method, even though it's usually required.
Create an Apex class in the public scope
Name: RandomContactFactory (without the @isTest annotation)
Use a Public Static Method to consistently generate contacts with unique first names based on the iterated number in the format Test 0, Test 1, and so on
Method Name: generateRandomContacts (without the @isTest annotation)
Parameter 1: An integer that controls the number of contacts being generated with unique first names, such as Test 0 and Test 1
Parameter 2: A string containing the common last name of the contacts
Return Type: List<Contact>
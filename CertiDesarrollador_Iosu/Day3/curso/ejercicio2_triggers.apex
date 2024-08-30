trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    // Create a list to hold the tasks that need to be inserted
    List<Task> tasksToCreate = new List<Task>();

    // Iterate over all the Opportunity records in Trigger.new
    for (Opportunity opp : Trigger.new) {
        // Check if the stage is Closed Won and that the stage has changed
        if (opp.StageName == 'Closed Won' && (Trigger.isInsert || 
            (Trigger.isUpdate && opp.StageName != Trigger.oldMap.get(opp.Id).StageName))) {
            // Create a new Task record
            Task newTask = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id, // Associate the Task with the Opportunity
                OwnerId = opp.OwnerId, // Assign the Task to the Opportunity Owner
                Status = 'Not Started',
                Priority = 'Normal'
            );
            // Add the Task to the list
            tasksToCreate.add(newTask);
        }
    }

    // Insert all the tasks in a single DML operation
    if (!tasksToCreate.isEmpty()) {
        insert tasksToCreate;
    }
}


rutaIosu --> modulo z --> parte 1.2

rutaCertiIosu --> Day1 .. modulo x
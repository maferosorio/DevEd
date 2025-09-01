trigger OrderEventTrigger on Order_Event__e (after insert) {
    
    List<Task> tasks = new List<Task>();
    
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Task to dispatch new team.
            Task task = new Task();
            task.Priority = 'Medium';
            task.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            task.OwnerId = event.CreatedById;
            tasks.add(task);
        }
   }
    // Insert all tasks corresponding to events received.
    insert tasks;
}
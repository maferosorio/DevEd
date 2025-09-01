trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskList = new List<Task>();
    
    for (Opportunity opp : [SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Won' AND Id IN :Trigger.new]) {
        
        Task task = new Task();
        task.Subject = 'Follow Up Test Task';
        task.WhatId = opp.Id;
        taskList.add(task);
    }
    
    if( taskList.size() > 0 ){ insert taskList; }
}
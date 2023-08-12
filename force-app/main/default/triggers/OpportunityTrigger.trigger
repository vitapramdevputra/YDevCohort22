trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {
    if (Trigger.isAfter) {
        if(Trigger.isInsert){
            //call a method to update Number of Opp on account.
            OpportunityTriggerHandler.updateNumberOfOppsInAcc(Trigger.New, Trigger.NewMap);
        }
    }
}
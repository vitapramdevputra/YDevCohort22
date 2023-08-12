trigger StudentTrigger on Student__c (before insert, after insert, before update, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert trigger called');

        system.debug('calling future method after this system debug');
        //when a new student is inserted, set joining as today's date, we want to do that in future method
        //call future method to update joining date
        
        AsyncTraining.updateDateFuture(trigger.newMap.keySet());
        system.debug('FUTURE Method CALLED.');

        
    }
}
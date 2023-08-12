trigger ContactTrigger on Contact (before insert, before update, after insert, after update, after undelete) {

   
    if (Trigger.isBefore && Trigger.isInsert) {
        //call validate contact method
        //ContactTriggerHandler.contactValidation1(Trigger.new);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        // List<contact> allContacts = [select id, name, phone from contact where id in :trigger.new];

        // ContactUpdateQueueable cq = new ContactUpdateQueueable(allContacts);
        // system.enqueueJob(cq);
    }

    system.debug('Trigger.operationType enum: ' + trigger.operationType);
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            system.debug('before insert trigger called');
            ContactTriggerHandler.contactValidation1(Trigger.new);
        }
        when AFTER_INSERT {
            system.debug('after insert trigger called.');
             List<contact> allContacts = [select id, name, phone from contact where id in :trigger.new];

            ContactUpdateQueueable cq = new ContactUpdateQueueable(allContacts);
            system.enqueueJob(cq);
        } 
    }

    if (Trigger.isUndelete) {
        system.debug('undelete contact record.');
        //send email to USER who undeletes the record.
        ContactTriggerHandler.sendEmailOnRestore(Trigger.New, Trigger.NewMap);
    }

    //when contact is inserted/updated, if Title is blank, then update default title as 'Manager'
    //before or after?
        //before
        //why? update (or populate in same record)
    //insert or update? or both?
        //both.
    
    //Can we do it in after?
        //yes. not efficient. but we can if we want to.
    
    // if (Trigger.isAfter) {
    //     //Trigger.new and Trigger.newMap is READONLY in after triggers.
    //         //because record is already saved in database by the time it reaches after trigger
    //     List<contact> updateCts = new list<contact>();
    //     for (Contact newContact : Trigger.new) {
    //         if(string.isblank(newContact.Title)){
    //             Contact c = new contact();
    //             c.id = newContact.Id;
    //             c.title = 'Manager';
    //             updateCts.add(c);
    //         }
    //     }
    //     update updateCts;//it will again fire the trigger. Trigger will again update contacts using line 37.
        
    // }


    

}
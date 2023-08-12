trigger DepartmentTrigger on Department__c (before insert, before update, after insert, after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        //it will check false, so that it executes only ONCE.
        if (DepartmentTriggerHandler.allEmployeeUpdated == false) {
            DepartmentTriggerHandler.allEmployeeUpdated = true;
             //call a method to update all employee's phone.
            DepartmentTriggerHandler.updateEmployeePhone(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
            //call some other method
            //and one more.
        }
       
    }
}
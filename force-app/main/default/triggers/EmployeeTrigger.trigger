trigger EmployeeTrigger on Employee__c (before insert, before update, after insert, after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        //call method to update department's dept phone
        EmployeeTriggerHandler.updateDeptarmentPhone(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
    }
}
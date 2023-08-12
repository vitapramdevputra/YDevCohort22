trigger AccountTrigger2 on Account (before update, after update) {
    // //isAfter will be True when Trigger is executing in After Context
    // if(Trigger.isAfter){
    //     //we want to print below ONLY in after 
    //     system.debug('account AFTER UPDATE trigger called');
    // }
    // //isBefore will be True when Trigger is executing in Before context
    // if(Trigger.isBefore){
    //      //we want to print ONLY in before 
    //     system.debug('account BEFORE UPDATE trigger called.');
    // }
}
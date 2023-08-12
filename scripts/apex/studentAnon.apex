for(student__c eachSt: [select first_name__c, last_name__c, age__c from student__c where standard__c = 10]){
    system.debug(eachSt.first_name__c + ' ' + eachSt.last_name__c);
    system.debug(eachSt.age__c);
}
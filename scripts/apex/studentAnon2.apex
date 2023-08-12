//first name, lastname, gender --> created in last week using for loop

for (Employee__c eachEmp : [select first_name__c, last_name__c, salary__c from employee__c where createddate = last_week ]) {
    system.debug('emp name is ' + eachEmp.First_Name__c + ' ' + eachEmp.Last_Name__c);
    system.debug('emp salary is ' + eachEmp.Salary__c);
}
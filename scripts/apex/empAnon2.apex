SoqlDemo3.soqlExample3();

decimal maxSalary = 1000000;
decimal minSalary = 500000;
List<Employee__c> listEmp = [select first_name__c, last_name__c, joindate__c, department__r.short_code__c, salary__c from employee__c where salary__c < :maxSalary and salary__c > :minSalary];
system.debug(listEmp);





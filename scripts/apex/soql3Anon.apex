SoqlDemo3.aggregateSoql2();

list<string> fn = new list<string>{'first_name__c', 'country__c'};
SoqlDemo3.dynamicSoql1(fn);

list<string> fn2 = new list<string>{'first_name__c', 'country__c', 'last_name__c', 'joindate__c'};
SoqlDemo3.dynamicSoql1(fn2);




list<string> fn3 = new list<string>{'first_name__c', 'country__c'};
SoqlDemo3.dynamicSoql2(fn3, 'Employee__c');

system.debug('----');

list<string> fn4 = new list<string>{'name', 'phone', 'website'};
SoqlDemo3.dynamicSoql2(fn4, 'account');

StudentDSOQL.dsiplayStudentName();


//list<account> listAcc = [select id, name from account];
//soql for loop
string accname = 'salesforce'
for (account acc : [select id, name from account where name = :accname]) {
    
}
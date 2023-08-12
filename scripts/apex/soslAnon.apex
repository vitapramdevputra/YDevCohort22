string searchText = 'yoll or jeff or alex';

List<list<sObject>> allRecords = [find :searchText IN ALL FIELDS returning account(id, name, website), contact(id, name, firstname, lastname)];


//allRecords --> 
    //0 index we have account records, 
    //1 index we have contact records

List<sobject> accRecords = allRecords[0];
for (sObject eachAcc : accRecords) {
    Account actualAcc = (account)eachAcc;
    system.debug(actualAcc.Name);
}

List<sobject> contRecords = allRecords[1];

//list<account> allcs = [select id, name from account where name like 'yo%']
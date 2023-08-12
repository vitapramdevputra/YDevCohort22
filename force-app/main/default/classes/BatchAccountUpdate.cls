public class BatchAccountUpdate implements database.batchable<sObject>, database.stateful {

    //count number of accounts updated
    integer totalRecordsUpdated = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('start method of batch called.');
        //we write SOQL query.
        Database.QueryLocator allRecords = Database.getQueryLocator('Select id, name, rating, industry, Description, active__c from account');
        return allRecords;
    }

    public void execute(Database.BatchableContext bc, List<Account> listAcc){
        system.debug('execute method called.');
        list<account> updateAcc= new list<account>();
        for (Account eachAcc : listAcc) {
            if(eachAcc.active__c == null){
                eachAcc.Description += ' updated via batch --yoll';
                if (eachAcc.rating == null) {
                    eachAcc.rating = 'Warm';
                }
                if (eachAcc.Industry == null) {
                    eachAcc.Industry = 'Agriculture';
                }
                updateAcc.add(eachAcc);
            }
        }
        update updateAcc;
        
        system.debug('listAcc updated : number of records ==> ' + updateAcc.size());
        totalRecordsUpdated += updateAcc.size();
        system.debug('inside execute: total records updated till now: ' + totalRecordsUpdated);
    }

    public void finish(Database.BatchableContext bc){
        system.debug('Batch is completed. Enjoy. Good job.');
        system.debug('inside FINISH: total records updated FINAL RESULTs are.... ' + totalRecordsUpdated);
    }
    
}



/*
System.Iterable<SObject> Database.Batchable<SObject>.start(Database.BatchableContext) 
void Database.Batchable<SObject>.finish(Database.BatchableContext)                    
void Database.Batchable<SObject>.execute(Database.BatchableContext, List<SObject>) 

*/
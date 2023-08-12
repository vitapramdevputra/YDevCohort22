public class BatchAssignment3M13 implements database.batchable<sObject>, database.stateful{
    integer totalRecordsUpdated = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('start method of batch called.');
        Database.QueryLocator allRecords = Database.getQueryLocator('Select id, name, StageName from opportunity where stagename = \'Qualification\' ');
        return allRecords;
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> oppl){
        system.debug('execute method called.');
        list<opportunity> updateopp= new list<opportunity>();
        for (Opportunity eachopp : oppl) {
            if(eachopp.StageName == 'Qualification'){
                eachopp.StageName = 'Need Analysis';
                updateopp.add(eachopp);
            }
        }
        update updateopp;
        system.debug('listAcc updated : number of records ==> ' + updateopp.size());
        totalRecordsUpdated += updateopp.size();
        system.debug('inside execute: total records updated till now: ' + totalRecordsUpdated);
    }
    public void finish(Database.BatchableContext bc){
        system.debug('total records updated FINAL RESULTs are.... ' + totalRecordsUpdated);
    }
}
public  class AccountTriggerHandler2 {

    public static void reassignRelatedOpps(list<account> accTriggerOld, Map<id, account> accTriggerOldMap) {
        //get ID of 'temporary account'
        account tempAcc = [select id from account where name = 'Temporary Account' limit 1];

        //get all opportunities of all deleted accounts
        list<opportunity> allOpps = [select id, accountid from Opportunity where AccountId in :accTriggerOld];
        system.debug('number of opps: ' + allOpps);
        for (Opportunity eachOpp : allOpps) {
            eachOpp.AccountId = tempAcc.Id;
        }
        update allOpps;
    }
}
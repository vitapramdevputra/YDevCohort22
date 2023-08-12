public class OpportunityTriggerHandler {
    //create a method to count opp and update in account
    public static void updateNumberOfOppsInAcc(List<Opportunity> oppTriggerNew, Map<Id, Opportunity> oppTriggerNewMap) {
        //we have to update account records.
            //which account records we have to updated?

        //get all acc ids for which we want to update count of opps
        set<id> accIds = new set<id>();
        for (Opportunity newOp : oppTriggerNew) {
            //check if accountId is NOT NULL
            if (newOp.AccountId != null) {
                accIds.add(newOp.AccountId);//add accountId. (we were adding OPP.id)
            }
        }
        //if accIds is NOT EMPTY then count its opp and update acc
        if (!accIds.isEmpty()) {
            
            //how to get count of opps for each Account.
            //1. account TO opportunities query
            list<account> listAcc = [select id, name,(select id from Opportunities) from account where id in :accIds];
            system.debug('listAcc : ' + listAcc);
            for (Account acc : listAcc) {
                //system.debug('acc.opportunities ' + acc.Opportunities);
                system.debug('acc.opportunities.size() ' + acc.Opportunities.size());
                integer countOpp = acc.Opportunities.size();
                acc.Number_of_opportunities__c = countOpp;
            }
            update listAcc;
            
            //aggregateResult
            
        }
    }
}
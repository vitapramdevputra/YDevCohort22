public class QueueableTraining implements Queueable {
    public void execute(QueueableContext qc){

        //NEVER write SOQL or DML inside any LOOP. 
            //There is always some other way to implement it.

        List<AggregateResult> contactsGroupbyAcc = [select accountid, count(id) from contact where accountid !=null group by AccountId];

        List<account> accountsToUpdate = new list<account>();
        for (AggregateResult eachResult : contactsGroupbyAcc) {
            Account ac = new account();
            ac.id = (id)eachResult.get('accountid');
            ac.numberOfContacts__c =  (decimal)eachResult.get('expr0');
            accountsToUpdate.add(ac);
        }
        update accountsToUpdate;
    }
}
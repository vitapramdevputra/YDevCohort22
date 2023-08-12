@isTest
public class OpportunityTriggerHandlerTest {
   
    //insert opp in test method
        //this will call trigger
            //and trigger will call handler method

    @isTest
    private static void testMethod1() {
        //prepare data
            //whatever related records that our trigger or handler requires, we need to prepare ALL THAT DATA.
        List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
           
        };
        insert newAccounts;

        //create 100 opp for each account record
        List<Opportunity> listOpp = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'new opp test ' + i;
            opp.CloseDate = date.today();
            opp.StageName = 'Prospecting';

            if (i < 100) {
                opp.Accountid = newAccounts[0].id;
            } else if (i < 200){
                opp.Accountid = newAccounts[1].id;
            } else {
                opp.Accountid = newAccounts[2].id;
            }

            listOpp.add(opp);
        }
        //trigger and handler method call
        insert listOpp;


        //assertion.
        //assertion will be to check if all account's number of opportunity count is 100
        list<account> allAccounts = [select id, name, Number_of_opportunities__c from account];
        for (Account eachAcc : allAccounts) {
            //101 because 1 opp created via account insert trigger, and 100 opp created HERE.
            assert.areEqual(101, eachAcc.Number_of_opportunities__c);
        }
    }
}
@isTest
public class BatchAccountUpdateTest {
    @isTest
    public static void testBatch1(){
        //prepare data
        List<account> newAccounts = new list<account>{
                new account(name = 'apple apple',   Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000), 
                new account(name = 'mango mango' ,  Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000),
                new account(name = 'orange orange', Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000)
            };
            //insert newAccounts;

        for(integer i = 0; i < 700; i++){
            newAccounts.add(new account(name = 'pineapple ' + i,   Rating = 'Hot', Industry = 'Energy',  annualRevenue = 17000));
        }
        insert newAccounts;

        //startTest
        Test.startTest();
        //execute batch
        BatchAccountUpdate ba = new BatchAccountUpdate();
        Database.executeBatch(ba, 800);
        //stopTest
        test.stopTest();

        //assertion
        list<account> listAcc = [select id, name, description from account where active__c = NULL];
        for(account eachacc: listAcc){
            assert.isTrue(eachAcc.Description.containsIgnoreCase('yoll'));
        }
    }
}
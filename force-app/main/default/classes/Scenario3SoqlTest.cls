@isTest
public class Scenario3SoqlTest {
    @isTest
    private static void testFetchAccount1() {
        //prepare data
        List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
           
        };
        insert newAccounts;

        list<id> accIds = new list<id>{ newAccounts[0].id, newAccounts[1].id, newAccounts[2].id};

        //call method.
        list<account> returnedAccounts = Scenario3Soql.fetchAccountWithIds(accIds);

        //assertion
        Assert.areEqual(newAccounts.size(), returnedAccounts.size());

        for (Account eachAcc : returnedAccounts) {
            assert.isTrue(accIds.contains(eachAcc.Id));
        }
    }
}
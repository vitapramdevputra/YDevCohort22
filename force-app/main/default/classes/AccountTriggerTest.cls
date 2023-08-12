@isTest
public class AccountTriggerTest {
    @isTest
   private static void testMethod1() {
        //how to test trigger?
            //insert/update/delete records.
            //single and bulk.

        //prepare data
        List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
           
        };

        //dml is the call method step for trigger.
        insert newAccounts;
        //account trigger is executing (for insert)
            // which calls accountTriggerHandler.
                //we are insert opportunity from handler.
                    //which calls opportunity trigger
                        //oppourtunity handler is called.
                            //where we are updating account record.
                                //account trigger is executing again (for update)

       //assert
       //assert that account is inserted successfully.
       list<account> allAccounts = [select id, name from account];
       assert.areEqual(3, allAccounts.size());

   }

   @isTest
   private static void testMethodDel1() {
      //prepare data
        List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
           
        };
        insert newAccounts;
        account tempAcc = new account(name = 'Temporary Account', Rating = 'Hot', Industry = 'Energy');
        insert tempAcc;

        delete newAccounts; //why delete? because we want to test delete account trigger
   }
}
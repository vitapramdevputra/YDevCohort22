@isTest
public  class AccountTriggerHandlerTest {

    @TestSetup
    static void makeData(){
         List<account> newAccounts = new list<account>{
                new account(name = 'apple apple',   Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000), 
                new account(name = 'mango mango' ,  Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000),
                new account(name = 'orange orange', Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000)
            };
            insert newAccounts;
    }

    @isTest
    private static void testAccValidation1_1() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple', Rating = 'Hot', Industry = 'Energy' , annualRevenue = 3000), 
                new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy', annualRevenue = 3000),
                new account(name = 'orange', Rating = 'Hot', Industry = 'Energy', annualRevenue = 3000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Annual revene cannot be less than 5000'));
            //then our handler is doing what it is supposed to do.
        }
        
    }


    @isTest
    private static void testAccValidation1_2() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple',  Industry = 'Energy' , annualRevenue = 7000), 
                new account(name = 'mango' , Industry = 'Energy',  annualRevenue = 7000),
                new account(name = 'orange', Industry = 'Energy',  annualRevenue = 7000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Rating CANNOT be blank'));
            //then our handler is doing what it is supposed to do.
        }
    }

    @isTest
    private static void testAccValidation1_3() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple', Rating = 'Hot',   annualRevenue = 7000), 
                new account(name = 'mango' , Rating = 'Hot',   annualRevenue = 7000),
                new account(name = 'orange', Rating = 'Hot',   annualRevenue = 7000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Industry CANNOT be blank'));
            //then our handler is doing what it is supposed to do.
        }
    }

    @isTest
    public static void testAccValidation2() {
        //first we will create account - already DONE in TEST SEtup. So chill.

        List<account> listAcc = [select id, name from account];
        
        //then update account. Change account Name.
        for (Account eachAcc : listAcc) {
            eachAcc.name += ' v2';
        }
        try {
            update listAcc;
        } catch (Exception ex) {
            assert.isTrue(ex.getMessage().contains('CANNOT change Account name'));
        }
        

        //it will throw error. We will catch it, and assert it.
    }

    @isTest
    private static void testDelValidate1() {
        //get all the accounts which are created in testSetup
        //update status to active
        List<account> listAcc = [select id, name from account];
        
        //then update account. Change account Name.
        for (Account eachAcc : listAcc) {
           eachAcc.Active__c = 'Yes';
        }
        update listAcc;


        List<account> listAcc2 = [select id, name from account];
        try {
            delete listAcc2;
        } catch (Exception ex) {
            assert.isTrue(ex.getMessage().contains('Cannot Delete Active account'));
        }
        


        //delete account. this will throw error. we will catch it, and assert it.
    }

    @isTest
    private static void testUpdatePhone1() {
        //get all accounts.
        List<account> listAcc = [select id, name from account];

        //create 200 contacts for each account
        list<contact> createContacts = new list<contact>();
        for (Integer i = 0; i < 600; i++) {
            //create contat record
            Contact c = new contact(
                FirstName = 'Test', 
                LastName = 'Man', 
                Email = 'test@man.com',
                phone = '7897654621'
            );
            if (i < 200) {
                c.accountid =  listAcc[0].Id;
            } else if(i < 400){
                 c.accountid =  listAcc[1].Id;
            } else {
                 c.accountid =  listAcc[2].Id;
            }
           createContacts.add(c);
        }

            
        insert createContacts;

        //update account phone
        for (Account eachAcc : listAcc) {
            eachAcc.Phone = '777755551';
        }
        update listAcc;
            //it will update all contacts phone field

        //assert that all contacts phone field is same as accounts field

        List<contact> allContacts = [select id, FirstName, phone, accountid from contact where phone != null];
        assert.isTrue(allContacts.size() > 0);
        
        for (Contact eachContact : allContacts) {
            assert.areEqual('777755551', eachContact.Phone);
        }
    }


}
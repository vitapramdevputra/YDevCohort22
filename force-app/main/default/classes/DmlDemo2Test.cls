@isTest
public class DmlDemo2Test {

    //TEST Setup method
        //prepare data. And we use it full test class.

    @TestSetup
    static void makeData(){
        account acc= new account ();
        acc.Name='ABC Corp';
        acc.Industry = 'Energy';
        acc.rating = 'Hot';
        insert acc;
    }

    @isTest
   private static void testDmlASsignment9pt2() {
        //prepare data
            //why prepare data here?
                //because We cannot access ORG's data.
                //why? 
                    //when we move one org to another org, we might not find this data. And our tests will fail.
        account acc = [select id from account limit 1];
        //after insertion, we will GET the ID.

        List<contact> createContacts = new list<contact>{
            new contact(FirstName = 'John', LastName = 'Mayor', phone='65432111', accountid = acc.Id),
            new contact(FirstName = 'Jane', LastName = 'Mayor', phone='65432111',accountid = acc.Id),
            new contact(FirstName = 'Manny', LastName = 'Mayor', phone='65432111',accountid = acc.Id),
            new contact(FirstName = 'Phil', LastName = 'Mayor',phone='65432111', accountid = acc.Id)
        };
        insert createContacts;

        //call method
        DmlDemo2.dmlAssignment9pt2();

        //assertion
        list<contact> allContacts = [select id, name, LastReviewedDate__c from contact where accountid = :acc.id];
        assert.isNotNull(allContacts);
        for (Contact eachContact : allContacts) {
            assert.areEqual(date.newInstance(1990, 01, 01), eachContact.LastReviewedDate__c);
        }
   }


    @isTest
   private static void testDmlASsignment9pt2V2() {
        //prepare data
            //why prepare data here?
                //because We cannot access ORG's data.
                //why? 
                    //when we move one org to another org, we might not find this data. And our tests will fail.
        account acc = [select id from account limit 1];
        //after insertion, we will GET the ID.
        List<contact> createContacts = new list<contact>();

        for (Integer i = 0; i < 1000; i++) {
            Contact c = new contact(FirstName = 'test ', LastName = 'for loop ' + i, phone = '7788445566'+i, AccountId = acc.Id);
            createContacts.add(c);
        }
        insert createContacts;

        //we must prepare data in our test method.
        //and in preparing in data we are consuming limits
        //this will lead to LESS LIMITS available for our actual METHOD.

        //ex: we consumed 2000 DMLs and 3 seconds of CPU TIME TILL HERE.

        Test.startTest();
        //governor limit will reset.
        //we have consume 0 dmls and 0 seconds of CPU time here.
        //call method
        DmlDemo2.dmlAssignment9pt2();
        //we have consume 1000 dmls and 2 seconds of CPU time till here.
        Test.stopTest();


        //ex: how many dmls consumed here? 2000
        //assertion
        list<contact> allContacts = [select id, name, LastReviewedDate__c from contact where accountid = :acc.id];
        assert.isNotNull(allContacts);
        for (Contact eachContact : allContacts) {
            assert.areEqual(date.newInstance(1990, 01, 01), eachContact.LastReviewedDate__c);
        }
   }

   /*
   1. prepare data

   2.0 Test.startTest() --> we can do this ONLY once in each test method.
   2. call method/do any dml etc.
   2.2 Test.stopTest()

   3. assertion
   */
}
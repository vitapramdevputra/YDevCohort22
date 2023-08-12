@isTest
public class DmlDemo1Test {
    @isTest
   private static void testDml1() {
    //call method
    DmlDemo1.dml1(); //in this we are creating one account. Will it create record in the org? No.

    //verify
    //how to verify if data is being created?
    //soql0
    account acc = [select id, name, website from account limit 1];
    //assert if name is Salesforce
    system.assertEquals('Salesforce',acc.name);
    assert.areEqual('Salesforce',acc.name);
   }

   @isTest
   private static void testDml2() {
    //call method
        DmlDemo1.dml2();

    //assert
    list<department__c> d1 = [select name__c, short_code__c, id from department__c];
    system.assert(!d1.isEmpty());
    assert.areEqual('Human Resources', d1[0].name__c);
   }


   @isTest
   private static void testDml5() {
        //step1: prepare data 
            //prepare data, create data which is NEEDED for our method
        //1. create new instance of sobject.
        account acc = new account();

        //2. set field names
        acc.Name = 'Test Account';
        acc.Website = 'salesforce.com';
        acc.Industry = 'Agriculture';
        acc.Rating = 'Warm';
        //dml
        insert acc;

        //step2: call method (or test actual code)
        DmlDemo1.dml5();

        //step3: assertion
        //verify if contact with lastname = biden is created or not
        contact c = [select id, lastname, accountid,phone from contact where lastname = 'Biden' and accountid = :acc.id];
        assert.areEqual(acc.id, c.accountid);
        assert.areEqual('78646213', c.phone);
   }
}
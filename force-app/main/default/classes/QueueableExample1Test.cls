@isTest
public class QueueableExample1Test {
    @isTest
   public static void testQueueable1(){
        //prepare data


        Test.startTest();
        QueueableExample1 qe1 = new QueueableExample1();
        Id jobIdQ = System.enqueueJob(qe1); 
        Test.stopTest();

        //assert
        list<account> listAcc = [select id from account];
        assert.areEqual(3, listAcc.size());
   }
}
@isTest
public class UserUtilityTest {
    @isTest
    private static void testMethod1() {
        //prepare data


        //while writing test for Async Apex
            //then StartTest and StopTest is MANDATORY 
        Test.startTest();
        UserUtility.insertUser('idUr222', 'vitap@yoll.io','identityUserTest@acc44.com', 'IdentityUser Demo1', 'Identity User', 'COO');
        Test.stopTest();

        //assert if user is created or not.
        user u = [select id, lastname from user where alias = 'idUr222'];
        assert.isNotNull(u);

    }
}
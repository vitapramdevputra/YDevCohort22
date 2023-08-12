@isTest
public class Scenario2UpdateTest {
    @isTest
  private static void testUpdateAccRev1() {
    
    //1. prepare data
    account a = new account(name = 'silent cohort 2', rating = 'hot', Industry = 'Energy');
    insert a;

    //2.call method
    Scenario2Update.updateAccRevenue(a.Id, 100000.5);

    //3. assertion
    account a2 = [select id, name, annualrevenue from account where id = :a.Id];
    assert.areEqual(100000.5, a2.AnnualRevenue);
  }
}
public class Scenario2Update {
   public static void updateAccRevenue(Id accId, decimal annualRev) {
     account a = new account();
     a.id = accId;
     a.AnnualRevenue = annualRev;
     update a;
   }
}
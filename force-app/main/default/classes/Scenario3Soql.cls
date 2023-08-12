public class Scenario3Soql {
    public static List<account> fetchAccountWithIds(list<id> accIds) {
        list<account> listAcc = [select id, name, annualrevenue from account where id in :accIds];
        return listAcc;
    }
}
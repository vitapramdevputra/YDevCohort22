public class Scenario1Insert {
    public static void insertAccounts(List<string> accNames) {
        list<account> listAccount = new list<account>();
        for (String eachName : accNames) {
            account ac = new account(name = eachName, Rating = 'Hot', Industry = 'Energy', phone = '987641445');
            listAccount.add(ac);
        }
        insert listAccount;
    }
}
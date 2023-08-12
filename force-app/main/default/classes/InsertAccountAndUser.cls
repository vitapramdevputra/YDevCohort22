public class InsertAccountAndUser {

    //THIS Method will THROW Mixed DML. Look at performAction2 for solution.
    public static void performAction() {
        List<account> newAccounts = new list<account>{
                new account(name = 'apple apple',   Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000) 

            };
            insert newAccounts;

            //first get profile id
            profile p = [select id, name from Profile where name = 'Identity User'];
              //sencond get user role id
            UserRole ur = [select id, name from UserRole where name = 'COO'];

          
            User usr1 = new User(Alias = 'idUser22', email = 'vitap@yoll.io', EmailEncodingKey = 'UTF-8', LastName = 'Identity User Demo1', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', Profileid = p.id, UserRoleId = ur.Id, TimeZoneSidKey = 'America/Los_Angeles', Username = 'identityuser@account22.com');
            insert usr1;

    }


    public static void performAction2(string userName) {
         List<account> newAccounts = new list<account>{
                new account(name = 'apple apple',   Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000) 

            };
            insert newAccounts;
            //insert user via future method
            UserUtility.insertUser('idUser22', 'vitap@yoll.io',userName, 'IdentityUser Demo1', 'Identity User', 'COO');
    }
}
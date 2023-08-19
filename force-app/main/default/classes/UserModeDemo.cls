public with sharing class UserModeDemo {

    public static void createAcc1() {
        Account acc = new account(name = 'test user mode', Website = 'www.user.mode');
        insert as User acc;
    }
    public static void createAcc2() {
        Account acc = new account(name = 'test user mode wo website', Industry = 'Energy', rating = 'Hot');
        insert as User acc;
    }

    public static void createAcc3() {
        Account acc = new account(name = 'test user mode', Website = 'www.user.mode');
        database.SaveResult ds = database.insert(acc, AccessLevel.USER_MODE);
        if (ds.isSuccess()) {
            system.debug('successfully inserted.');
        } else {
            system.debug('error it is');
        }
    }
    public static void createAcc4() {
        Account acc = new account(name = 'test user mode wo website', Industry = 'Energy', rating = 'Hot');
        database.SaveResult ds = database.insert(acc, false, AccessLevel.USER_MODE);
        if (ds.isSuccess()) {
            system.debug('successfully inserted.');
        } else {
            system.debug('error it is');
        }
    }

   public static void sampleAccounts() {
        List<account> allAccounts = [select id, name, website, phone from account WITH SECURITY_ENFORCED];
        system.debug(allAccounts);

   }
   public static void sampleAccounts2() {
        List<account> allAccounts = [select id, name, website, phone from account WITH USER_MODE];
        system.debug(allAccounts);

   }
   public static void sampleAccounts5() {
        string accQuery = 'select id, name, website, phone from account';
        List<SObject> allAcc = Database.query(accQuery, AccessLevel.USER_MODE);
        system.debug(allAcc);
   }
   public static void sampleAccount3() {
        List<account> allAccounts = [select id, name, website, phone from account WITH SYSTEM_MODE];
        system.debug(allAccounts);

   }
   public static void sampleEmployees() {
    List<Employee__c> allEMp = [select id, first_name__c, last_name__c, salary__c, department__c from Employee__c WITH SECURITY_ENFORCED];
        system.debug(allEMp);
   }

}
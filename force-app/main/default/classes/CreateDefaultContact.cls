public with sharing class CreateDefaultContact {
    @invocableMethod
    public static void createContact(List<id> accountIds) {

        List<account> listAccount = [select id, name, rating from account where id in :accountIds];
        
        List<contact> createContacts = new list<contact>();
        for (account eachAcc : listAccount) {
            contact c = new contact();
            c.FirstName = eachAcc.Rating;
            c.LastName = eachAcc.Name;
            c.accountId = eachAcc.Id;
            c.Phone = '98765431';
            createContacts.add(c);
        }
        insert createContacts;
    }
}
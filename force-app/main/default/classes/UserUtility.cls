public with sharing class UserUtility {
    @future
    public static void insertUser(String aliasName, String userEmail, String uName, String lName, String profileName, String roleName){
        Profile p = [SELECT Id FROM Profile WHERE Name = :profileName];
        UserRole r = [SELECT Id FROM UserRole WHERE Name= :roleName];

        //create user
        User u = new User(alias = aliasName, email=userEmail, emailencodingkey='UTF-8', lastname= lName, languagelocalekey='en_US', localesidkey='en_Us', profileid = p.Id, userroleid = r.Id,
        timezonesidkey='America/Los_Angeles', username= uName);

        INSERT u;
    }
}
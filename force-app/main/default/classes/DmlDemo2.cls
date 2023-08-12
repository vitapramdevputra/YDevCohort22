public class DmlDemo2 {
    public static void dmlAssignment4() {
        Classroom__c c6 = [select id, Standard__c from Classroom__c where Standard__c = 6 limit 1];

        Student__c s1 = new Student__c();
        s1.First_Name__c = 'Joe';
        s1.Last_Name__c = 'Bardin';
        s1.Age__c = 11;
        s1.Classroom__c = c6.id; //do you all get this?
        insert s1;
        system.debug('new student id is ' + s1.Id);
    }

    public static void dmlUpdate1() {
        account acc = new account();
        acc.Name = 'Salesforce';
        acc.Website = 'salesforce.com';
        insert acc;

        //set diffent values for some of the fields
        acc.name = 'Yoll';
        acc.Website = 'yoll.io';
        //dml to update
        update acc;

    }

    public static void dmlUpdate2(){
        //update acc record which is present in the org.
        account acc = [select id, name, website, active__c from account order by createddate desc limit 1];

        system.debug('before update dml: ' + acc);
        acc.name = 'Timex';
        acc.Website = 'timex.com';
        update acc;
        system.debug('after update dml: ' + acc);
    }

    //Don't do this at home or anywhere else also. 
    public static void dmlInsertMultipleWrong() {
        for (Integer i = 0; i < 75; i++) {
            account a = new account();
            a.Name = 'new acc ' + i;
            //never write DML inside loop
            insert a;
        }
    }
    public static void dmlInsertMultipleRight() {
        List<account> listAcc = new list<account>();

        for (Integer i = 0; i < 155; i++) {
            account a = new account();
            a.Name = 'new acc ' + i;
            listAcc.add(a);
        }
        insert listAcc;
    }

    //update account active field to No if it is null
    public static void dmlUpdateBulk1() {
        //maximum records we can fetch using SOQL is 50k. 
        list<account> listAcc = [select id, name, active__c from account]; //185
        list<account> updateAcc = new list<account>();
        
        for (account eachAcc : listAcc) {
            //150
            if (eachAcc.Active__c == 'No') {
                eachAcc.Active__c = '';
                updateAcc.add(eachAcc);
            }
        }

        update updateAcc;//we updated all 150 records
        system.debug(listAcc.size());
    }

    public static void dmlAssignment9() {
        account acc= new account ();
        acc.Name='ABC Corp';
        insert acc;
        //after insertion, we will GET the ID.

        List<contact> createContacts = new list<contact>{
            new contact(FirstName = 'John', LastName = 'Mayor', accountid = acc.Id),
            new contact(FirstName = 'Jane', LastName = 'Mayor', accountid = acc.Id),
            new contact(FirstName = 'Manny', LastName = 'Mayor', accountid = acc.Id),
            new contact(FirstName = 'Phil', LastName = 'Mayor', accountid = acc.Id)
        };
        insert createContacts;
        
    }
    public static void dmlAssignment9pt2() {
        list<contact> allContacts = [select id, firstname, birthdate from contact where account.name = 'ABC Corp'];
        for (contact eachContact : allContacts) {
            eachContact.LastReviewedDate__c = date.newInstance(1990, 01, 01);
        }
        update allContacts;
    }

}
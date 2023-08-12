public class AsyncTraining {
   
    //future method must have @future annotation.
    //method MUST be static.
    //method MUST NOT return anything (return type MUST be VOID)
    //search in student with firstName or LastName as passed in string.
    @future
    public static void futureMethodDemo(string s){
        system.debug('future method called. string s is 🥁🥁 ' + s);
    }

    //we cannot pass sObject in future method.
    @future
    public static void updateDateFuture(Set<id> studentIds){
        List<Student__c> allStuds = [SELECT Id, First_Name__c, Joining_Date__c, Last_Name__c FROM Student__c where id in :studentIds];

        //update joining date to today's only when it is blank
        list<student__c> updateStuds = new list<Student__c>();
        for (Student__c eachStud : allStuds) {
            if (eachStud.Joining_Date__c == null) {
                eachStud.Joining_Date__c = date.today();
                updateStuds.add(eachStud);
            }
        }
        update updateStuds;
        //for ex:
         //in student trigger we are calling ANOTHER future method.
            //it will throw error
    }

    @future
    public static void assignment1Future(string accId){
        try {
            if (string.isNotEmpty(accId)) {
                account acc = [select id, name from account where id = :accId];
                system.debug('acc name is ' + acc.Name);
            }
        } catch (Exception ex) {
            system.debug('something went wrong. Error message: ' + ex.getMessage());
        }
    }


}
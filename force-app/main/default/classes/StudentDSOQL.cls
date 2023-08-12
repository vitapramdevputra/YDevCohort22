public class StudentDSOQL {
   public static void dsiplayStudentName() {
        string query = 'select Id, Name from student__c limit 10';
       
       
        system.debug('Final query is: ' + query);
        list<sObject> listSo = database.query(query);
        for(sObject eachRec : listSo){
            system.debug(eachRec);
        }
    }
}
public class DepartmentTriggerHandler {
    public static boolean allEmployeeUpdated = false;

    public static void updateEmployeePhone(list<department__c> depTriggerNew, map<id, department__c> depTriggerNewMap, list<department__c> depTriggerOld, map<id, department__c> depTriggerOldMap) {
        
        //get all employees of all the updated departments

        List<Employee__c> allEmps = [select id, Department__c, department_phone__c from Employee__c where Department__c in :depTriggerNewMap.keySet()];
        system.debug('allEmps: ' + allEmps);


        for (Employee__c eachEmp : allEmps) {
            //get employee's depatment's department phone field HERE.
            department__c newDept = depTriggerNewMap.get(eachEmp.Department__c);
            eachEmp.department_phone__c = newDept.department_phone__c;
        }
        allEmployeeUpdated = true;
        update allEmps; //call employee trigger
       
    }
}
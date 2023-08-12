public class EmployeeTriggerHandler {
    public static void updateDeptarmentPhone(List<employee__c> empTriggerNew, Map<id, employee__c> empTriggerNewMap, List<employee__c> empTriggerOld, Map<id, employee__c> empTriggerOldMap) {
        //get department ids
        //set<id> deptIds = new set<id>();
        map<id, string> depIdsPhone = new map<id, string>();
        for (Employee__c newEmp : empTriggerNew) {
            if (newEmp.Department__c != null) {
                //deptIds.add(newEmp.Department__c);
                //adding dept id and phone which we want to update in that deparment
                depIdsPhone.put(newEmp.Department__c, newEmp.department_phone__c);
            }
        }

        List<Department__c> allDepts = [select id, department_phone__c from Department__c where id in :depIdsPhone.keySet()];

        for (Department__c eachDep : allDepts) {
            eachDep.department_phone__c = depIdsPhone.get(eachDep.Id);
        }
        update allDepts;//will call department trigger.
    }
}
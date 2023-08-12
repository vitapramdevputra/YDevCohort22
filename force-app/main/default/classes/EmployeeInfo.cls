public class EmployeeInfo {
    public static void show() {
        list<Employee__c> listEmp = [SELECT First_Name__c, Last_Name__c, JoinDate__c FROM Employee__c order by JoinDate__c desc];

        for (Employee__c eachEmp : listEmp) {
            system.debug('Employee Name: ' + eachEmp.First_Name__c + ' ' + eachEmp.Last_Name__c);
            date dt = eachEmp.JoinDate__c;
            system.debug('employee joining date: ' + dt);
            system.debug('-----');
        }
    }

    public static void show2() {
        Employee__c emp = [select id, first_name__c, last_name__c, createddate from employee__c order by createddate desc limit 1];
        system.debug(emp.Id);
        system.debug(emp.First_Name__c);
    }

    public static void showAccount() {
        account acc = [select id, name, createddate from account order by createddate desc limit 1];
        system.debug(acc.Id);
        system.debug(acc.Name);
    }
}
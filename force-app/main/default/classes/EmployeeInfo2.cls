public class EmployeeInfo2 {
    public static void show() {
        list<employee__c> listEmp = [select first_name__c, last_name__c, country__c, email__c from Employee__c limit 5];

        for (Employee__c emp : listEmp) {
            system.debug(' name : ' + emp.First_Name__c + ' ' + emp.Last_Name__c);
            system.debug('country: ' + emp.Country__c);
            system.debug('email: ' + emp.Email__c);
            //system.debug('salary: ' + emp.Salary__c);
            system.debug('-------');
        }
    }


    public static void show2() {
        //custom relationship field department__r --> name__c is FIELD name of related object
        list<Employee__c> listEMP = [select first_name__c, last_name__c, salary__c, department__r.name__c from employee__c ];

        for (employee__c emp : listEMP) {
            system.debug('emp name is ' + emp.First_Name__c + ' ' + emp.Last_Name__c);
            system.debug('emp department name: ' + emp.Department__r.Name__c);
            //system.debug('emp department short code: ' + emp.Department__r.Short_Code__c);
            system.debug('-----');
        }
    }


    public static void employeeDetails() {
        List<Employee__c> listEmp = [select id, First_Name__c, Last_Name__c, Salary__c, Country__c from Employee__c where Country__c = 'USA'];

        for (Employee__c emp : listEmp) {
            system.debug(emp.First_Name__c + ' country is ' + emp.Country__c);
        }
    }

    public static void employeeDetails(string countryFilter) {

        List<Employee__c> listEmp = [select id, First_Name__c, Last_Name__c, Salary__c, Country__c from Employee__c where Country__c = :countryFilter];//data binding

        for (Employee__c emp : listEmp) {
            system.debug(emp.First_Name__c + ' country is ' + emp.Country__c);
        }
    }
}
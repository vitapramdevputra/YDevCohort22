public class EmployeeDetails {
    public static void forInformationTechnology(List<string> listFirstName, list<string> listLastName, list<string> listEmail) {
        //check if all three list same, else system debug error
        if (listFirstName.size() == listLastname.size() && listFirstName.size() == listEmail.size()) {
            //get information technology department

            List<Department__c> d = [select id from Department__c where name__c = 'Information Technology'];
            if (d.isEmpty()) {
                system.debug('no such department. so creating new.');
                //if you don't have IT, create that department.
                Department__c newDep = new Department__c(Name__c = 'Information Technology');
                insert newDep;
                d.add(newDep);
            }
            List<Employee__c> newEmployees = new list<Employee__c>();
            for (Integer i = 0; i < listFirstName.size(); i++) {
                Employee__c e = new Employee__c(
                    First_Name__c = listFirstName[i],
                    Last_Name__c = listLastName[i],
                    Email__c = listEmail[i],
                    Department__c = d[0].Id
                );
                newEmployees.add(e);
            }
            insert newEmployees;
        } else {
            system.debug('list sizes are not same. fix it please.');
        }
    }

    public static void forFinanceAndAccounting(List<string> listFirstName, list<string> listLastName, list<string> listEmail) {
        //check if all three list same, else system debug error
        if (listFirstName.size() == listLastname.size() && listFirstName.size() == listEmail.size()) {
            //get information technology department

            List<Department__c> d = [select id from Department__c where name__c = 'Finance And Accounting'];
            if (d.isEmpty()) {
                system.debug('no such department. so creating new.');
                //if you don't have IT, create that department.
                Department__c newDep = new Department__c(Name__c = 'Finance And Accounting');
                insert newDep;
                d.add(newDep);
            }
            List<Employee__c> newEmployees = new list<Employee__c>();
            for (Integer i = 0; i < listFirstName.size(); i++) {
                Employee__c e = new Employee__c(
                    First_Name__c = listFirstName[i],
                    Last_Name__c = listLastName[i],
                    Email__c = listEmail[i],
                    Department__c = d[0].Id
                );
                newEmployees.add(e);
            }
            insert newEmployees;
        } else {
            system.debug('list sizes are not same. fix it please.');
        }
    }

    public static void forProductionEngineering(List<string> listFirstName, list<string> listLastName, list<string> listEmail) {
        //check if all three list same, else system debug error
        if (listFirstName.size() == listLastname.size() && listFirstName.size() == listEmail.size()) {
            //get information technology department

            List<Department__c> d = [select id from Department__c where name__c = 'Production Engineering'];
            if (d.isEmpty()) {
                system.debug('no such department. so creating new.');
                //if you don't have IT, create that department.
                Department__c newDep = new Department__c(Name__c = 'Production Engineering');
                insert newDep;
                d.add(newDep);
            }
            List<Employee__c> newEmployees = new list<Employee__c>();
            for (Integer i = 0; i < listFirstName.size(); i++) {
                Employee__c e = new Employee__c(
                    First_Name__c = listFirstName[i],
                    Last_Name__c = listLastName[i],
                    Email__c = listEmail[i],
                    Department__c = d[0].Id
                );
                newEmployees.add(e);
            }
            insert newEmployees;
        } else {
            system.debug('list sizes are not same. fix it please.');
        }
    }

    public static void forQualityAssurance(List<string> listFirstName, list<string> listLastName, list<string> listEmail) {
        //check if all three list same, else system debug error
        if (listFirstName.size() == listLastname.size() && listFirstName.size() == listEmail.size()) {
            //get information technology department

            List<Department__c> d = [select id from Department__c where name__c = 'Quality Assurance'];
            if (d.isEmpty()) {
                system.debug('no such department. so creating new.');
                //if you don't have IT, create that department.
                Department__c newDep = new Department__c(Name__c = 'Quality Assurance');
                insert newDep;
                d.add(newDep);
            }
            List<Employee__c> newEmployees = new list<Employee__c>();
            for (Integer i = 0; i < listFirstName.size(); i++) {
                Employee__c e = new Employee__c(
                    First_Name__c = listFirstName[i],
                    Last_Name__c = listLastName[i],
                    Email__c = listEmail[i],
                    Department__c = d[0].Id
                );
                newEmployees.add(e);
            }
            insert newEmployees;
        } else {
            system.debug('list sizes are not same. fix it please.');
        }
    }
}
public class AccountInfo {
    public static void showParentToChild1() {
        list<account> listAcc = [select id, name, phone,(select name, email from contacts) from account];

        for (account eachAcc : listAcc) {
            system.debug('acc name : ' + eachAcc.Name + ', acc phone: ' + eachAcc.Phone);

            list<contact> listContacts = eachAcc.Contacts;//list

            integer totalContacts = listContacts.size();
            //check if we have atleast one contact
            if (totalContacts > 0) {
                for (contact eachContact : listContacts) {
                    system.debug('contact name is ' + eachContact.Name + ', each contact email: ' + eachContact.Email);
                }
            } else {
                system.debug('***** NO contacts for this account.****');
            }
            system.debug('----');
        }
    }


    //fetch all departments and its employees
    public static void showParentToChild2() {
        list<department__c> listDept = [select id, name__c, Short_Code__c, (select first_name__c, last_name__c, country__c, salary__c from employees__r) from department__c];
        
        for (Department__c eachDept : listDept) {
            system.debug('department name : ' + eachDept.Name__c + ', Short Code is ' + eachDept.Short_Code__c);

            List<Employee__c> listEmps = eachDept.Employees__r;
            Decimal totalSalary = 0;
            for (Employee__c eachEmp : listEmps) {
                system.debug('--> employee name is ' + eachEmp.First_Name__c + ' ' + eachEmp.Last_Name__c);
                system.debug('--> employee country and salary : ' + eachEmp.Country__c + ' ' + eachEmp.Salary__c);
                totalSalary += eachEmp.Salary__c;
            }
            system.debug('** total salary for ' + eachDept.Name__c + ' department is ' + totalSalary);
            system.debug('----');
        }
    }

    public static list<account> showAccount(string filterIndustry) {
        list<account> filterAccounts = [select name, phone, website, industry, annualrevenue from account where Industry = :filterIndustry];

        return filterAccounts;
    }
    
}
public  class SobjectDemo {
    public static void assignment1() {
        List<sobject> listSO2 = [select id, firstname, lastname from contact limit 10];

        for (sobject eachSO : listSO2) {
            //we can access only ID directly.
            system.debug('Id : ' + eachSO.id);
            system.debug('Firstname : ' + eachSO.get('firstname'));
            system.debug('lastname : ' + eachSO.get('lastname'));
            system.debug('---');
        }

    }
    public static void homework1() {
        List<sobject> listSO1 = [select id, name, phone, accountnumber from account limit 10];

        for (sobject eachSO : listSO1) {
        system.debug('Id : ' + eachSO.id);
        system.debug('name : ' + eachSO.get('name'));
        system.debug('phone : ' + eachSO.get('phone'));
        system.debug('accountnumber : ' + eachSO.get('accountnumber'));
        system.debug('---');
        }
    }

    public static void sObjectDml1() {
        list<sobject> listSO = new list<sobject>{
            new account(name = 'Lacrose'),
            new contact(firstname = 'titan', LastName = 'king')
        };
        system.debug('before: ' + listSO);
        insert listSO;
        system.debug('after: ' + listSO);
    }


}
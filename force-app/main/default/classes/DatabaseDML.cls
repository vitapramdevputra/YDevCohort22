public class DatabaseDML {
    public static void ddmlInsert1() {
        List<account> newAccounts = new list<account>{
            new account(name = 'apple'), //innocent
            new account(),
            new account(name = 'orange')
           
        };

        //false -> insert good ones, error bad ones
        //true -> insert ONLY if all are good. DO NOT INSERT any if any 1 is bad.
        List<Database.SaveResult> allResults = Database.insert(newAccounts, false);
        system.debug('all results are: ' + allResults);
            //for each record it returns the result.
        for (database.SaveResult eachResult : allResults) {
            if (eachResult.isSuccess()) {
                system.debug('record successfully saved. id is ' + eachResult.getId());
            } else {
                //not successful
                system.debug('errors: ' + eachResult.getErrors());
                //List<Database.Error> eachResErrors = eachResult.getErrors();
                for (database.error eachError : eachResult.getErrors()) {
                    system.debug('fields: ' + eachError.getFields());
                    system.debug('message: ' + eachError.getMessage());
                    system.debug('status code: ' + eachError.getStatusCode());
                }
            }
        }
    }

    public static void ddmlUpsertEtc() {
        //insert and update
            //saveresult
        account acc = [select id, name from account where name = 'orange' limit 1];
        acc.Name = 'blackberry';

        //upsert
            //upsertresult
        Database.UpsertResult result = Database.upsert(acc, false);
        system.debug('upsert result' + result);

        //delete
            //deleteresult
        Database.DeleteResult delResult = Database.delete(acc, false);
        system.debug('del result: ' + delResult);

        Database.UndeleteResult undelResult = database.undelete(acc.id, false);
        system.debug('undelete result: ' + undelResult);

    }

    public static void assignment11M7() {
         List<account> newAccounts = new list<account>{
            new account(name ='Steve', phone='9765235741'),
            new account(name='Alex', phone ='9645387063'),
            new account(name='Ricky', phone ='9547920931'),
            new account(name='Jeff', phone ='8636762637'),
            new account()         
        };

        List<database.SaveResult> allResults = database.insert(newAccounts, false);
        for (database.saveresult eachResult : allResults) {
            if (eachResult.isSuccess()) {
                system.debug('successfully inserted.');
            } else {
                system.debug('error it is');
            }
        }
    }
}
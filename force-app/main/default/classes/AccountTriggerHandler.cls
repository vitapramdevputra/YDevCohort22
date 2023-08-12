public class AccountTriggerHandler {

   public static void accountValidation1(List<account> accTriggerNew){
        //check if annual revenue is less than 5k then throw error
        for (Account accNew : accTriggerNew) {
            if (accNew.AnnualRevenue < 5000) {
                //throw error on RECORD
                //accNew.addError('Annual revene cannot be less than 5000. Come on user!');
                
                //throw error on the field
                accNew.AnnualRevenue.addError('Annual revene cannot be less than 5000. Come on user! (via Handler)');
            }

            system.debug('accNew.Industry = ' +accNew.Industry );
            if (accNew.Industry == null) {
                accNew.Industry.addError('Industry CANNOT be blank (via Handler)');
            }
            if (accNew.Rating == null) {
                accNew.Rating.addError('Rating CANNOT be blank (via Handler)');
            }
        }
   }


   public static void accountValidation2(List<account> accTriggerNew, List<account> accTriggerOld, 
   Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {

        for (Account newAcc : accTriggerNew) {
            system.debug('new acc name: ' + newAcc.Name);
            //get old account name. Id of new and old record remains the same.
            Account oldAcc = accTriggerOldMap.get(newAcc.id);
            
            //to check if name is changed, just compare oldAcc name and New acc name
            if (oldAcc.Name != newAcc.Name) {
                //for insert and update.
                    //addError can be used on trigger.new or newmap 
                    //addError CANNOT be used with Trigger.old or oldmap
               newAcc.addError('CANNOT change Account name. Okay?');
            }
        }
   }

   //when user creates a new account, create a related contact by default.
    //since it is AFTER INSERT, we don't need old and oldMap
   public static void createRelatedContact(List<account> accTriggerNew) {
        
        list<contact> createContacts = new list<contact>();
        for (account newAcc : accTriggerNew) {
            //create contat record
            Contact c = new contact(
                FirstName = 'Mark', 
                LastName = 'Khan', 
                Email = 'ak@ak.com',
                phone = '7897654621',
                accountid = newAcc.id
            );
           createContacts.add(c);
        }
        try {
            insert createContacts;
        } catch (Exception Ex) {
            system.debug('Something went wrong buddy: ' + ex);
            for (account newAcc : accTriggerNew) {
                newAcc.addError('Not able to create default contact. Please contact your admin, not developer.');
            }
        } 
   }

   public static void createRelatedOpportunity(List<account> accTriggerNew) {
        List<Opportunity> createNewOpps = new List<Opportunity>();

        for (account newAcc : accTriggerNew) {
            Opportunity op = new Opportunity();
            op.Name = 'Opportunity 1';
            op.AccountId = newAcc.Id;
            op.CloseDate = date.today();
            op.StageName = 'Prospecting';
            createNewOpps.add(op);
        }
        if (!createNewOpps.isEmpty()) {
            insert createNewOpps;
        }  
   }

   //update all related contact's phone number if account's phone is changed
   public static void updateRelatedContactPhone(List<account> accTriggerNew, List<account> accTriggerOld, 
    Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {

        //1st create set<id> to store account whose phone field is changed.
        set<id> accIds = new set<id>();
        for (account newAcc : accTriggerNew) {
            Account oldAcc = accTriggerOldMap.get(newAcc.id);
            //check if phone field is changed
            if (newAcc.Phone != oldAcc.Phone) {
                accIds.add(newAcc.Id);
            }
        }
        system.debug('acc ids where phone field is changed: ' + accIds);
        if (!accIds.isEmpty()) {
            //2nd get all contacts of all the accounts in set<id> of step 1
            List<contact> allContacts = [select id, lastname, AccountId from contact where AccountId in :accIds];

            //3rd update all contacts with respective accountids.
            for (Contact eachContact : allContacts) {
                //get account phone field here.
                account newAccount = accTriggerNewMap.get(eachContact.accountId);
                eachContact.Phone = newAccount.Phone;
            }
            update allContacts;
        }
   }

   public static void validateAccDelete(List<account> accTriggerOld) {
        //when we are deleting record.
        //we can throw error on trigger.old or oldmap. [there is NO new.]
        for (account oldAcc : accTriggerOld) {
            if (oldAcc.Active__c == 'Yes') {
                oldAcc.addError('Cannot Delete Active account. Go away');
            }
        }
   }

   //validate if account has related contact or opportunity
   public static void validateAccDelete2(List<account> accTriggerOld, Map<id, account> accTriggerOldMap) {
       list<account> allAccDetails = [select id, name, 
                                (select id from contacts), 
                                (select id from Opportunities) 
                                from account where id in :accTriggerOldMap.keySet()];
        for (account eachAcc : allAccDetails) {
            //check if more than 0 contact or opportunity
            integer countContact = eachAcc.contacts.size();
            integer countOpp = eachAcc.Opportunities.size();
            if (countContact > 0 || countOpp > 0) {
                //throw error
                account oldAcc = accTriggerOldMap.get(eachAcc.Id);
                oldAcc.addError('Cannot delete account. Contacts or Opportunities are present');
            }
        }
   }

   public static void deleteRelatedContacts(List<account> accTriggerOld, Map<id, account> accTriggerOldMap) {
        //get set of accountIds for which we want to delete contacts
        set<id> accoundIds = accTriggerOldMap.keySet();
        list<contact> getContacts = [select id from contact where AccountId in :accoundIds];
        delete getContacts;
   }
}
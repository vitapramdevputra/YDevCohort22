ConnectExternalSFOrg.getAccounts();
ConnectExternalSFOrg.createAccount();

ConnectExternalSFOrg.getAllAccounts();


AnimalWrapper aw = new AnimalWrapper();
aw.animals = new list<string>{'cow', 'buffalo'};


String jsonStrAW = JSON.serialize(aw);

AnimalWrapper aw2 = JSON.deserialize(jsonStrAW, AnimalWrapper.class);


Account a1 = new Account();
        a1.Name = 'New Acc In New Org';
        a1.Description = 'Creating this via API from other org.';

        string jsonBody = JSON.serialize(a1);
        system.debug('jsonBody => ' + jsonBody);
        system.debug('account a1 ==> ' + a1);
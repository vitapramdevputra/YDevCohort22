AccountInfo.showParentToChild2();
AccountInfo.showParentToChild1();

system.debug(AccountInfo.showAccount('Energy'));


List<account> listAccounts = [select id from account];
list<contact> cts = [select id from contact where accountid = :listAccounts[0].Id];

List<SObject> allRecords = new List<SObject>();
allRecords.addAll(listAccounts);
allRecords.addAll(cts);
system.debug(allRecords.size());




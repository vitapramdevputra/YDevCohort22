List<contact> allContacts = [select id, name, phone from contact where phone != null];

ContactUpdateQueueable cq = new ContactUpdateQueueable(allContacts);
system.enqueueJob(cq);


id jobIdAssignment4 = system.enqueueJob(new QueueableTraining());
AsyncApexJob aaj = [select id, numberOfErrors, status from asyncApexJob where id = :jobIdAssignment4];
system.debug(aaj);


AsyncApexJob aaj2 = [select id, numberOfErrors, status from asyncApexJob where id = '7075i000043WnG9AAK'];
system.debug(aaj2);
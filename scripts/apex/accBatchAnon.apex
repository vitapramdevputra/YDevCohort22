BatchAccountUpdate ba = new BatchAccountUpdate();

Id jobId = database.executeBatch(ba, 30); //we can executeBatch only the classes which are implementing Batchable.
system.debug('apex job id ==> ' + jobId);



QueueableExample1 qe1 = new QueueableExample1();
Id jobIdQ = System.enqueueJob(qe1); //we can enqueue only those classes which are implementing queueable

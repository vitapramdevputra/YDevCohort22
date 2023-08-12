public class SchedulableTraining implements Schedulable {
    public void execute(SchedulableContext sc){
        QueueableTraining qt = new QueueableTraining();
        Id queueId = system.enqueueJob(qt);
        system.debug('queueable job id is ' + queueId);
    }
}
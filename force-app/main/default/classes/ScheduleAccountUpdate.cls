public class ScheduleAccountUpdate implements Schedulable{
    public void execute(SchedulableContext sc){
        //execute batch from here.
        BatchAccountUpdate ba = new BatchAccountUpdate();
        Database.executeBatch(ba, 50);
    }
}
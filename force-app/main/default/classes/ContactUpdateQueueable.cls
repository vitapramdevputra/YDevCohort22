public class ContactUpdateQueueable implements Queueable{

    List<contact> contactsToUpdate = new list<contact>();

    public ContactUpdateQueueable(List<contact> contactsToUpdate) {
        system.debug('constructor');
        this.contactsToUpdate = contactsToUpdate;
    }

    public void execute(QueueableContext qc){
        //write logic to UPDATE contacts
        for (contact eachContact : contactsToUpdate) {
            eachContact.Description = 'Updated via Queueuable';
        }
        update contactsToUpdate;
    }
}
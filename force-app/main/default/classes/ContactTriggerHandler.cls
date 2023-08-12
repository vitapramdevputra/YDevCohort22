public class ContactTriggerHandler {
    public static void contactValidation1(list<contact> ctTriggerNew) {
        for (contact newContact : ctTriggerNew) {
            if (newContact.Phone == null) {
                newContact.Phone.addError('Phone is a must for creating contact.');
            }
        }
    }

    //we will send email to user when contact is restored.
    public static void sendEmailOnRestore(List<contact> ctTriggerNew, Map<id, contact> ctTriggerNewMap) {
        List<Messaging.SingleEmailMessage> listEmails = new List<Messaging.SingleEmailMessage>();
        for (contact newcontact : ctTriggerNew) {
            list<string> emailAddress = new list<string>{ userInfo.getUserEmail() };
            
            Messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
            msg.setToAddresses(emailAddress);//list of email address. Or id of user, lead, or contact
            msg.setSubject('Contact is restored: contact last name is ' + newContact.LastName);
            msg.setPlainTextBody('Hello ' + userInfo.getName() + ', you have successfully restored a contact. Good job buddy');

            listEmails.add(msg);
        }
        Messaging.sendEmail(listEmails);
    }
}
public class EnumUseCase {
    


    public static void getContactId(string name){
        id contactId = [select id from contact where firstName = :name limit 1]?.Id;
        system.debug('contact id is ' + contactId);
    }
}
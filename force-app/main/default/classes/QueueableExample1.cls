public class QueueableExample1 implements Queueable{
    public QueueableExample1() {
        system.debug('constructor called.');
    }

    public void execute(QueueableContext qc){
        List<account> newAccounts = new list<account>{
                new account(name = 'apple Queue',   Rating = 'Hot', Industry = 'Energy',  annualRevenue = 9000), 
                new account(name = 'mango Queue' ,  Rating = 'Hot', Industry = 'Energy',  annualRevenue = 9000),
                new account(name = 'orange Queue', Rating = 'Hot', Industry = 'Energy',  annualRevenue = 9000)
            };
            insert newAccounts;

    }
}
public class ExceptionDemo {
   public static void demo1(string s){
        try{
            system.debug('s is ' + s);
            string str2 = s.toUpperCase(); //it will throw error. And code does NOT run any further.
            system.debug('str2 = ' + str2);
        } catch(NullPointerException npe){
            system.debug('s CANNOT be NULL.');
        }
        system.debug('code completed');
   }

   public static void demo2(string n) {
       
        try {
            string nCaps = n.toUpperCase();
            integer x = n.length()/0;
            account a = new account();
            //a.Name = nCaps;
            insert a;
            
        } catch(NullPointerException npe){
            system.debug('CANNOT pass null to string parameter');
            system.debug('npe error : ' + npe);

        } catch(DmlException de){
            system.debug('Fill all required field, please');
            system.debug('de exception: ' + de);
        } catch (Exception ex) {
            system.debug('Exception occurred.');
            system.debug('ex message: ' + ex.getMessage());
            system.debug('ex: ' + ex);
        }
   }

   public static void demo3(string n, list<integer> l) {
        try {
            account a9 = [select id, name from account where name = :n];
            system.debug('a9: ' + a9);

            Account a = new account(name = n);
            insert a;

            //example: list<integer>{5,5}
            integer x = l[0]/l[1]; 
            system.debug(x); //1
            
        } catch(DmlException de){
            system.debug('account NOT inserted.');
            system.debug('dml ex: ' + de);
        } catch(MathException me){
            system.debug('math says we cannot divide by zero');
            system.debug('me exception: ' + me);
        } catch(QueryException qe){
            system.debug('query went wrong buddy');
            system.debug('qe is ' + qe);
        } catch (Exception ex) {
            system.debug('common exception: ' + ex);
        } 
   }

   public static void assignment2(string s) {

        try {
            account a = [select id, name from account where name = :s limit 1];

            a.name = 'null';
            insert a;
        } catch (QueryException qe){
            system.debug('wrong query maybe');
            system.debug('qe message: ' + qe.getMessage());
        } catch (DmlException de){
            system.debug('wrong dml maybe');
            system.debug('de message: ' + de.getMessage());
        }
        catch (Exception ex) {
            system.debug('something wrong definitly maybe');
        }
    
   }
}
public class SoqlDemo {
   public static void queryExample1(){
        list<account> l1 = [select id, name, website from account];
        system.debug(l1);

        for( account eachAccount: l1){
            //0system.debug(eachAccount);
            string name = eachAccount.Name;
            system.debug('name of account is ' + name);

            string website = eachAccount.Website;//we did not select.
            system.debug('website is ' + website);
        }
   }
}
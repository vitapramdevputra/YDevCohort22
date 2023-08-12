// try {
//     StudentMarks sm = new StudentMarks();
//     sm.validateMarks(null);

// } catch(StudentMarks.MarksException sme){
//     system.debug('marks exception: ' + sme);
// }
//  catch (Exception ex) {
//     system.debug('general exception: ' + ex);
// }

try {
    StDemoTesting s1 = new StDemoTesting(18,'f    ');
    s1.show();
} catch (StDemoTesting.StudentException se)  {
    system.debug('This is message -'+se.getMessage());
    system.debug(se);
} catch (Exception e)  {
    system.debug('This is message -'+e.getMessage());
    system.debug(e);
}


list<account> la = new list<account>()
for(integer i = 0; i < 76; i++){
   account a = new account(name = 'test');
   la.add(a);
}
insert la;


for(integer i = 0; i < 50; i++){
    account a = [select id from account limit 1];
    system.debug('a -> ' + a);
}

for(integer i = 0; i < 1; i++){
    account a = [select id from account limit 1];
    system.debug('a -> ' + a);
}




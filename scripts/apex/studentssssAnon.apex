// studentDemo s = new StudentDemo();
// s.show();

system.debug('----');

try {
   studentDemo s1 = new StudentDemo(18, null);
    s1.show(); 
} catch(StudentException se){
    system.debug('studnet exception: ');
    system.debug(se);
    system.debug('cause: ' + se.getCause());
    system.debug('msg: ' + se.getMessage());
    system.debug(se.getTypeName());
}



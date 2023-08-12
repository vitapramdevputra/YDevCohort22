//System.NullPointerException: Attempt to de-reference a null object
string s;
string str2 = s.toUpperCase(); //it will throw error. And code does NOT run any further.
system.debug('code completed');

//ListException
list<integer> l = new list<integer>{0,1};
system.debug('5th element: ' + l[4]);

//System.QueryException
account a = [select id, name from account where name='vitap'];
system.debug(a);

account a2 = [select id, name from account];
system.debug(a2);

//LimitException
for(integer i = 0; i < 160; i++){
    insert new account(name = 'test');
}

//DMLException
account a3 = new account();
insert a3;
system.debug(a3);
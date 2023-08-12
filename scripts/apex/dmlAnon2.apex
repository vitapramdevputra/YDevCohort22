DmlDemo3.dmlHomework14();




delete [select id from contact where firstname = 'Don'];

list<contact> listCon = [select id from contact where firstname = 'Don' All Rows];
undelete listCon;

DmlDemo3.dmlAssignment6();

DmlDemo3.dmlUpsert3();

DmlDemo2.dmlAssignment9();
DmlDemo2.dmlAssignment9pt2();

DmlDemo2.dmlUpdateBulk1();

DmlDemo2.dmlAssignment4();
DmlDemo2.dmlUpdate1();

DmlDemo2.dmlUpdate2();

DmlDemo2.dmlInsertMultipleRight();

DmlDemo2.dmlInsertMultipleWrong();//wrong way.



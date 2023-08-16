Triggers Revision.
    - events
        - before insert, before update, after insert, after update
        - before delete, after delete, after undelete
    - context variables
        - Trigger.isBefore, Trigger.isAfter, Trigger.isInsert, Trigger.isUpdate
        - Trigger.isDelete, Trigger.isundelete
        - Trigger.new (list), Trigger.newMap (map)
            - newly inserted or updated data.
        - Trigger.old, Trigger.oldMap
            - previous data (old data)

    - update data while inserting
        - before insert context
    - update data while updating
        - before update context

    - availability of all the context variable are mentioned below
    
                Trigger.New     Trigger.NewMap      Trigger.old     Trigger.oldMap
Before Insert       Yes          Null (bcz No Id)        Null            Null      -> there is NO OLD Record
After  Insert       Yes              Yes                 Null            Null      -> there is NO OLD Record
Before Update       Yes              Yes                 Yes             Yes
After  Update       Yes              Yes                 Yes             Yes
Before Delete       No               No                  Yes             Yes
After  Delete       No               No                  Yes             Yes
After unDelete      Yes              Yes                 Null            Null       -> there is NO OLD Record





What type automation to perform in before triggers?
- update same record which is inserted/updated
- validation in trigger (try to do it in before)



What type automation to perform  after triggers?
- insert/update/delete related records. Perform any DMLs.
- send email



WHen will trigger code execute?
- 1) when inserting account from page layout            --> yes. 
- 2) when updating acc from Anonymous apex.             --> yes.
- 3) when deleting accounts from data loader            --> yes.
- 4) when querying account records from query editor    --> No.



Requirment 25

Department Phone in Department OBJECT is updated (action)
    - automation: update Department phone in all employees of that deparment
        - object? Department
        - in which event? After
        - operation? update


Department phone in Employee OBJECT is updated (action)
    - automation: update deparment phone in Department object and all other employees.
    - object? employee
    - in which event? after
    - operation? update

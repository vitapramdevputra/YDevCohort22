Test dmls and soqls

SOQL
    - test method cannot ACCESS any data from ORG by default.
    - example: we have 500 accounts in org.
        inside test method we write below query:
            [select id, name from account]; --> how many records it will fetch?
                0

DML
    - inside test method we are inserting 100 account records.
    - how many records will be actually inserted in ORG?
        - 0.
    - if we insert 100 records in test method
        - it will go through order of execution. but record is not committed in the org.
        - record will stay in test world.

NEXT SESSION:
dmlUpdateBulk1
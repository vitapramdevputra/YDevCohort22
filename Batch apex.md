Batch apex

we want to update 5000 records. But synchronously, I am able to update only 500 records. FOr more than 500 we are running out of limits.


query all the 5k records
    - divide records in group of 500.
    - execute in group of records (chunks)

    - how many groups or batches will run?
        10 batches.
            - each batch will have its own governor limit



get all account records in org.
if industry and rating are blank then set it to something

and update account name and append '-- yoll'
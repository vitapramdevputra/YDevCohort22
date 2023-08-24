public with sharing class DmlAndCalloutDemo {
   public static void dmlCallout1() {
        //create ONE account record.

        //1. create new instance of sobject.
        account acc = new account();

        //2. set field names
        acc.Name = 'Salesforce';
        acc.Website = 'salesforce.com';
        acc.Industry = 'Agriculture';
        acc.Rating = 'Warm';
        //dml
        insert acc;

        //if we want to do DML and Callout together, then use future method for callout
        //callout using future (callout= true)
        CalloutsDemo.callAnimalApi2();
    }
}
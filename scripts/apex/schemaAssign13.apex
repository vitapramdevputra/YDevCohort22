//all metadata infor of contact sobject
Schema.describeSobjectResult contactSR = contact.sobjectType.getDescribe();
system.debug('contactSR => ' + contactSR);

//get map of all field names of contact sObject
Map<string, schema.SObjectField> contactFieldMap = contactSR.fields.getMap();
for (string eachField : contactFieldMap.keySet()) {
    Schema.describeFieldResult eachFieldResult = contactFieldMap.get(eachField).getDescribe();
    system.debug('field label is..... ' + eachFieldResult.getLabel());
    system.debug('---');
}
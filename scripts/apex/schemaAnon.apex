Schema.describeSobjectResult sR = Account.sobjectType.getDescribe();
system.debug('sR -> ' + sR);
//results for soBject using getDescrible() -> describeSObjectResult

Map<string, schema.SObjectfield> sRFields = sR.fields.getmap();
system.debug(sRFields);

system.debug('--------');
system.debug('--------');
for (string fieldKey : sRFields.keySet()) {
    system.debug('fieldKey - ' + fieldKey + ' :: ' + sRFields.get(fieldKey));
    Schema.sobjectfield sof = sRFields.get(fieldKey);
    Schema.DescribeFieldResult eachFieldResult = sof.getDescribe();
    //print details of custom fields only
    if(eachFieldResult.isCustom()){
        system.debug('getName() --> ' + eachFieldResult.getName());
        system.debug('getLabel() --> ' + eachFieldResult.getLabel());
        system.debug('getLengh() --> ' + eachFieldResult.getLength());
        system.debug('***');
    }
}


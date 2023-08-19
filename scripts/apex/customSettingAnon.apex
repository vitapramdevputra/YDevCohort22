//fetch information from country code custom setting
List<CountryCode__c> cc  = [select id, code2__c, code3__c, name from countrycode__c];
system.debug(cc);

//to get all records we use .getAll()
Map<string, countryCode__c> allCC = CountryCode__c.getAll();
system.debug('all CC map: ' + allCC);

//print ==> Country=France: CODES are FR & FRA
for (String eachCOuntry : allCC.keySet()) {
    countryCode__c eachCC = allCC.get(eachCOuntry);
    system.debug('Country is ' + eachCOuntry + ': Code is ' + eachCC.code2__c + ' & ' + eachCC.code3__c);
}

//to get one instance of a country we use getInstance()
CountryCode__c fraCC = CountryCode__c.getInstance('France');
system.debug('FRANCE COUNTRY CODE ONLY: ' + fraCC);

DefaultOppInfo__c defOpp = DefaultOppInfo__c.getOrgDefaults();
system.debug( defOpp);
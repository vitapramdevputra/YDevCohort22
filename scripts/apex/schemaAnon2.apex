
Schema.DescribeFieldResult ratingFR = Account.rating.getDescribe();
List<schema.PicklistEntry> allRatingValues = ratingFR.getPicklistValues();
system.debug('raing values: '  + allRatingValues);
system.debug('-----');
for (schema.picklistentry eachEntry : allRatingValues) {
    system.debug(eachEntry.getLabel() + ' --> ' + eachEntry.getValue());
}
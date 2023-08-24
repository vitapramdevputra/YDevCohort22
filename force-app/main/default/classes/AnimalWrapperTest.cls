@isTest
public with sharing class AnimalWrapperTest {
    static testMethod void testParse() {
		String json = '{\"animals\":[\"majestic badger\",\"fluffy bunny\",\"scary bear\",\"chicken\"]}';
		AnimalWrapper obj = AnimalWrapper.parse(json);
		System.assert(obj != null);
	}
}
@isTest
public with sharing class CalloutsDemoTest {
    @isTest
    private static void testCallout1() {
        Test.setMock(HttpCalloutMock.class, new MockCalloutDemo());
        Test.startTest();
        CalloutsDemo.callAnimalApi2();
        CalloutsDemo.callAnimalApi();
        Test.stopTest();
    }
}
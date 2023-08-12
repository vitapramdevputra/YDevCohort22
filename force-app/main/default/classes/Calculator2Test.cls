//For each Class or Trigger we write different Test classes.
@isTest
public class Calculator2Test {
    //in each test class we will have multiple TEST METHODS.
        //each test method will TEST UNIT of our actual class
    //we can have NON-test method inside test class also.

    public static void show() {
        system.debug('a normal method inside a test class.'); //allowed? Yes
    }

    @isTest
    public static void testMethod1() {
        //PUBLIC test methods are ALLOWED.
        system.debug('testmethod 1 called.');
        Calculator2 c = new Calculator2();
        c.accept(4, 5);
        assert.isNotNull(c);
    }

    @isTest
    private static void testMethod2() {
        //private test methods are ALLOWED.
        system.debug('testmethod 2 also called.');
        Calculator2 c = new Calculator2();
        c.accept(4, 5);
        integer sum = c.getSummation();
        //how to verify if our method is working as should it be?
            //assertion
        //assert(boolean) => use this with size or isEmpty, or checking if null or not
        system.assert((sum != 0), 'sum is 0');
        //assertEquals(expected, actual) -> use this to compare value.
        system.assertEquals(9, sum, 'sum is not 9');
        //sum should be 9

        integer x = c.getProduct();
        Assert.areEqual(20, x);
        
    }
    @isTest
    private static void testMethod3() {
        //private test methods are ALLOWED.
        system.debug('testmethod 2 also called.');
        Calculator2 c = new Calculator2();
        c.accept(4, 5);
        integer x = c.getDiffence();
        //system.assertEquals is OLD Method to write assertion.
        system.assertEquals(-1, x);
        
        //new assert methods (or class and method)
        Assert.areEqual(-1, x);
    }
    @isTest
    private static void testMethod4() {
        //private test methods are ALLOWED.
        system.debug('testmethod 2 also called.');
        Calculator2 c = new Calculator2();
        c.accept(4, 5);
        integer x = c.getProduct();
        Assert.areEqual(20, x);
    }

    @isTest
    private static void testMethod5() {
        //private test methods are ALLOWED.
        system.debug('testmethod 2 also called.');
        Calculator2 c = new Calculator2();
        c.accept(10, 5);
        integer x = c.getQuotient();
        Assert.areEqual(2, x);
    }
}
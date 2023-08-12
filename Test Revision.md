Test class/Unit Testing

- What is a test class and how can we create a test class?
    - we have to use annotation called @isTest

Are all methods by defaults test methods inside test class?
    - No.

- Test Methods
    - @isTest annotation is must
    - public or private - it can be any access modifier
    - test method must be static
    - we cannot pass any parameters in test method


How do we verify if output of the method which we are testing is correct or not?
    - Assertions
    - assert.isTrue(boolean) ----> system.assert(boolean)
    - assert.areEqual(expected, actual) ---> system.assertEquals(expected, actual)


Example:
    5 classes.
        - 2 classes have 150 lines each testable code
        - 3 classes have 20 lines each
        --
        360 lines of code which we MUST test.

        overrall test 300+ lines of code coverage.
        each class should have some code coverage. More than 0%.
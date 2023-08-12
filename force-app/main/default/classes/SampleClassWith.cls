public with sharing class SampleClassWith {
    public SampleClassWith() {
        //respect sharing rules
    }
    public void methodWith1(){
        SampleClassInherited sc = new SampleClassInherited();
        sc.method11();
    }
}
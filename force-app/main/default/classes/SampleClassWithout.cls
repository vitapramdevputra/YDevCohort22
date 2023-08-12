public without sharing class SampleClassWithout {
    public SampleClassWithout() {
        //without sharing
    }
    public void methodWithout2(){
        //this will NOT enforce sharing rules.
        SampleClassInherited sc = new SampleClassInherited();
        sc.method11();
    }

}
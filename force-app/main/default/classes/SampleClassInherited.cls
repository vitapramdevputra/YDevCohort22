public inherited sharing class SampleClassInherited {
    public void method11(){
        //if it is called from with sharing class.
            //will it respect sharing rules? YES>
        //if it is called from without sharing class
            //will it respect sharing rules? No.
        //if it is called from trigger, or aura, or lwc, or vf page, or rest api.
            //IT WILL RESPECT SHARING RULES. YES.
    }
}
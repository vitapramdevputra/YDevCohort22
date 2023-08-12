public class SampleClassOmitted {
    public void method11(){
        //if it is called from with sharing class.
            //will it respect sharing rules? YES>
        //if it is called from without sharing class
            //will it respect sharing rules? No.
        //if it is called from trigger, or aura, or lwc, or vf page, or rest api.
            // WILL IT RESPECT SHARING RULES? NO.
    }
}
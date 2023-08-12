public class TempClass {
    string s;
    private TempClass() {
        system.debug('private constructor called');
    }
    public TempClass(string s){
        this();//THIS will call parameterless constructor
        system.debug('public constructor called.');
        this.s = s;
    }
}
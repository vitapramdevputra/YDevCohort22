public class EnumExample {
    //Season is Enum Datatype
    public enum Season {WINTER, SUMMER, SPRING, FALL}

    public enum Weekday{MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY}
    public enum Weekend {SATURDAY, SUNDAY}

    //show is the method name
        //it accepts 1 parameter. Parameters datatype is Season (which is enum datatype)
    public void show(Season s){
        system.debug('enum season value: ' + s);
        
        system.debug('season enum values: ' + season.values());
        string sName = s.name();
        system.debug('s name ==> ' + sName);
        integer sOrdrinal = s.ordinal();
        system.debug('s ordinal ==> ' + sOrdrinal);

        switch on s {
            when WINTER {
                system.debug('season is winter. its cold.');
            }
            when SUMMER {
                system.debug('season is summer. its hot.');
            }
            when SPRING {
                system.debug('season is spring. its warm and nice and great.');
            }
            when FALL{
                system.debug('season is fall. its colorful');
            }
            when else {
                system.debug('eow.');
            }
        }
    }
    public static void show(Weekday wd, Weekend we){
        
        system.debug('wd name => ' + wd.name());
        system.debug('we name => ' + we.name());
    }
}
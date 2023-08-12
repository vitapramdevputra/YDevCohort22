EnumExample.Season s1 = EnumExample.Season.SUMMER;

EnumExample e1 = new EnumExample();
e1.show(s1);
//e1.show(EnumExample.season.values());

system.debug('-----');
e1.show(EnumExample.Season.FALL);
system.debug('-----');
e1.show(EnumExample.Season.WINTER);
system.debug('-----');
e1.show(EnumExample.Season.SPRING);


EnumExample.show(EnumExample.Weekday.WEDNESDAY, EnumExample.Weekend.SATURDAY);




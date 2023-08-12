public with sharing class StDemoTesting {
    public class StudentException extends Exception{}
    integer age;
    string name;
    public StDemoTesting() {
        age = 18;
    }
    public StDemoTesting(Integer age,string name) {
        if(age < 18){
            throw new StudentException('Age cannot be less than 18. Only adult students allowed.');
        } else {
            this.age = age;
        }
        
        if (string.isBlank(name) || name.length() <=1) {
            throw new StudentException('Name cannot be blank, empty,null or 1 character');
        }else {
            this.name=name;
        }
        
    }
    public void show(){
        system.debug('age of student is ' + age);
        system.debug('name of student is '+ name);
    }
}
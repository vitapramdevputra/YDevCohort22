public  class StudentDemo {
    integer age; //cannot be less than 18
    string name; //cannot be blank, null, or 1 character

    //throw StudentException when age is less than 18 and name is blank or null or 1 character

    public StudentDemo(Integer age, string name) {
        if(age < 18){
            throw new StudentException('Age cannot be less than 18.');
        } else {
            this.age = age;
        }

        try {
            if (String.isBlank(name) || name.length() <= 1) {
                throw new StudentException('NAME cannot be blank, empty, null, or 1 character');
            } else {
                this.name = name;
            }
        } catch (Exception ex) {
            system.debug('catching null');
            throw new StudentException('NAME cannot be blank, empty, null, or 1 character...' + ex);
        }
    }
    public void show(){
        system.debug('age of student is ' + age);
        system.debug('name of student is ' + name);
    }
}
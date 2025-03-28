interface class Person{
  void walk(){print("Person walking");}
  void run(){print("Person running");}
}

class Student implements Person{
  @override
  void run() {print("Student running");}

  @override
  void walk() {print("Student walking");}
}

void main(){
  Person person0 = Person();
  Student student0 = Student();

  print("Person: ");
  person0.walk();
  person0.run();
  print("Student: ");
  student0.walk();
  student0.run();
}
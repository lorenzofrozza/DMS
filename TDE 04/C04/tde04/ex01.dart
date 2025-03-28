void main() {
  List<Map<String, dynamic>> jsonList = [
    {'name': 'Lorenzo', 'age': 20},
    {'name': 'Daniel', 'age': 27},
    {'name': 'Sonia', 'age': 55},
  ];

  List<Person> people = jsonList.map((json) => Person.fromJson(json)).toList();

  for (var person in people) {
    print('Name: ${person.name}, Age: ${person.age}');
  }
}

class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
    );
  }
}

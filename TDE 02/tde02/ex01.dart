import 'dart:io';
void main(){
  List<int> listOfNumbers = [];

  print(' -Enter five numbers- ');
  for(var i =1; i <=5; i++){
    stdout.write(' $i° number: ');
    var number = stdin.readLineSync();

    if (number != null && number.isNotEmpty) {
      listOfNumbers.add(int.parse(number));
    } else {
      print("Invalid input! Please enter a valid number.");
      i--;
    }
  };

  final sum = listOfNumbers.reduce((i, j) => i + j);
  double average = sum/listOfNumbers.length;
  print('\nAverage: $average');
}
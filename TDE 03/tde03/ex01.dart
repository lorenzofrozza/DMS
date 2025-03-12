//Crie uma calculadora simples que aceita dois números e uma operação (adição, subtração, multiplicação ou divisão) como entrada e retorna o resultado.

import 'dart:io';
void main(){
  print("- Calculator -");
  print('Operations: 1- Sum, 2- Subtraction, 3- Multiplication, 4- Division');
  int firstNumber = readInt("First number: ");
  int secondNumber = readInt("Second number: ");
  int pickOperation = readInt("Option: ");

  switch(pickOperation){
    case 1:
      sum(firstNumber, secondNumber);
      break;
    case 2:
      subtraction(firstNumber, secondNumber);
      break;
    case 3:
      multiplication(firstNumber, secondNumber);
      break;
    case 4:
      if(secondNumber == 0){
        print("Division by zero isnt allowed.");
      } else{
        division(firstNumber, secondNumber);
        break;
      }
      
  }
  //print(parsedNumber.runtimeType); #returns the type
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    int? number = int.tryParse(input ?? '');

    if (number != null) {
      return number;
    }
    print("Invalid number. Please try again.");
  }
}
void sum(int a, int b){
    print("Result of sum: ${a+b}");
}
void subtraction(int a, int b){
  print("Result of subtraction: ${a-b}");
}
void multiplication(int a, int b){
  print("Result of multiplication: ${a*b}");
}
void division(int a, int b){
  print("Result of division: ${a/b}");
}

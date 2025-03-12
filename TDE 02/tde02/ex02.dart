import 'dart:io';
void main(){
  print('Glossary: 1- Blue, 2- Red, 3- Green, 4- Yellow');
  stdout.write('Pick one: ');
  var number = stdin.readLineSync();

  stdout.write('Translation: ');
  switch(number) {
    case '1':
      print('Azul');
      break;
    case '2':
      print('Vermelho');
      break;
    case '3':
      print('Verde');
      break;
    case '4':
      print('Amarelo');
      break;
  }

}
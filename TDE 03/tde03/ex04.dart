/*4 - Escreva uma função que calcule a média.
*/
void main(){
  List<int> listOfNumbers = [1,2,3,5,3,9,3];
  calculateAverage(listOfNumbers);
}

void calculateAverage(List<int> numbers) {
  final sum = numbers.reduce((i, j) => i + j);
  double average = sum/numbers.length;
  print("Average: ${average.toStringAsFixed(2)}");
}

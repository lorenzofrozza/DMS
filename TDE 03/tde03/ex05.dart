/*5 - Escreva uma função que recebe uma
lista de inteiros e retorna uma nova lista
com apenas os números ímpares.
 */
void main(){
  List<int> listOfNumbers = [1,2,3,5,7,9,19];
  List<int> oddList = checkOdd(listOfNumbers);

  print("Old list: $listOfNumbers");
  print("Odd list: $oddList");

}

List<int> checkOdd(List<int> numbers) {
  return numbers.where((eachNum) => eachNum % 2 != 0).toList();
}

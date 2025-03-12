/*3- Escreva uma função que aceita uma lista de números
como entrada e retorna uma nova lista contendo
apenas os números pares da lista original.

 */
void main(){
  List<int> listOfNumbers = [1,2,3,5,7,9,11];
  List<int> evenList = checkEven(listOfNumbers);

  print("Old list: $listOfNumbers");
  print("Even list: $evenList");

}

List<int> checkEven(List<int> numbers) {
  return numbers.where((eachNum) => eachNum % 2 == 0).toList();
}

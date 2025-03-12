/*2 - Escreva uma função que aceita uma lista de números
como entrada e retorna uma nova lista onde cada elemento
é o dobro do elemento correspondente na lista original.
 */
void main(){
  List<int> listOfNumbers = [1,3,5,7,9,11];
  List<int> doubledList = doubleNumbers(listOfNumbers);

  print("Old list: $listOfNumbers");
  print("Doubled list: $doubledList");

}

List<int> doubleNumbers(List<int> numbers) {
  return numbers.map((eachNum) => eachNum * 2).toList();
}

import 'package:tde10/constants.dart';
import 'package:tde10/models/character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CharacterService {
  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$BASE_URL/character'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((item) => Character.fromJson(item)).toList();
    } else {
      throw Exception("Error when searching characters ");
    }
  }
}

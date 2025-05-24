import 'package:tde10/constants.dart';
import 'package:tde10/models/character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CharacterService {
  Future<List<List<Character>>> getAllCharacterPages() async {
    List<List<Character>> allPages = [];
    String? url = '$BASE_URL/character';

    while (url != null) {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List jsonResults = data['results'];
        allPages.add(jsonResults.map((item) => Character.fromJson(item)).toList());
        url = data['info']['next'];
      } else {
        throw Exception("Error when searching characters");
      }
    }

    return allPages;
  }
}

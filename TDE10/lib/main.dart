import 'package:flutter/material.dart';
import 'package:tde10/models/character.dart';
import 'package:tde10/services/character_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CharacterService service = CharacterService();

  late Future<List<Character>> _charactersFuture;
  late List<Character> _characters;
  late List<Character> _filteredCharacters;

  @override
  void initState() {
    super.initState();
    _charactersFuture = _getCharacters();
  }

  Future<List<Character>>_getCharacters() async{
    _characters = await service.getCharacters();
    _filteredCharacters = _characters;
    return _characters;
  }

  _filterCharacters(String filter){
    setState(() {
      _filteredCharacters = _characters.where((item) => item.name.toLowerCase().contains(filter.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text("Characters")
          ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
               TextField(
                onChanged: (value) {
                  _filterCharacters(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Filter"),
              ),
              FutureBuilder<List<Character>>(
                future: _charactersFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_filteredCharacters[index].name),
                            leading: Image.network(_filteredCharacters[index].image),
                          );
                        },
                        separatorBuilder: (context, int) {
                          return Divider();
                          },
                        itemCount: _filteredCharacters.length),
                      ),
                    );
                  }

                  if(snapshot.hasError) {
                    return Text("Error");
                  }

                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

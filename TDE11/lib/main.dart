import 'package:flutter/material.dart';
import 'package:tde10/models/character.dart';
import 'package:tde10/screens/character_details.dart';
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

  late Future<List<List<Character>>> _allCharactersFuture;
  late List<List<Character>> _allPages;
  int _currentPageIndex = 0;
  List<Character> _filteredCharacters = [];

  @override
  void initState() {
    super.initState();
    _allCharactersFuture = _loadAllCharacters();
  }

  Future<List<List<Character>>> _loadAllCharacters() async {
    _allPages = await service.getAllCharacterPages();
    _filteredCharacters = _allPages[_currentPageIndex];
    return _allPages;
  }

  void _filterCharacters(String filter) {
    setState(() {
      _filteredCharacters = _allPages[_currentPageIndex]
          .where((item) => item.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  void _nextPage() {
    if (_currentPageIndex < _allPages.length - 1) {
      setState(() {
        _currentPageIndex++;
        _filteredCharacters = _allPages[_currentPageIndex];
      });
    }
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      setState(() {
        _currentPageIndex--;
        _filteredCharacters = _allPages[_currentPageIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Characters")),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  _filterCharacters(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Filter"),
              ),
              FutureBuilder<List<List<Character>>>(
                future: _allCharactersFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Expanded(
                            child: ListView.separated(
                              itemCount: _filteredCharacters.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                final character = _filteredCharacters[index];

                                return ListTile(
                                  title: Text(character.name),
                                  leading: Image.network(character.image),
                                  trailing: IconButton(
                                    icon: Icon(Icons.info_outline),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CharacterDetailScreen(characterId: character.id),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: _currentPageIndex > 0 ? _previousPage : null,
                                child: Text('< Previous page'),
                              ),
                              Text('Page ${_currentPageIndex + 1}'),
                              ElevatedButton(
                                onPressed: _currentPageIndex < _allPages.length - 1
                                    ? _nextPage
                                    : null,
                                child: Text('Next page >'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Text("Error when load characters");
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


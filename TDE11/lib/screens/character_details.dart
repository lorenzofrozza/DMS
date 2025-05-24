import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CharacterDetailScreen extends StatefulWidget {
  final int characterId;

  const CharacterDetailScreen({Key? key, required this.characterId}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  Map<String, dynamic>? characterData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCharacterDetails();
  }

  Future<void> fetchCharacterDetails() async {
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character/${widget.characterId}'),
    );

    if (response.statusCode == 200) {
      setState(() {
        characterData = json.decode(response.body);
        isLoading = false;
      });
    } else {
      // Handle errors
      setState(() {
        isLoading = false;
      });
      print('Failed to load character details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Details'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : characterData == null
          ? Center(child: Text('Error loading character data.'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(characterData!['image']),
              SizedBox(height: 20),
              Text(
                characterData!['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Status: ${characterData!['status']}'),
              Text('Species: ${characterData!['species']}'),
              Text('Gender: ${characterData!['gender']}'),
              Text('Origin: ${characterData?['origin']?['name'] ?? 'Unknown'}'),
            ],
          ),
        ),
      ),
    );
  }
}

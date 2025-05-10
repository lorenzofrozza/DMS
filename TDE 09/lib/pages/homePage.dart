import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tde09/widgets/languages_widget.dart';

class HomePage extends StatefulWidget {
  final dynamic title;
  const HomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _HomePage();
}


class _HomePage extends State<HomePage> {
  late Color _appBarColor;
  late Color _appBarTextColor;
  final TextEditingController _controller = TextEditingController();
  String _filter = "";

  _changeColorAppBar(){
    _appBarColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _appBarTextColor = Colors.black;
  }
  _darkLightMode(){
    if(_appBarColor != Colors.black){
      _appBarColor = Colors.black;
      _appBarTextColor = Colors.white;
    } else {
      _appBarColor = Colors.white;
      _appBarTextColor = Colors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    _appBarColor = Colors.yellowAccent;
    _appBarTextColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: _appBarColor,
            title: Text(
              widget.title,
              style: TextStyle(color: _appBarTextColor),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _changeColorAppBar();
                  });
                },
                icon: Icon(Icons.color_lens_rounded),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _darkLightMode();
                  });
                },
                icon: Icon(Icons.dark_mode),
              ),
            ],

          ),

          body: Languages(
            filter: _filter,),
          bottomSheet: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: (text) {
                      _controller.text = text;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Filter",
                        label: Text("Filter"),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    _filter = _controller.text;
                  });
                }, child: Text("Filter")
                )
              ],
          ),
          ),
        ),
      );
    }
}
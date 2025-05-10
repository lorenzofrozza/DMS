import 'dart:math';

import 'package:flutter/material.dart';

List<String> languages = [
  'Dart',
  'JavaScript',
  'TypeScript',
  'Python',
  'Java',
  'Kotlin',
  'Swift',
  'C',
  'C++',
  'C#',
  'Go',
  'Rust',
  'PHP',
  'Ruby',
  'Scala',
  'Perl',
  'Objective-C',
  'SQL',
  'HTML',
  'CSS',
  'R',
  'MATLAB',
  'Shell',
];
List<String> subTitleLanguages = [
  "The language that transformed programming forever.",
  "Simple, powerful, and unbeatable.",
  "Where efficiency meets elegance.",
  "The choice for those who think about the future.",
  "Built to create without limits.",
  "Master the digital world with ease.",
  "Designed by geniuses, used by visionaries.",
  "Where every line makes a difference.",
  "The revolution in code form.",
  "When performance truly matters.",
  "Lightweight, fast, and simply brilliant.",
  "The gold standard of modern programming.",
  "A new era begins with it.",
  "Clean code, free mind.",
  "Simplicity and power in perfect harmony.",
  "The natural evolution of languages.",
  "For those who seek excellence in every project.",
  "More than a language: an experience.",
  "Where creativity becomes reality.",
  "From developer to developer, the best choice.",
  "Clarity, speed, and absolute power.",
  "Developed for those who demand the best.",
  "Innovation in every command.",
  "Write less, create much more.",
  "A new standard of perfection.",
  "Inspires creativity, drives results.",
  "Less complexity, more achievements.",
  "Once you know it, you never go back.",
  "Designed for the next generation of creators.",
  "The language that makes anything possible."
];

class Languages extends StatefulWidget {
  final String filter;
  const Languages({super.key, required this.filter});

  _filterLanguages () {
    return languages.where((element) => element.toLowerCase().contains(filter.toLowerCase())).toList();
  }

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {

  List<String> languagesFiltered = [];

  @override
  void didUpdateWidget(covariant Languages oldWidget) {
    if (oldWidget.filter != widget.filter) {
      languagesFiltered = widget._filterLanguages();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    languagesFiltered = widget._filterLanguages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int indexLanguages){
            return ListTile(
              leading: Icon(Icons.rocket_launch_outlined),
              title: Text(languagesFiltered[indexLanguages]),
              subtitle: Text(subTitleLanguages[Random().nextInt(subTitleLanguages.length)]),
            );
      },
          separatorBuilder: (BuildContext context, int indexLanguages){
            return const Divider();
      },
          itemCount: languagesFiltered.length),
    );
  }
}

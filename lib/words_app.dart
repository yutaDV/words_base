import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/themes/themes.dart';
import '/ui/widget/logo.dart';

class WordsApp extends StatefulWidget {
  @override
  _WordsAppState createState() => _WordsAppState();
}

class _WordsAppState extends State<WordsApp> {
  List<String> words = [];

  TextEditingController wordController = TextEditingController();
  String selectedLanguage = "Українська";
  int selectedDifficulty = 1;

  void addWord() {
    String newWord = wordController.text;

    if (newWord.isNotEmpty) {
      words.add("Слово: $newWord, Мова: $selectedLanguage, Складність: $selectedDifficulty");
      wordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
        children: [
          const SizedBox(width: 20),
          const Logo(size: 40),
          const SizedBox(width: 20),
          const Logo(size: 40),
          const SizedBox(width: 20),
          const Logo(size: 40),
          const SizedBox(width: 50),Text(
            'База слів для гри',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          ],
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(size: 150),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 50),
                  Expanded(
                    child: TextField(
                      controller: wordController,
                      decoration: const InputDecoration(labelText: 'Слово'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  DropdownButton<String>(
                    value: selectedLanguage,
                    items: ['Українська', 'English'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  DropdownButton<int>(
                    value: selectedDifficulty,
                    items: [1, 2, 3].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        selectedDifficulty = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: addWord,
                    child: const Text('Додати слово'),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

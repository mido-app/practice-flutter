import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/*
 * This widget was created with reference to this page
 * https://flutter.dev/docs/get-started/codelab
 */
class SuggestWordListPage extends StatelessWidget {
  static const route = '/getting-start';

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Getting Start(Startup Name Generator)',
    //   theme: ThemeData(
    //     primaryColor: Colors.orangeAccent
    //   ),
    //   home: RandomWords()
    // );
    return RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _savedWordPair = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _savedWordPair.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordPair.remove(wordPair);
          } else {
            _savedWordPair.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _savedWordPair.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont
                ),
              );
            }
          );

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved suggestions'),
            ),
            body: ListView(children: divided),
          );
        }
      )
    );
  }
}
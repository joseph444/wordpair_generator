import 'package:english_words/english_words.dart';
import "package:flutter/material.dart";
import 'package:wordpair_generator/components/WordRow.dart';
import 'package:wordpair_generator/screens/favorites.dart';

class Random_Word extends StatefulWidget {
  @override
  _Random_WordState createState() => _Random_WordState();
}

class _Random_WordState extends State<Random_Word> {
  final _RandomWords = <WordPair>[];
  final _FavoriteWords = Set<WordPair>();

  Widget buildList() {
    return ListView.builder(itemBuilder: (context, item) {
      if (item.isOdd) {
        return Divider();
      }
      int index = item ~/ 2;
      if (_RandomWords.length >= index) {
        _RandomWords.addAll(generateWordPairs().take(2));
      }

      return wordRow(
        word: _RandomWords[index],
        favoriteList: this._FavoriteWords,
        callback: () {
          setState(() {
            if (this._FavoriteWords.contains(this._RandomWords[index])) {
              this._FavoriteWords.remove(this._RandomWords[index]);
            } else {
              this._FavoriteWords.add(this._RandomWords[index]);
            }
          });
        },
      );
    });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _FavoriteWords.map((WordPair word) {
        return ListTile(
            tileColor: Colors.white70,
            title: Text(
              word.asPascalCase,
            ));
      });
      final List<Widget> divider =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return FavoriteList(favorite: divider);
    }));
  }

  @override
  Widget build(BuildContext context) {
    //final word = WordPair.random();
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
          centerTitle: true,
          title: Text("Hello World",
              style: TextStyle(fontSize: 30.2, fontWeight: FontWeight.w100))),
      body: buildList(),
    );
  }
}

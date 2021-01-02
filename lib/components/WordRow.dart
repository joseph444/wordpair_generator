import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class wordRow extends StatefulWidget {
  final WordPair word;
  var favoriteList = Set<WordPair>();
  final VoidCallback callback;
  wordRow(
      {Key key,
      @required this.word,
      @required this.favoriteList,
      @required this.callback})
      : super(key: key);

  @override
  _wordRowState createState() => _wordRowState();
}

class _wordRowState extends State<wordRow> {
  @override
  Widget build(BuildContext context) {
    final alreadySaved = widget.favoriteList.contains(widget.word);
    final _Icon = alreadySaved ? Icons.favorite : Icons.favorite_border;
    final _color = alreadySaved ? Colors.red : Colors.grey;

    return ListTile(
      tileColor: Colors.white70,
      title: Text(
        widget.word.asPascalCase,
      ),
      trailing: IconButton(
          icon: Icon(
            _Icon,
            color: _color,
          ),
          onPressed: widget.callback),
    );
  }
}

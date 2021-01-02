import 'package:flutter/material.dart';

class FavoriteList extends StatefulWidget {
  final favorite;
  FavoriteList({Key key, @required this.favorite}) : super(key: key);
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WordPair Generator")),
      body: ListView(
        children: widget.favorite,
      ),
    );
  }
}

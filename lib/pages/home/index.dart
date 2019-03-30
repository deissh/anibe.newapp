import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      title: Text('Главная'),
      actions: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'login',
          ),
          onPressed: () {
          },
        ),
        new IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'login',
          ),
          onPressed: () {
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: CustomScrollView(
        slivers: <Widget>[
          
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SimpleTitleBar extends StatelessWidget {

  String title;

  SimpleTitleBar(this.title);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          tooltip: 'Navigation menu',
          color: Colors.white,
          onPressed: null),
      iconTheme: new IconThemeData(color: Colors.white),
      title: new Text(title),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.search), tooltip: 'search', onPressed: null)
      ],
    );
  }
}
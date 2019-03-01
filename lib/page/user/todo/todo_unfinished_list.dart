import 'package:flutter/material.dart';

class TodoUnfinishedList extends StatefulWidget {

  @override
  _TodoUnfinishedListState createState() => _TodoUnfinishedListState();
}

class _TodoUnfinishedListState extends State<TodoUnfinishedList> {

  var callback;
  int type;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('未完成:type$type'),
    );
  }

  void onTypeChanged(int type){
    setState(() {
      this.type = type;
    });
  }
}

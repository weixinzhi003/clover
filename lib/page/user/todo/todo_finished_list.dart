import 'package:flutter/material.dart';

class TodoFinishedList extends StatefulWidget {

  int type;
  ValueChanged<int> onTypeChanged;

  @override
  _TodoFinishedListState createState() => _TodoFinishedListState();
}

class _TodoFinishedListState extends State<TodoFinishedList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('已完成'),
    );
  }
}

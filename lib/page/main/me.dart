import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/util/router_util.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.orange,
        ),
        InkWell(
          child: Text('todo'),
          onTap: (){
            RouterUtil.openRouter(context, TodoHome());
          },
        )
      ],
    );
  }
}

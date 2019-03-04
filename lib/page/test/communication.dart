import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ChildWidget(
            callback: (msg) {
              setState(() {
                this.msg = msg;
              });
            },
          ),
          Text('msg:$msg')
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  Function callback;

  ChildWidget({this.callback});

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  TextEditingController controller;
  Function callback;

  @override
  void initState() {
    super.initState();
    controller = new TextEditingController();
    callback = this.widget.callback;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
        ),
        RaisedButton(
          onPressed: () {
            callback(controller.text);
          },
          child: Text('向父组件传递msg'),
        )
      ],
    );
  }
}

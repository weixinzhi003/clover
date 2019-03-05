import 'package:flutter/material.dart';

class TestInheritPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ParentBox(),
          ChildBox()
        ],
      ),
    );
  }
}


class ParentBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(getContent()),
    );
  }

  @protected
  String getContent(){
    return 'parent';
  }
}

class ChildBox extends ParentBox{

  @override
  String getContent() {
    return 'Child';
  }
}

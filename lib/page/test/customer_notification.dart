import 'package:flutter/material.dart';

class CustomerNotification extends Notification{

  CustomerNotification(this.msg);

  String msg;
}

class NotifyTestWidget extends StatefulWidget {
  @override
  _NotifyTestWidgetState createState() => _NotifyTestWidgetState();
}

class _NotifyTestWidgetState extends State<NotifyTestWidget> {

  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NotificationListener<CustomerNotification>(
            onNotification: (notification){
              setState(() {
                _msg += notification.msg + ",";
              });
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                   onPressed: () => CustomerNotification("Hello NotificationStudy").dispatch(context),
                   child: Text("Send Notification"),
                  ),
                  Builder(
                    builder: (context) {
                      return RaisedButton(
                        //按钮点击时分发通知
                        onPressed: () => CustomerNotification("Hello NotificationStudy").dispatch(context),
                        child: Text("Builder Send Notification"),
                      );
                    },
                  ),
                  Text(_msg)
                ],
              ),
            )
        ),
      ),
    );
  }
}



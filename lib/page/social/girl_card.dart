import 'package:clover/entity/user/user.dart';
import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class GirlCard extends StatelessWidget {
  User user;

  GirlCard(this.user);

  TextStyle styleBtnText;
  TextStyle styleUserText;

  @override
  Widget build(BuildContext context) {
    styleBtnText = new TextStyle(color: Colors.white, fontSize: 14);

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new ConstrainedBox(
            /*child: CachedNetworkImage(
              imageUrl: user.avatar,
              placeholder: (context, url) => new Center(
                child: new CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              fit: BoxFit.cover,
            ),*/
            child:Text("defaultImgAssestName, fit: BoxFit.cover"),
            constraints: BoxConstraints.expand(),
          ),
          new Positioned(
            child: new Container(
              /*decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)],
                begin: FractionalOffset(1, 0),
                  end: FractionalOffset(0, 1)
              )
            ),*/
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: 45,
                        height: 45,
                        foregroundDecoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.5)),
                            border: new Border.all(color: Colors.white)),
                        /*child: new ClipOval(
                          child: new CachedNetworkImage(
                            imageUrl: user.avatar,
                            errorWidget: Icon(Icons.account_circle),
                          ),
                        ),*/
                        child:Text("CachedNetworkImage"),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          user.username,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 0, left: 55),
                    child: Text(
                      user.intro,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            bottom: 15,
            right: 70,
            left: 15,
          ),
          new Positioned(
            right: 10,
              bottom: 10,
              child: new Column(
            children: <Widget>[
              new ActionBtn(user.fansCount.toString(), "images/item_like_n.png", () {
                print("likedCount");
              }),
              new ActionBtn(user.followCount.toString(), "images/favorite_n.png", (){
                print("followedCount");
              }),
              new ActionBtn("分享", "images/item_share.png", () {
                print("分享");
              })
            ],
          ))
        ],
      ),
    );
  }
}

class ActionBtn extends StatefulWidget {
  String text;
  String normalIconPath;
  String selectedIconPath;
  GestureTapCallback onTap;

  ActionBtn(this.text, this.normalIconPath, this.onTap,
      {String selectedIconPath});

  @override
  State<StatefulWidget> createState() {
    return ActionBtnState();
  }
}

class ActionBtnState extends State<ActionBtn> {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
        child: new Column(
          children: <Widget>[
            Image.asset(
              this.widget.normalIconPath,
              width: 25,
              height: 25,
            ),
            new Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                this.widget.text,
                style: new TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ],
        ),
      ),
      onTap: this.widget.onTap,
    );
  }
}

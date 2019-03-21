import 'package:clover/entity/user/user.dart';
import 'package:clover/net/api_urls.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/net/service/login_service.dart';
import 'package:clover/page/login/register.dart';
import 'package:clover/util/router_util.dart';
import 'package:clover/util/user_util.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  GlobalKey<FormState> _loginFormKey = new GlobalKey();

  FocusNode accountNode = FocusNode();
  FocusNode pswNode = FocusNode();

  TextEditingController phoneController = new TextEditingController();
  TextEditingController pswController = new TextEditingController();

  String pandaResName = 'images/panda_normal.png'; //熊猫图片的地址名称

  String account;
  String psw;

  @override
  void initState() {
    super.initState();
    accountNode.addListener(onTextFieldChange);
    pswNode.addListener(onTextFieldChange);

    eventBus.on<OnRegisterEvent>().listen((event){
      RouterUtil.back(context);
    });
  }

  void onTextFieldChange() {
    setState(() {
      if (accountNode.hasFocus) {
        pandaResName = 'images/panda_hello.png';
      } else if (pswNode.hasFocus) {
        pandaResName = 'images/panda_sleep.png';
      } else {
        pandaResName = 'images/panda_normal.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 55),
                child: Image.asset(
                  pandaResName,
                  width: 125,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              new Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 30),
                  child: new Form(
                    key: _loginFormKey,
                    child: new Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          focusNode: accountNode,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            icon: Icon(Icons.phone),
                            labelText: '请输入你的账号',
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "账号不能为空";
                            }
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                            FocusScope.of(context)
                                .requestFocus(pswNode); //让密码输入框获取焦点
                          },
                          onSaved: (value) {
                            account = value;
                          },
                          controller: phoneController,
                        ),
                        TextFormField(
                          focusNode: pswNode,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0.5)),
                            contentPadding: EdgeInsets.all(10.0),
                            icon: Icon(Icons.lock),
                            labelText: '请输入密码',
                          ),
                          textInputAction: TextInputAction.done,
                          controller: pswController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "密码不能为空";
                            }
                          },
                          onSaved: (value) {
                            psw = value;
                          },
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: new InkWell(
                            child: new Container(
                                width: 280,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: new Center(
                                  child: new Text(
                                    '登录',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )),
                            onTap: () {
                              onLoginClick();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7),
                              child: Text(
                                '注册账号',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                            ),
                            onTap: (){
                              RouterUtil.openRouter(context, Register());
                            },
                          ),
                        )
                      ],
                    ),
                  )),
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    new Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('第三方登录'),
                    ),
                    new Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Image.asset('images/share_platform_wechat.png'),
                        onPressed: () {
                          print('微信登录');
                        }),
                    new Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: IconButton(
                          icon: Image.asset('images/share_platform_qq.png'),
                          onPressed: () {
                            print('QQ登录');
                            phoneController.selection =
                                TextSelection.collapsed(offset: 0);
                          }),
                    ),
                    IconButton(
                        icon: Image.asset('images/share_platform_sina.png'),
                        onPressed: () {
                          print('微博登录');
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void onLoginClick() {
    var form = _loginFormKey.currentState;
    if (form.validate()) {
      form.save();
      LoginService.login(account, psw, (json) {
        User user = User.fromJson(json);
        user.password = psw;
        UserUtil.onLogin(context, user);
        RouterUtil.back(context);
      });
    }
  }
}

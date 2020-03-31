import 'package:data_plugin/bmob/bmob.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/work01/info.dart';
import 'package:flutterapp/work01/password.dart';
import 'package:flutterapp/work01/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    InfoPage.tag: (context) => InfoPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    PasswordPage.tag: (context) => PasswordPage(),
  };

  @override
  Widget build(BuildContext context) {
    Bmob.init("https://api2.bmob.cn", "486892a74f6ce4c1dffc5ecf9a7700d7",
        "0ab358c02de6b3b72baa88ce3faa80a0");
    // TODO: implement build
    return new MaterialApp(
      title: 'LOGIN_PAGE',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new LoginPage(),
      routes: routes,
    );
  }
}

/// 登入Widget
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

/// 登入布局
class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _remember = false;
  String _email = '';
  String _password = '';

  ///查询一条数据
//  _querySingle(BuildContext context) {
//    if (currentObjectId != null) {
//      BmobQuery<Blog> bmobQuery = BmobQuery();
//      bmobQuery.setInclude("author");
//      bmobQuery.queryObject(currentObjectId).then((data) {
//        Blog blog = Blog.fromJson(data);
//        showSuccess(context,
//            "查询一条数据成功：${blog.title} - ${blog.content} - ${blog.author.username}");
//      }).catchError((e) {
//        showError(context, BmobError.convert(e).error);
//      });
//    } else {
//      showError(context, "请先新增一条数据");
//    }
//  }

  ///用户名和密码登录
  _login(BuildContext context) {
    BmobUser bmobUserRegister = BmobUser();
    bmobUserRegister.username = _email;
    bmobUserRegister.password = _password;
    bmobUserRegister.login().then((BmobUser bmobUser) {
//      showSuccess(context, bmobUser.getObjectId() + "\n" + bmobUser.username);
      Fluttertoast.showToast(
          msg: "登入成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.of(context).pushNamed(InfoPage.tag);
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: "登入失败,请检查用户名密码",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
//      showError(context, BmobError.convert(e).error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LOGIN'),
        actions: <Widget>[],
      ),
      body: new Center(
        child: new Container(
          margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: ListView(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 140, right: 100),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('images/mikey_image.jpeg'),
                    ),
                  )
                ],
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.account_circle),
                  hintText: '请输入用户名',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '用户名不能为空';
                  }
                  return value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key),
                  hintText: '请输入密码',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '密码不能为空';
                  }
                  return value;
                },
              ),
              new Row(
                children: <Widget>[
                  new Checkbox(
                    value: _remember,
                    activeColor: Colors.red,
                    onChanged: (bool val) {
                      // val 是布尔值
                      this.setState(() {
                        this._remember = !this._remember;
                      });
                    },
                  ),
                  new Text('记住密码'),
                  new Container(
                    margin: EdgeInsets.only(left: 190),
                    child: new GestureDetector(
                      child: new Text('忘记密码'),
                      onTap: () {
                        Navigator.of(context).pushNamed(PasswordPage.tag);
                      },
                    ),
                  )
                ],
              ),
              new Container(
                margin: const EdgeInsets.only(left: 30, right: 20),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          padding: EdgeInsets.only(left: 130, right: 130),
                          onPressed: () {
//                            if (_formKey.currentState.validate()) {
                          _login(context);
//                            }
                          },
                          child: Text('登   入'),
                        ),
                      ],
                    ),
                    new Row(children: <Widget>[
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(left: 130, right: 130),
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterPage.tag);
                        },
                        child: Text('注   册'),
                      ),
                    ]),
                    new Row(
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.brown,
                          padding: EdgeInsets.only(left: 130, right: 130),
                          onPressed: () {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
                              // Process data.
                              Navigator.of(context).pushNamed(RegisterPage.tag);
                            }
                          },
                          child: Text('注   销'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.only(bottom: 3, left: 100, top: 150),
                child: Text('Power by MIKEY use flutter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

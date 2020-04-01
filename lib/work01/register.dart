import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {

  String _username = '';

  String _password = '';

  String _confirmPassword = '';

  bool verifyPassword() {
    if (this._password == ''||this._confirmPassword==''||this._username=='') {
      Fluttertoast.showToast(
          msg: "请输入完整信息",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    if (this._password != this._confirmPassword) {
      Fluttertoast.showToast(
          msg: "两次输入密码不一致,请重新输入",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }

  ///用户名密码注册
  _register() {
    BmobUser bmobUserRegister = BmobUser();
    if (verifyPassword()) {
      bmobUserRegister.username = _username;
      bmobUserRegister.password = _password;
      bmobUserRegister.register().then((BmobRegistered data) {
        Fluttertoast.showToast(
            msg: "注册成功,返回登入",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/');
      }).catchError((e) {
        print(e);
      });
    }
  }

  ///查询一条数据
  _querySingle(BuildContext context) {
    BmobQuery<BmobUser> bmobQuery = BmobQuery();
    bmobQuery.addWhereEqualTo("username", this._username);
    bmobQuery.queryUsers().then((data) {
      if (data.length > 0) {
        Fluttertoast.showToast(
            msg: "用户名已存在",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).catchError((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
//        leading: new IconButton(icon: new Icon(Icons.menu),tooltip: 'Navigation menu', onPressed: null),
        title: new Text('REGISTER'),
        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.search),tooltip: 'Search', onPressed: null)
        ],
      ),
      body: new Center(
        child: new Container(
          margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: ListView(
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.account_circle),
                  hintText: '请输入用户名',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '用户名不能为空';
                  }
                  return null;
                },
                onChanged: (String value) {
                  this._username = value;
                  _querySingle(context);
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key),
                  hintText: '请输入密码',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '密码不能为空';
                  }
                  return null;
                },
                onChanged: (String value) {
                  this._password = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key),
                  hintText: '请输入确认密码',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '确认密码不能为空';
                  }
                  return null;
                },
                onChanged: (String value) {
                  this._confirmPassword = value;
                },
              ),
              new Container(
                margin: const EdgeInsets.only(left: 30, right: 20, top: 50),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          padding: EdgeInsets.only(left: 130, right: 130),
                          onPressed: () {
                            _register();
                          },
                          child: Text('确   认'),
                        ),
                      ],
                    ),
                    new Row(children: <Widget>[
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(left: 130, right: 130),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/');
                        },
                        child: Text('取   消'),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User extends BmobUser{
  String password;
  String username;
  String objectId;
}

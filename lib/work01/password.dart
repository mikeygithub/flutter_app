import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_handled.dart';
import 'package:data_plugin/bmob/response/bmob_updated.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/work01/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordPage extends StatefulWidget {
  static String tag = 'passwrod-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PasswordPageState();
  }
}

class PasswordPageState extends State<PasswordPage> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PASSWORD'),
        actions: <Widget>[],
      ),
      body: new Center(
        child: new Container(
          margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: ListView(
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.account_circle),
                  hintText: '请输入邮箱',
                ),
                onChanged: (String value) {
                  this._email = value;
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
                            submitFormData();
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

  //提交数据
  void submitFormData() {
    //检查用户是否存在
    BmobQuery<BmobUser> bmobQuery = BmobQuery();
    bmobQuery.addWhereEqualTo("email", this._email);
    bmobQuery.queryUsers().then((data) {
      if (data.length < 1) {
        Fluttertoast.showToast(
            msg: "用户名或密码错误",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
       _sendEmail(context);
      }
    }).catchError((e) {
      print(e);
    });
  }

  _sendEmail(BuildContext context) {
    BmobUser bmobUser = BmobUser();
    bmobUser.email = _email;
    bmobUser.requestPasswordResetByEmail().then((BmobHandled bmobHandled) {
      Fluttertoast.showToast(
          msg: "已经发送邮件",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((e) {
      showError(context, BmobError.convert(e).error);
    });
  }
}

import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_updated.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/work01/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordPage extends StatefulWidget{

  static String tag = 'passwrod-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PasswordPageState();
  }
}
class PasswordPageState extends State<PasswordPage>{

  String _username = '';
  String _oldPassword = '';
  String _newPassword = '';
  String _comfirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PASSWORD'),
        actions: <Widget>[
        ],
      ),
      body: new Center(
        child: new Container(
          margin: const EdgeInsets.only(top: 100,left: 30,right: 30),
          child: ListView(
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.account_circle),
                  hintText: '请输入用户名',
                ),
                onChanged: (String value){
                  this._username = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key),
                  hintText: '请输入旧密码',
                ),
                onChanged: (String value){
                  this._oldPassword = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key),
                  hintText: '请输入密码',
                ),
                onChanged: (String value){
                  this._newPassword = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key),
                  hintText: '请输入确认密码',
                ),
                onChanged: (String value){
                  this._comfirmPassword = value;
                },
              ),
              new Container(
                margin: const EdgeInsets.only(left: 30,right: 20,top: 50),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          padding: EdgeInsets.only(left: 130,right: 130),
                          onPressed: () {
                            submitFormData();
                          },
                          child: Text('确   认'),
                        ),
                      ],
                    ),
                    new Row(
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.red,
                            padding: EdgeInsets.only(left: 130,right: 130),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/');
                            },
                            child: Text('取   消'),
                          ),]),
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
    if(verifyFormData()){
      //检查用户是否存在
      BmobQuery<BmobUser> bmobQuery = BmobQuery();
      bmobQuery.addWhereEqualTo("username", this._username);
      bmobQuery.addWhereEqualTo("password", this._oldPassword);
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
        }else{///更新密码
          List<BmobUser> users = data.map((i) => BmobUser.fromJson(i)).toList();
          BmobUser user = users[0];
          user.password = this._newPassword;
          user.update().then((BmobUpdated bmobUpdated){
//            Fluttertoast.showToast(
//                msg: "修改成功",
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.CENTER,
//                timeInSecForIosWeb: 1,
//                backgroundColor: Colors.blue,
//                textColor: Colors.white,
//                fontSize: 16.0);
          });
//          Navigator.of(context).pushNamed('/');
        }
      }).catchError((e) {
        print(e);
      });
    }
  }
  //验证信息
  bool verifyFormData() {
    //非空
    if(_username == ''||_oldPassword==''||_newPassword==''||_comfirmPassword=='') {
      Fluttertoast.showToast(
          msg: "请完整填写信息",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    //密码一致检测
    if(_newPassword!=_comfirmPassword){
      Fluttertoast.showToast(
          msg: "两次输入密码不一致",
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
}

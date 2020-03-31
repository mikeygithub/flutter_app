import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget{

  static String tag = 'register-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RegisterPageState();
  }
}
class RegisterPageState extends State<RegisterPage>{
  final _formKey = GlobalKey<FormState>();

  ///保存用户
  ///保存一条数据
//  _saveSingle(BuildContext context) {
//    BmobUser bmobUser = BmobUser();
//    bmobUser.objectId = "7c7fd3afe1";
//    Blog blog = Blog();
//    blog.title = "博客标题";
//    blog.content = "博客内容";
//    blog.author = bmobUser;
//    blog.like = 77;
//    blog.save().then((BmobSaved bmobSaved) {
//      String message =
//          "创建一条数据成功：${bmobSaved.objectId} - ${bmobSaved.createdAt}";
//      currentObjectId = bmobSaved.objectId;
//      showSuccess(context, message);
//    }).catchError((e) {
//      showError(context, BmobError.convert(e).error);
//    });
//  }

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
          margin: const EdgeInsets.only(top: 100,left: 30,right: 30),
          child: Column(
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
                  return null;
                },
              ),
              TextFormField(
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
                            if (_formKey.currentState.validate()) {
                            }
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
}

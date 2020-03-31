import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Action {
  Ok,
  Cancel
}
class PasswordPage extends StatefulWidget{

  static String tag = 'passwrod-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PasswordPageState();
  }
}
class PasswordPageState extends State<PasswordPage>{
  final _formKey = GlobalKey<FormState>();
  String _choice = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,//// user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('是否删除?'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
            ),
            FlatButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.pop(context, Action.Ok);
              },
            ),
          ],
        );
      },
    );

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
//        leading: new IconButton(icon: new Icon(Icons.menu),tooltip: 'Navigation menu', onPressed: null),
        title: new Text('PASSWORD'),
        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.search),tooltip: 'Search', onPressed: null)
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
                  hintText: '请输入旧密码',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '旧密码不能为空';
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
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                // Process data.
                              }
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

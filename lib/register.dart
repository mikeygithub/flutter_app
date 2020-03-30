import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'LOGIN_PAGE',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}
/// 登入Widget
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}
/// 登入布局
class LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
//        leading: new IconButton(icon: new Icon(Icons.menu),tooltip: 'Navigation menu', onPressed: null),
        title: new Text('LOGIN'),
        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.search),tooltip: 'Search', onPressed: null)
        ],
      ),
      body: new Center(
        child: new Container(
          margin: const EdgeInsets.only(top: 100,left: 30,right: 30),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 72.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/bunder.jpeg'),
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
              new Row(
                children: <Widget>[
                  new Checkbox(value: false, onChanged: null,activeColor: Colors.red,),
                  new Text('记住密码'),
                  new Padding(
                    padding: EdgeInsets.only(right: 0,left: 190.0),
                    child: new Text('忘记密码'),
                  )
                ],
              ),
              new Container(
                margin: const EdgeInsets.only(left: 30,right: 20),
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
                          child: Text('登   入'),
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
                            child: Text('注   册'),
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

import 'package:flutter/material.dart';
import 'package:flutterapp/work01/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPage extends StatefulWidget {

  static String tag = 'info-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {

  String username = '';


  @override
  void initState() {
    getUserName();
  }

  getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.username = prefs.getString(LoginPage.info);
  }

  @override
  Widget build(BuildContext context) {
    print('Get Name:'+this.username);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('INFO'),
          actions: <Widget>[],
        ),
        body: new Center(
            child: new Container(
          margin: EdgeInsets.only(left: 50,right: 50),
          child: new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(top: 50),
                height: 60,
                child:
                new Text('USER_NAME:$username') ,
              ),
              new Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 130, right: 130),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: Text('注   销'),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}

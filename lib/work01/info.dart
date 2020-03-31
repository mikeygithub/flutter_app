import 'package:flutter/material.dart';
import 'package:flutterapp/work01/login.dart';

class InfoPage extends StatefulWidget {

  static String tag = 'info-page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
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
                new Text('USER_NAME') ,
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

// button的学习

/*
FlatBottom
RaisedButton
IconButton
OutlineButton
*/

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮学习"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // FlatB()
            Account(),
            CircleIndicator(),
          ],
        ),
      ),
    );
  }
}

// 账户

// class Account extends StatelessWidget {
//   @override

// }

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.lightBlue),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextField(
        style: TextStyle(color: Colors.lightBlue, fontSize: 28),
        obscureText: hidePassword, // password
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.account_circle,
                size: 48,
                color: Colors.lightBlue,
              ),
            ),
            hoverColor: Colors.red,
            labelText: "账号",
            labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 18),
            border: InputBorder.none,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                 hidePassword = !hidePassword; 
                });
              },
              child: Icon(Icons.home),
            )),
      ),
    );
  }
}

// 扁平化按钮
class FlatB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: RaisedButton(
        elevation: 8,
        onPressed: () {},
        child: Text(
          "FlatButton",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        splashColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
    );
  }
}




class CircleIndicator extends StatefulWidget {
  @override
  _CircleIndicatorState createState() => _CircleIndicatorState();
}

class _CircleIndicatorState extends State<CircleIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: CircularProgressIndicator(
        backgroundColor:Colors.grey,
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
    );
  }
}
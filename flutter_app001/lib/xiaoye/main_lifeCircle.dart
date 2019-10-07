// 生命周期

import "package:flutter/material.dart";

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _count = 0;

  void increase(){
    setState(() {
      _count++;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    print("reassemble");
    super.reassemble();
  }


  @override
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_count.toString()),
            RaisedButton(
              onPressed: increase,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
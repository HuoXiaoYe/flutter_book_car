import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text("表单练习"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                // prefix: Icon(Icons.home),
                decoration: InputDecoration(
                  // prefix: Icon(Icons.home),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.yellow),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: "你好",
                  labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                  // hintText: "fdasssss",
                  // helperText: "fadssdaf",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.pink)),
                child: EditableText(
                    showCursor: true,
                    focusNode: FocusNode(),
                    controller: myController,
                    style: TextStyle(),
                    cursorColor: Colors.red,
                    backgroundCursorColor: Colors.blue),
              ),
              EditableText(
                    showCursor: true,
                    focusNode: FocusNode(),
                    controller: myController,
                    style: TextStyle(),
                    cursorColor: Colors.red,
                    backgroundCursorColor: Colors.blue),
                    Wrap(
                      spacing: 4,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3,vsync: this,initialIndex: 2);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

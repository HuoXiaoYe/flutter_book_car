import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: PageHome(),
    );
  }
}

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Widget> myArr = [];
  int _activeIndex = 0;
  @override
  void initState() {
    myArr..add(Content("home1"))..add(Content("home2"))..add(Content("home3"))..add(Content("home4"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("霍小叶"),
      ),
      body: myArr[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("home1")),
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("home2")),
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("home3")),
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("home4")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _activeIndex,
        onTap: (int val){
          setState(() {
           _activeIndex = val; 
          });
        },
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String desc;
  Content(this.desc);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(desc),
    );
  }
}
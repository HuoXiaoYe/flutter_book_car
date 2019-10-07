import "package:flutter/material.dart";

import "content.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        title: "导航栏练习",
        home: new PageIndex(),
      ),
    );
  }
}

class PageIndex extends StatefulWidget {
  @override
  _PageIndexState createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
  int _activeIndex = 0;
  List<Widget> myList = [];

  @override
  void initState() {
    myList
      ..add(Home("home页面"))
      ..add(Home("carde页面"))
      ..add(Home("airplay页面"))
      ..add(Home("pages页面"));

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: myList[_activeIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('home')),
            BottomNavigationBarItem(icon: Icon(Icons.card_membership),title: Text('card_membership')),
            BottomNavigationBarItem(icon: Icon(Icons.airplay),title: Text('airplay')),
            BottomNavigationBarItem(icon: Icon(Icons.pages),title: Text('pages')),
          ],
          currentIndex: _activeIndex,
          onTap: (int index){
            setState(() {
             _activeIndex = index; 
            });
          },
        ),
      ),
    );
  }
}
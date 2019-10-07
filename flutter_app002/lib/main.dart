// 类似 咸鱼的 底部导航栏

import "package:flutter/material.dart";

import 'content.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "咸鱼App导航栏",
        theme: ThemeData(primarySwatch: Colors.blue),
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
    // TODO: implement initState
    myList..add(Home("第一屏"))..add(Home("第二屏"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myList[_activeIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new Home("加入商品页面")));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                 _activeIndex = 0; 
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.build),
              color: Colors.white,
              onPressed: () {
                setState(() {
                 _activeIndex = 1; 
                });
              },
            )
          ],
          
        ),
      ),
    );
  }
}

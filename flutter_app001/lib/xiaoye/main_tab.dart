import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:KeepAliveDemo()
    );
  }
} 

class KeepAliveDemo extends StatefulWidget {
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TabController(length:3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Keep Alive Demo'),
        bottom:TabBar(
          controller: _controller,
          labelColor:Colors.pink,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            fontSize: 24,
            color: Colors.red
            
          ),
          unselectedLabelColor:Colors.yellow,
          unselectedLabelStyle:TextStyle(
            fontSize: 14,
          ),
          tabs:[
            Text("一号"),
            Text("二号页面"),
            Text("三号页"),
          ],
        )
      ),
      body:TabBarView(
        controller: _controller,
        children: <Widget>[
         Text('1111'),
         Text('2222'),
         Text('3333')
        ],
      )
    );
  }
}


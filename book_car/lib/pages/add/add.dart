import "package:flutter/material.dart";

// class Add extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:Text("增加页面")
//       ),
//     );
//   }
// }

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _title(String str) {
    return Text(
      str,
      style: TextStyle(fontSize: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     title: Text('新的拼单'),
        //     bottom: TabBar(
        //       controller: _controller,
        //       indicatorSize: TabBarIndicatorSize.label,
        //       indicatorWeight: 3.0,
        //       tabs: [_title("叫车"), _title("拼车"), _title("拼团")],
        //     )),
        body: Column(
          children: <Widget>[
            Container(
              height: 40,
            ),
            TabBar(
              controller: _controller,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              indicatorColor:Colors.red,
              labelColor:Colors.black,
              tabs: [_title("叫车"), _title("拼车"), _title("拼团")],
            ),
            // TabBarView(
            //   controller: _controller,
            //   children: <Widget>[Text('1111'), Text('2222'), Text('3333')],
            // )
          ],
        ));
  }
}

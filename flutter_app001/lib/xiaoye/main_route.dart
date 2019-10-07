// ----------------------- 普通路由传值与接受值的方式 ----------------------------
// import "package:flutter/material.dart";

// void main() => runApp(App());

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "路由的传参demo",
//       home: FirstPage(),
//     );
//   }
// }

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   String data = '初始化信息';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text(data),
//             RaisedButton(
//               child: Icon(Icons.navigate_next),
//               onPressed: () async{
//                 var result = await  Navigator.push(context,
//                   MaterialPageRoute(builder: (context){
//                     return SecondPage('传递过来的信息');
//                   })
//                 );
//                 setState(() {
//                   data = result;
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   String msg;
//   SecondPage(this.msg):super();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Text(msg),
//           RaisedButton(
//             onPressed: (){
//               Navigator.of(context).pop("返回值");
//             },
//             child: Icon(Icons.navigate_before),
//           )
//         ],
//       ),
//     );
//   }
// }

// ----------------------- 命名路由路由传值与接受值的方式 ----------------------------
import "package:flutter/material.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由的传参demo",
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Map<String, WidgetBuilder> routes;

  String data = '初始化信息';


  @override
  void didUpdateWidget(FirstPage oldWidget) {
    // TODO: implement didUpdateWidget

    super.didUpdateWidget(oldWidget);
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "new_page" : (context)=>new SecondPage(),
        // "/":(context)=>new FirstPage(),
      },
      // initialRoute:"/",
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(data),
              RaisedButton(
                child: Icon(Icons.navigate_next),
                onPressed: (){
                  Navigator.of(context).pushNamed('new_page');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  // String msg;
  // SecondPage(this.msg) : super();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(''),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop("返回值");
            },
            child: Icon(Icons.navigate_before),
          )
        ],
      ),
    );
  }
}

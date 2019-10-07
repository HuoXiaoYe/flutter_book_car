import 'package:flutter/material.dart';
import './second_page.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configRoutes(router);
    // Routes.configRoutes(router);
    Application.router = router;
    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: new PageIndex(),
      ),
    );
  }
}

class PageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          // Navigator.push(context,MaterialPageRoute(builder: (context) => new SecondPage("2")));
          Application.router.navigateTo(context, "/second?id=2");
        },
        child: Icon(Icons.home),
      ),
    );
  }
}

import "package:flutter/material.dart";
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "scoped_model练习",
      home: Scaffold(
        body: Center(
          child: PageHome(),
        ),
      ),
    );
  }
}

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Column(
        children: <Widget>[
          ScopedModelDescendant<CounterModel>(
            builder: (context,child,model){
              return Text(model.count.toString());
            },
          ),
          ScopedModelDescendant<CounterModel>(
            builder: (context,child,model){
              return InkWell(
                onTap: (){
                  model.increasement();
                },
                child: Text("+"),
              );
            },
          )
        ],
      ),
    );
  }
}

class CounterModel extends Model{
  int _count = 0;
  int get count => _count;

  void increasement(){
    _count++;
    notifyListeners();
  }
}
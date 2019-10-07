import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(BlocDemo());

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPrivider(
        bloc: CounterBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("bloc demo"),
          ),
          body: CounterHome(),
          floatingActionButton: FloatB(),
        ),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterPrivider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              // _counterBloc.log();
              _counterBloc.counter.add([
          {
            "name":"啤酒"
          },{
            "name":"哈尔滨啤酒"
          }
        ]);
            },
          );
        },
      ),
    );
  }
}

class FloatB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterPrivider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log("sdaf----------button");
        _counterBloc.counter.add([
          {
            "name":"白酒"
          },{
            "name":"洋酒"
          }
        ]);
      },
    );
  }
}

// 创建 bloc

class CounterBloc {
  List _count = [1,2,3];
  final _counterActionController = StreamController<List>();
  StreamSink<List> get counter => _counterActionController.sink;

  final _counterController = StreamController<List>();
  Stream<List> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(List data) {
    _count = data + _count;
    // _counterController.add(_count);
    _counterController.add(data);
  }

  // void log(msg) {
  //   prList("$msg");
  // }
}

class CounterPrivider extends InheritedWidget {
  CounterPrivider({Key key, this.child, this.bloc})
      : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterPrivider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterPrivider)
        as CounterPrivider);
  }

  @override
  bool updateShouldNotify(CounterPrivider oldWidget) {
    return true;
  }
}

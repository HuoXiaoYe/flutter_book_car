import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;
  void _increase() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increase: _increase,
      child: Scaffold(
        body: Center(child: Count()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increase,
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  // final int _count;
  // final VoidCallback _action;
  // Count(this._count, this._action);
  @override
  Widget build(BuildContext context) {
    final _count = CounterProvider.of(context).count;
    final VoidCallback _action = CounterProvider.of(context).increase;
    return ActionChip(
      label: Text(_count.toString()),
      onPressed: _action,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increase;
  CounterProvider({Key key, this.child, this.count, this.increase})
      : super(key: key, child: child);

  final Widget child;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

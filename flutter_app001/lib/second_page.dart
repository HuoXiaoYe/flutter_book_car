import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {
  final String id;
  SecondPage(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
    );
  }
}
import "package:flutter/material.dart";



class Home extends StatelessWidget {
  final String content;
  Home(this.content):super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content),
      ),
      body: Container(
        child: Center(
          child: Text(content),
        ),
      ),
    );
  }
}
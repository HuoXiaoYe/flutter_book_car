import "package:flutter/material.dart";

class ConfirmBookList extends StatelessWidget {
  final Map info;
  ConfirmBookList(this.info);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text(this.info.toString())
    );
  }
}
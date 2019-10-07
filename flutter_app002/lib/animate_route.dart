import "package:flutter/material.dart";


class MyRoute extends PageRouteBuilder{
  final Widget mywiget;
  MyRoute(this.mywiget):super(
    transitionDuration:const Duration(seconds: 2),

    pageBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ){
      return mywiget;
    },

    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget:child
    ){
      return FadeTransition(opacity: Tween(begin: 0.0,end: 1,0)
      .animate(CurvedAnimation(
        parent: animation1,curve: 
        Curves.fastOutSlowIn
        )),
        child: child,
        );
    }




  );




}
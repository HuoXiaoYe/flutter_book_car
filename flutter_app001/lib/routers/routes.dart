import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handle.dart';

class Routes{
  static String root = "/";
  static String secondPage = "/second";
  static void configRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print("error");
      }
    );
    router.define(secondPage,handler:secondPageHandle);
  }
}
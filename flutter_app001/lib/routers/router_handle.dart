import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../second_page.dart';


Handler secondPageHandle = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String id = params['id'].first;
    return SecondPage(id);
  }
);


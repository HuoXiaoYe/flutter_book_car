// import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../config/banner_src.dart';
import '../../config/nav.dart';
import '../../config/recommend.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Column(
      // child:Text("首页")
      children: <Widget>[
        Banner(), // 轮播图组件
        Tabbar(),
      ],
    );
  }
}

// 轮播图组件
class Banner extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  // List bannerList = [];
  @override
  void initState() {
    // getBannerList(); // 调用获取轮播图数据的方法
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      color: Colors.white,
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            width: 100,
            height: 100,
            child: Image.network(
              bannerList[index]["picUrl"],
              fit: BoxFit.fitWidth,
              width: 100,
            ),
          );
        },
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//轮播图下方导航组件

class Tabbar extends StatelessWidget {
  Widget item(data) {
    return Container(
      padding: EdgeInsets.only(top: 8,bottom: 5),
      width: 70,
      child: InkWell(
          onDoubleTap: () {},
          child: Column(
            children: <Widget>[
              Image.network(
                data["pic_src"],
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(data["title"]),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: NavList.map((v) => item(v)).toList(),
        ),
      ),
    );
  }
}

// 附近推荐


class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[],
        ),
    );
  }
}



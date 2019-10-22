// import 'dart:convert';

import 'dart:ui' as prefix0;

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../config/banner_src.dart';
import '../../config/nav.dart';
import '../../config/recommend.dart';
import './recommend_list/recommend_list.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // child:Text("首页")
      children: <Widget>[
        Banner(), // 轮播图组件
        Tabbar(), // 导航组件
        Recommend(), // 附近推荐
        BookCar(), // 拼车去哪儿
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
      padding: EdgeInsets.only(top: 8, bottom: 5),
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
        // margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
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
  Widget _item(data) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 16, 8, 3),
      height: 170,
      child: InkWell(
        onTap: () {
          // print(111); test success
        },
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(bottom: 5),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(data["img"]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 6,
              ),
              child: Text(data["title"]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "￥",
                  style: TextStyle(fontSize: 12, color: Colors.orange),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Text(
                    data["price_0"],
                    style: TextStyle(fontSize: 18, color: Colors.orange),
                  ),
                ),
                Text(
                  "起",
                  style: TextStyle(fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 8),
      height: 44,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "附近推荐",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 25,
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => new RecommendList()));
              },
              child: Text(
                "查看更多",
                style: TextStyle(color: Colors.black45),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      child: Card(
        child: Column(
          children: <Widget>[
            _title(context),
            Container(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recommendList.map((v) => _item(v)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 拼车去哪
class BookCar extends StatelessWidget {
  Widget _title(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 8),
      height: 44,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "拼车去哪儿",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 25,
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: InkWell(
              onTap: () {},
              child: Text(
                "查看更多",
                style: TextStyle(color: Colors.black45),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            _title(context), //标题区域
            Wrap(
              children: <Widget>[
                Image.network("https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1571728548&di=41a5c0bed22b7df4d2a494fa91cf2732&src=http://hiphotos.baidu.com/lbsugc/pic/item/b8389b504fc2d562b72fb703e51190ef76c66c3c.jpg")
              ],
            )
          ],
        ),
      ),
    );
  }
}

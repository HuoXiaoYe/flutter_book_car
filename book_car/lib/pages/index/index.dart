import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../api/get_data.dart';
import '../../config/url.dart';
import '../../model/banner.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // child:Text("首页")
      children: <Widget>[Banner()],
    );
  }
}

// 轮播图组件
class Banner extends StatefulWidget {
  // final List list;
  // Banner(this.list);
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  List bannerList = [];
  @override
  void initState() {
    getBannerList(); // 调用获取轮播图数据的方法
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                bannerList[index].picUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  getBannerList() async {
    await request(api["banner"]).then((val) {
      BannerModel list = BannerModel.fromJson(jsonDecode(val));
      setState(() {
        bannerList = list.data.slider;
      });
    });
  }
}

// import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../config/banner_src.dart';

// import '../../api/get_data.dart';
// import '../../config/url.dart';
// import '../../model/banner.dart';

// class Index extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       // child:Text("首页")
//       children: <Widget>[Banner()],
//     );
//   }
// }


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index>  with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
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
      height: 200,
      color: Colors.white,
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
             child: Image.network(
                bannerList[index]["picUrl"],
                fit: BoxFit.fitHeight,
              ),
          );
        },
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  // getBannerList() async {
  //   await request(api["banner"]).then((val) {
  //     BannerModel list = BannerModel.fromJson(jsonDecode(val));
  //     setState(() {
  //       bannerList = list.data.slider;
  //     });
  //   });
  // }
}

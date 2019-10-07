import "package:flutter/material.dart";

class RenderView extends StatefulWidget {
  @override
  _RenderViewState createState() => _RenderViewState();
}

class _RenderViewState extends State<RenderView> {
  TextEditingController typeController = TextEditingController();
  String showText = "欢迎您来到美好人间高级会所";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("美好人间"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView( // 放置键盘弹起是，布局错乱
          child: Container(
            child: Row(
              children: <Widget>[
                TextField(
                  // 文本框
                  controller: typeController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "美女类型",
                      helperText: "请输入您喜欢的类型"),
                  autofocus: false, // 为true 会默认打开键盘
                ),
                RaisedButton(
                  onPressed: () {
                    _choiceAction();
                  },
                  child: Text("选择完毕"),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis, // 兼容性问题
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _choiceAction() {
    if (typeController.text.toString() == "") {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("美女类型不能为空"),
              ));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        setState(() {
          showText = val["data"]['name'].toString();
        });
      });
    }
  }

  Future getHttp(String typeText) async {
    // 返回 future对象
    Response response;
    var data = {"name": typeText};
    response = await Dio().get(
        "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
        queryParams: data);

    return response.data;
  }

  // 伪造请求头请求数据

  Future getHttpFalse(String typeText) async {

    Response response;
    
    Dio dio = new Dio();

    response = Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian");

    return response.data;
  }
}

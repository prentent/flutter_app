import 'package:flutter/material.dart';
import 'dart:async';

import '../utils/SpHelper.dart';

class WelComePage extends StatefulWidget {
  @override
  _MyWelComePageState createState() => _MyWelComePageState();
}

class _MyWelComePageState extends State<WelComePage> {
  int _count = 3;
  Timer timer;

  void goWhere() {
    //取消定时器，避免无限回调
    timer?.cancel();
    timer = null;
    //获取登录信息
    SpHelper().getStr("uid").then((onValue) {
      if (onValue.isEmpty) {
        Navigator.of(context).pushReplacementNamed('login');
//        Navigator.of(context).pushReplacement(CustomRoute(new Login()));
      } else {
        Navigator.of(context).pushReplacementNamed('main');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 定时器
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _count--;
      });
      //到时回调
      if (_count <= 0) {
        goWhere();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            // 加载页面居中背景图 使用cover模式
//            Image.asset("images/loading.jpeg",
//                fit: BoxFit.cover,
//                width: double.infinity,
//                height: double.infinity),
            Image.network(
              "http://img.zcool.cn/community/01fde75678955a32f8759f0423274e.jpg@2o.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                //按钮背景色
                color: Color.fromARGB(155, 155, 155, 155),
                //按钮亮度
                colorBrightness: Brightness.dark,
                //文本颜色
                textColor: Colors.white,
                //按钮主题 ButtonTheme ButtonThemeData ButtonTextTheme ThemeData
                textTheme: ButtonTextTheme.normal,
                //抗锯齿能力
                clipBehavior: Clip.antiAlias,
                //圆形
                shape: CircleBorder(
                    side:
                        BorderSide(color: Color.fromARGB(155, 155, 155, 155))),
                child: Text(
                  "跳过$_count",
                  style: TextStyle(fontSize: 11),
                ),
                onPressed: () {
                  goWhere();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

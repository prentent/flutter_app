import 'package:flutter/material.dart';

import 'router/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  GlobalKey<NavigatorState> navigatorKeyList = new GlobalKey(); //导航键状态集合

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'application',
        color: Colors.brown,
        navigatorKey: navigatorKeyList,
        //不显示右上角的debug字样的横幅
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue, //主题色
          primaryColor: Colors.blue, //导航栏颜色
          canvasColor: Colors.blue, //画布颜色
        ),
        //  注册路由表
        routes: routesMap,
        initialRoute: "welcome");
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';

import '../https/DioHelper.dart';
import '../https/ApiUrl.dart';
import '../entity/user_entity.dart';
import '../utils/SpHelper.dart';

class Login extends StatefulWidget {
//  Login(Key key):super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  bool isShow = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpHelper().getStr("uid").then((uid) {
      _unameController.text = uid;
    });
    SpHelper().getStr("pwd").then((pwd) {
      _pwdController.text = pwd;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _unameController.dispose();
    _pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        Image.asset("images/bglogin.jpg",
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    "images/iconlogin.jpg",
                    fit: BoxFit.cover,
                    width: 110,
                    height: 110,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 45,
                  ),
                  child: TextField(
                    autofocus: false,
                    controller: _unameController,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      labelText: '用户名',
                      hintText: '请输入用户名',
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    //校验用户名
//                      validator: (v) {
//                        return v.trim().length > 0 ? null : '密码不能为空';
//                      },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 45,
                  ),
                  child: TextField(
                    controller: _pwdController,
                    autofocus: false,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: '密码',
                      hintText: '您的登录密码',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: new Icon(
                            isShow ? Icons.visibility : Icons.visibility_off,
                            color: isShow ? Colors.blue : Colors.grey),
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    obscureText: isShow,
                    //校验密码
//                    validator: (v) {
//                      return v.trim().length > 0 ? null : '密码不能为空';
//                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Container(child: Builder(builder: (context) {
                  return MaterialButton(
                    minWidth: double.infinity,
                    child: Text("登录"),
                    //按钮背景色
                    color: Colors.blue,
                    //按钮亮度
                    colorBrightness: Brightness.dark,
                    //文本颜色
                    textColor: Colors.white,
                    //墨汁飞溅的颜色
                    splashColor: Colors.green,
                    //抗锯齿能力
                    clipBehavior: Clip.antiAlias,
                    //边框样式
                    shape: RoundedRectangleBorder(
                      side: new BorderSide(
                        width: 1.0,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      if (_unameController.text.isNotEmpty &&
                          _pwdController.text.isNotEmpty) {
                        //都有输入
                        var _data = {
                          "uid": _unameController.text,
                          "pwd": _pwdController.text
                        };
                        DioHelper()
                            .get(ApiUrl.login, data: _data)
                            .then((onValue) {
                          Map userMap = json.decode(onValue.toString());
                          UserEntity user = UserEntity.fromJson(userMap);
                          if (user.code == "200") {
                            SpHelper().setStr("uid", _unameController.text); //保存用户名
                            SpHelper().setStr("pwd", _pwdController.text); //保存密码
                            SpHelper().setStr("user", onValue.toString());
                            Navigator.of(context) .pushReplacementNamed('main'); //跳转主页
                          }
                        });
                      } else {
                        //至少一个为空
                        if (_unameController.text.isEmpty) {
                          Scaffold.of(context).showSnackBar(new SnackBar(
                              content: Text("请输入用户名"),
                              duration: Duration(seconds: 2)));
                        } else {
                          Scaffold.of(context).showSnackBar(new SnackBar(
                              content: Text("请输入密码"),
                              duration: Duration(seconds: 2)));
                        }
                      }
                    },
                  );
                })),
              ],
            )),
      ]),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fluro_demo/Model/User.dart';
import 'package:flutter_fluro_demo/Router/PageRouter/LoginRouter.dart';

class Register extends StatelessWidget {
  const Register({Key key, this.subTitle}) : super(key: key);

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    User user = User.fromJson(jsonDecode(subTitle));
    return Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            LoginRouter.backToLogin(context);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("这是注册页面"),
                Text("姓名: ${user.nickName}"),
                Text("年龄: ${user.age}"),
              ]),
        ));
  }
}

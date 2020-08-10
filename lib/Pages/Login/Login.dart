import 'package:flutter/material.dart';
import 'package:flutter_fluro_demo/Model/User.dart';
import 'package:flutter_fluro_demo/Router/PageRouter/LoginRouter.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: GestureDetector(
        onTap: () {
          User temp = User("Jack", 15);
          LoginRouter.goRegistWithCallback(context, temp);
        },
        child: Text("这是登陆页面"),
      )),
    );
  }
}

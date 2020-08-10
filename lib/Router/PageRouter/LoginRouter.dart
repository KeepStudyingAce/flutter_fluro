import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fluro_demo/Model/User.dart';
import 'package:flutter_fluro_demo/Router/IRouterProvider.dart';
import 'package:flutter_fluro_demo/Pages/Login/Login.dart';
import 'package:flutter_fluro_demo/Pages/Login/Register.dart';
import 'package:flutter_fluro_demo/Router/NavigatorUtil.dart';

class LoginRouter implements IRouterProvider {
  /// 登陆root页
  static String loginPage = "/login";

  /// 注册
  static String registerPage = "/login/register";

  static goRegist(BuildContext context, String title) {
    NavigatorUtil.push(
        context, registerPage + "?title=${Uri.encodeComponent(title)}",
        transition: TransitionType.fadeIn);
  }

  static goRegistWithCallback(BuildContext context, User user) {
    String temp = jsonEncode(user.toJson());
    NavigatorUtil.pushWithParam(
      context,
      registerPage + "?title=${Uri.encodeComponent(temp)}", //带参数，需进行Uri编码
      (dynamic obj) {
        //带回调
        bool isUser = obj is User;
        if (isUser) {
          User temp = obj as User;
          print("回调信息: ${temp.nickName} is ${temp.age} years old! ");
        } else {
          print("回调结果" + obj);
        }
      },
      transition: TransitionType.fadeIn,
    );
  }

  static backToLogin(BuildContext context) {
    //需回调参数
    User temp = User("Rose", 14);
    NavigatorUtil.goBackWithParams(context, temp);
  }

  @override
  void initRouter(Router router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, params) => Login()));
    router.define(registerPage, handler: Handler(handlerFunc: (_, params) {
      final String temp = params["title"].first;
      return Register(
        subTitle: temp,
      );
    }));
  }
}

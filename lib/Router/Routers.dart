import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'PageRouter/HomeRouter.dart';
import 'PageRouter/LoginRouter.dart';
import 'IRouterProvider.dart';
import 'package:flutter_fluro_demo/WelcomePage.dart';
import 'package:flutter_fluro_demo/RootTab.dart';

class Routers {
  static String root = "/";
  static String homePage = "/home-page";
  static String webViewPage = "/web-view";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    // 闪屏页面
    router.define(root,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    WelcomePage()));
    // 主页面
    router.define(homePage,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    RootTab()));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(LoginRouter());
    _listRouter.add(HomeRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}

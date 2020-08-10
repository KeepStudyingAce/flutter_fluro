import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro_demo/Pages/Home/First.dart';
import 'package:flutter_fluro_demo/Pages/Login/Login.dart';

class RootTab extends StatelessWidget {
  const RootTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(title: Text("主页"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(title: Text("登陆"), icon: Icon(Icons.info)),
          ]),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return First();
              case 1:
                return Login();
              default:
            }
            return SizedBox();
          }),
    );
  }
}

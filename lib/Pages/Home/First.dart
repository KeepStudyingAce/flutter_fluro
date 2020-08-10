import 'package:flutter/material.dart';
import 'package:flutter_fluro_demo/Router/PageRouter/HomeRouter.dart';

class First extends StatelessWidget {
  const First({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
            onTap: () {
              HomeRouter.goSecond(context);
            },
            child: Text("这是首页First页面")),
      ),
    );
  }
}

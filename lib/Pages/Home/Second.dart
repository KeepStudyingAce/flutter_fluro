import 'package:flutter/material.dart';
import 'package:flutter_fluro_demo/Router/PageRouter/HomeRouter.dart';

class Second extends StatelessWidget {
  const Second({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
            onTap: () {
              HomeRouter.backToFirst(context);
            },
            child: Text("这是首页Second页面")),
      ),
    );
  }
}

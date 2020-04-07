import 'package:flutter/material.dart';
import 'package:wechat_flutter/const.dart';
import 'package:wechat_flutter/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 隐藏debug标签
      debugShowCheckedModeBanner: false,
      // 安坐后台标题
      title: 'Flutter Demo',
      theme: ThemeData(
        // 主色调 暖色->黑色的状态栏  冷色-> 白色状态栏
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor:  Color.fromRGBO(1, 0, 0, 0.0),
        cardColor: Color.fromRGBO(1, 1, 1, 0.65),
      ),
      home: RootPage(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 隐藏dubug标签
      debugShowCheckedModeBanner: false,
      // 安坐后台标题
      title: 'Flutter Demo',
      theme: ThemeData(
        // 主色调
        primarySwatch: Colors.blue,
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
      ),
      home: RootPage(),
    );
  }
}


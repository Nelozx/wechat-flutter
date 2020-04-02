import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iOS默认剧中，android默认据左
        centerTitle: true,
        title: Text('微信'),
      ),
      body: Center(
        child: Text('微信页面'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wechat_flutter/const.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

// 创建item方法
PopupMenuItem<String> _buildItem(String assetImage, String title) {
  return PopupMenuItem(
    child: Row(
      children: <Widget>[
        Image(image: AssetImage(assetImage), width: 20,),
        SizedBox(width: 20,),
        Text(title, style: TextStyle(color: Colors.white),)
      ],
    ),
  );
}

List<PopupMenuItem<String>> _buildPopupMenuItem(BuildContext context) {
  return [
    _buildItem('images/发起群聊.png', '发起群聊'),
    _buildItem('images/添加朋友.png', '添加朋友'),
    _buildItem('images/扫一扫1.png', '扫一扫'),
    _buildItem('images/收付款.png', '收付款'),
  ];
}


class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iOS默认剧中，android默认据左
        centerTitle: true,
        backgroundColor: WeChatThemeColor,
        title: Text('微信'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              offset: Offset(0, 60),
              itemBuilder: _buildPopupMenuItem,
              child: Image(
                image: AssetImage('images/圆加.png'),
                width: 25,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text('微信页面'),
      ),
    );
  }// 创建item
}


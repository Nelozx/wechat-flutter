import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wechat_flutter/const.dart';
import 'package:wechat_flutter/pages/chat/chat_data.dart';
import 'package:http/http.dart' as http;
import 'package:wechat_flutter/pages/chat/search_bar.dart';
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


class _ChatPageState extends State<ChatPage>
with AutomaticKeepAliveClientMixin<ChatPage>{
  // 聊天的界面的数据
  List<Chat> _datas = [];
  // 多次请求
  bool _cancelConnect = false;


  Future<List<Chat>> getDatas() async {
    _cancelConnect = false;
    final response = await http.get(chat_list_url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // 获取响应数据转化成Map类型
      List<Chat> chatList = responseBody['chat_list']
          .map<Chat>((item) => Chat.formJson(item))
          .toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }




  @override
  void initState() {
    super.initState();
    getDatas().then((List<Chat> datas) {
      if (!_cancelConnect) {
        setState(() {
          _datas = datas;
        });
      }

    }).catchError((e) {
      print(e);
    }).timeout(Duration(seconds: 6)).catchError((timeout) {
      _cancelConnect = true;
      print('超时:$timeout');
    });
  }


  @override
  bool get wantKeepAlive => true;

  // 返回cell
  Widget _buildItemForRow(BuildContext context, int index) {
    if (index == 0) {
      return SearchCell(datas: _datas,);
    }
    return ListTile(
      title: Text(_datas[index -1].name),
      subtitle: Container(
        height: 20, width: 20,
        child: Text(
          _datas[index -1].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: CircleAvatar (
        backgroundImage: NetworkImage(_datas[index -1].imageUrl),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
      body: Container(
        child: _datas.length == 0 ? Center(child: Text('Loading...'),) :
        ListView.builder (
            itemCount: _datas.length,
            itemBuilder: _buildItemForRow,
        )
      )
    );
  }// 创建item
}


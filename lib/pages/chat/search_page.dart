import 'package:flutter/material.dart';
import 'package:wechat_flutter/const.dart';
import 'package:wechat_flutter/pages/chat/search_bar.dart';

import 'chat_data.dart';

class SearchPage extends StatefulWidget {
  final List<Chat> datas;

  const SearchPage({Key key, this.datas}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // 内容显示 根据模型数据来
  List<Chat> _models = [];
  String _searchStr = '';

  void _searchData(String text) {
    if (text.length == 0) {
      _models = [];
    } else {
      _models.clear();
      for (int i = 0; i < widget.datas.length; i++) {
        if (widget.datas[i].name.contains(text)) {
          _models.add(widget.datas[i]);
        }
      }
      _searchStr = text;
      setState(() {});
    }
  }

  // 高亮显示匹配的字符串
  Widget _title(String name) {
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black);
    TextStyle highlightStyle = TextStyle(fontSize: 16, color: Colors.green);

    List<TextSpan> spans = [];
    //找到哪些是高亮的哪些是黑色的。
    List<String> strs = name.split(_searchStr);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i];
      if (str == '' && i < strs.length - 1) {
        spans.add(TextSpan(text: _searchStr, style: highlightStyle));
      } else {
        spans.add(TextSpan(text: str, style: normalStyle));
        if (i < strs.length - 1) {
          //只要不是最后一个
          spans.add(TextSpan(text: _searchStr, style: highlightStyle));
        }
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );

  }


  Widget _itemForRow(BuildContext context, int index) {
    return ListTile(
      title: _title(_models[index].name),
      subtitle: Container(
        height: 20, width: 20,
        child: Text(
          _models[index].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: CircleAvatar (
        backgroundImage: NetworkImage(_models[index].imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchBar(
            onChange: (String str) {
              _searchData(str);
              print('收到了$str');
            },
          ),
          Expanded(
            flex: 1,
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child:  NotificationListener(
                  // ignore: missing_return
                    onNotification: (ScrollNotification note){
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: ListView.builder(
                      itemCount: _models.length,
                      itemBuilder: _itemForRow,
                    ))
            )
          )
        ],
      ),
    );
  }
}

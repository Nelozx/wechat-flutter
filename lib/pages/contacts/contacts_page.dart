import 'package:flutter/material.dart';
import 'package:wechat_flutter/const.dart';
import 'package:wechat_flutter/pages/contacts/contacts_data.dart';
import 'package:wechat_flutter/pages/contacts/index_bar.dart';
import 'package:wechat_flutter/pages/discover/discover_child_page.dart';



class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
with AutomaticKeepAliveClientMixin<ContactsPage> {
  final List<Contacts> _listDatas = [];
  final Map _groupOffsetMap = {
    INDEX_WORDS[0] : 0.0,
    INDEX_WORDS[1] : 0.0
  };

  ScrollController _scrollController;

  final List<Contacts> _headerData = [
    Contacts(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Contacts(imageUrl: 'images/群聊.png', name: '群聊'),
    Contacts(imageUrl: 'images/标签.png', name: '标签'),
    Contacts(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // .. 返回当前对象
    _listDatas..addAll(datas)..addAll(datas);
    _listDatas.sort((Contacts a, Contacts b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });
    _scrollController = ScrollController();

    var _groupOffset = 54.0 * 4;
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) { // 第一个一定是头部
        _groupOffsetMap.addAll({_listDatas[i].indexLetter:_groupOffset});
        _groupOffset += 84;
      } else if (_listDatas[i].indexLetter == _listDatas[i -1].indexLetter) {
        // 如果没有头就加54
        _groupOffset += 54;
      } else { // 都是有头部的
        _groupOffsetMap.addAll({_listDatas[i].indexLetter:_groupOffset});
        _groupOffset += 84;
      }

    }
  }


  Widget _itemForRow(BuildContext context, int index) {
    // 显示头部四个cell
    if (index < _headerData.length) {
      return _ContactsCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    }

    // 如果当前和上一个Cell的IndexLetter一样，就不显示头
    if (index > _headerData.length &&
        _listDatas[index - 4].indexLetter == _listDatas[index - 5].indexLetter) {
      return _ContactsCell(
        imageUrl: _listDatas[index - 4].imageUrl,
        name: _listDatas[index - 4].name,
      );

    }

    return _ContactsCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      groupTitle: _listDatas[index - 4].indexLetter,
    );
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        backgroundColor: WeChatThemeColor,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 25,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DiscoverChildPage(title: '添加朋友',)
              ));
            },
          )
        ],

      ),
      body: Stack(
        children: <Widget>[
          Container(
          color: WeChatThemeColor,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _headerData.length + _listDatas.length,
            itemBuilder: _itemForRow,
          ),
        ),// List
          IndexBar(
            indexBarCallBack: (String str){
              print('当前选中的是:$str');
              if (_groupOffsetMap[str] != null) {
                _scrollController.animateTo(
                  _groupOffsetMap[str],
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeIn,
                );
              }
            },

          )// 索引条
        ],
      )
    );
  }
}

class _ContactsCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;
  const _ContactsCell({Key key, this.imageUrl, this.name, this.groupTitle, this.imageAssets}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: groupTitle != null ? 30 : 0,
            padding: EdgeInsets.only(left: 10),
            color: Color.fromRGBO(1, 1, 1, 0.0),
            child: groupTitle != null ? Text(groupTitle, style: TextStyle(color: Colors.grey),) : null,
          ), // 头
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 34, width: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      image: DecorationImage(image:
                      imageUrl != null ? NetworkImage(imageUrl) : AssetImage(imageAssets)
                      )
                  ),
                ),// 图标
                Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(name, style: TextStyle(fontSize: 18),),
//                  color: Colors.blueAccent,
                          width: ScreenWidth(context) - 54,
                          height: 53.5,
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          height: 0.5,
                          color: WeChatThemeColor,
                          width: ScreenWidth(context) - 54,
                        )
                      ],
                    )
                )
              ],
            ),
          )// cell
        ],
      )
    );
  }
}
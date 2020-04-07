import 'package:flutter/material.dart';
import 'discover/discover_page.dart';
import 'chat/chat_page.dart';
import 'mine_page.dart';
import 'contacts/contacts_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final PageController _controller = PageController(
    initialPage: 0
  );

  int _currentIdx = 0;
//  List<Widget> _pages = [ ChatPage(), ContactsPage(), DiscoverPage(),  MinePage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ChatPage(), ContactsPage(), DiscoverPage(),  MinePage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int idx) {
            _currentIdx = idx;
            setState(() {});
            _controller.jumpToPage(idx);
          },
          currentIndex: _currentIdx,
          selectedFontSize: 12,
          // have fixed width
          type: BottomNavigationBarType.fixed,
          // 没有设置fixedColor，文字使用主题色
          fixedColor: Colors.green,
          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_chat.png')),
              activeIcon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_chat_hl.png')),
              title: Text('微信'),
            ),
            BottomNavigationBarItem(
              icon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_friends.png')),
              activeIcon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_friends_hl.png')),
              title: Text('通讯录'),
            ),
            BottomNavigationBarItem(
              icon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_discover.png')),
              activeIcon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_discover_hl.png')),
              title: Text('发现'),
            ),

            BottomNavigationBarItem(
              icon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_mine.png')),
              activeIcon: Image(height: 20, width: 20, image: AssetImage('images/tabbar_mine_hl.png')),
              title: Text('我的'),
            ),
          ],
        ),
      ),
    );
  }
}

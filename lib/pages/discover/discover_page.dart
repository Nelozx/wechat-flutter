import 'package:flutter/material.dart';
import 'discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themColor = Color.fromRGBO(220, 220, 220, 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themColor,
        centerTitle: true,
        title: Text('发现', style: TextStyle(color: Colors.black),),
        elevation: 0.0,
      ),
      body: Container(
        color: _themColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            DiscoverCell(
              title: '朋友圈',
              imageName: 'images/朋友圈.png',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              title: '扫一扫',
              imageName: 'images/扫一扫2.png',
            ),
            Row(
              children: <Widget>[
                Container(width: 50, height: 0.5, color: Colors.white,),
                Container(height: 0.5, color: Colors.grey,)

              ],
            ),
            DiscoverCell(
              title: '摇一摇',
              imageName: 'images/摇一摇.png',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              title: '看一看',
              imageName: 'images/看一看.png',
            ),
            Row(
              children: <Widget>[
                Container(width: 50, height: 0.5, color: Colors.white,),
                Container(height: 0.5, color: Colors.grey,)

              ],
            ),
            DiscoverCell(
              title: '搜一搜',
              imageName: 'images/搜一搜.png',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              title: '附近的人',
              imageName: 'images/附近的人icon.png',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              title: '购物',
              imageName: 'images/购物.png',
              subTitle: '618限时特价',
              subImageName: 'images/badge.png',
            ),
            Row(
              children: <Widget>[
                Container(width: 50, height: 0.5, color: Colors.white,),
                Container(height: 0.5, color: Colors.grey,)

              ],
            ),
            DiscoverCell(
              title: '游戏',
              imageName: 'images/游戏.png',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              title: '小程序',
              imageName: 'images/小程序.png',
            ),
          ],
        ),
      ),
    );
  }
}

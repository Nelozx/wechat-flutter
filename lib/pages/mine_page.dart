import 'package:flutter/material.dart';
import 'package:wechat_flutter/const.dart';
import 'package:wechat_flutter/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Widget headerWidget() {
    return Container(
      height: 200,
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 70, height: 70,
                // 装饰风格: 放圆角图片
                decoration: BoxDecoration(
                  // 设置圆角半径
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('images/haha.jpeg'),
                      fit: BoxFit.cover
                  )
                ),

              ), // 头像
              // MediaQuery.of(context).size 获取屏幕的大小
              Expanded(
                child: Container(
//                  color: Colors.blue,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
//                        color: Colors.red,
                        height: 35,
                        alignment: Alignment.centerLeft,
                        child: Text('DMR', style: TextStyle(fontSize: 25)),
                      ),// 昵称
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('微信号: Nelo2020',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey
                              ),
                            ),
                            Image(image: AssetImage('images/icon_right.png'), width: 15,)
                          ],
                        ),
                      ) //账号
                    ],
                  ),
                ),

              )// 右边界面


            ],

          ),
//          margin: EdgeInsets.only(left: 20),
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: WeChatThemeColor,
              height: 900,
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: <Widget>[
                      headerWidget(),//头部
                      SizedBox(height: 10,),
                      DiscoverCell(imageName: 'images/微信支付.png', title: '支付',),
                      SizedBox(height: 10,),
                      DiscoverCell(imageName: 'images/微信收藏.png', title: '收藏',),
                      Row(
                        children: <Widget>[
                          Container(width: 50, height: 0.5, color: Colors.white,),
                          Container(height: 0.5, color: Colors.grey,)
                        ],
                      ),
                      DiscoverCell(imageName: 'images/微信相册.png', title: '相册',),
                      Row(
                        children: <Widget>[
                          Container(width: 50, height: 0.5, color: Colors.white,),
                          Container(height: 0.5, color: Colors.grey,)
                        ],
                      ),
                      DiscoverCell(imageName: 'images/微信卡包.png', title: '卡包',),
                      Row(
                        children: <Widget>[
                          Container(width: 50, height: 0.5, color: Colors.white,),
                          Container(height: 0.5, color: Colors.grey,)
                        ],
                      ),
                      DiscoverCell(imageName: 'images/微信表情.png', title: '表情',),
                      SizedBox(height: 10,),
                      DiscoverCell(imageName: 'images/微信设置.png', title: '设置',),
                    ],
                  )
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 40, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image(image: AssetImage('images/相机.png'),)
                ],
              ),
            ),//拍照按钮

          ],
        ),

      )
    );
  }
}

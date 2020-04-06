import 'package:flutter/material.dart';
import '../../const.dart';

// 获取index的文本
int getIndex(BuildContext context, Offset globalPosition) {
  RenderBox box = context.findRenderObject();
  // 计算出选中的y值
  double y = box.globalToLocal(globalPosition).dy;
  // 每个item的高度
  var itemHeight = ScreenHeight(context)/2/INDEX_WORDS.length;
  // ~取整
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
//  print('当前选中的是:${INDEX_WORDS[index]}');
  return index;
}


class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;
  const IndexBar({Key key, this.indexBarCallBack}) : super(key: key);

  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  Color _bgColor = Color.fromRGBO(1, 1, 1, 0);
  Color _textColor = Colors.black;
  var _selectorIndex = -1;

  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
        child: Text(
            INDEX_WORDS[i],
            style: TextStyle(
                fontSize: 10,
                color: _textColor
            ),
        ),
      ));
    }
    return Positioned(
      right: 0.0,
      top: ScreenHeight(context) / 8,
      height: ScreenHeight(context) * 0.5,
      width: 120,
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
//            color: Colors.blueAccent,
            alignment: Alignment(0, _indicatorY),
            child: _indicatorHidden ? null : Stack(
              alignment: Alignment(-0.2, 0),
              children: <Widget>[
                Image(image: AssetImage('images/气泡.png'), width: 60,),
                Text(_indicatorText,
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              width: 20,
              color: _bgColor,
              child: Column(
                children: words,
              ),
            ),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIndex(context, details.globalPosition);
              // 计算外界回调
              if (index != _selectorIndex) {
                _selectorIndex = index;
                setState(() {});
                widget.indexBarCallBack(INDEX_WORDS[index]);
              }

              // 气泡的显示
              _indicatorText = INDEX_WORDS[index];
              _indicatorY = 2.2 / (INDEX_WORDS.length -1) * index - 1.1;
              _indicatorHidden = false;
              setState(() {});
            },
            onVerticalDragDown: (DragDownDetails details) {
              int index = getIndex(context, details.globalPosition);
              // 计算外界回调
              if (index != _selectorIndex) {
                _selectorIndex = index;
                setState(() {});
                widget.indexBarCallBack(INDEX_WORDS[index]);
              }
              // 气泡的显示
              _indicatorText = INDEX_WORDS[index];
              _indicatorY = 2.2 / (INDEX_WORDS.length -1) * index - 1.1;
              _indicatorHidden = false;
              setState(() {
                _bgColor = Color.fromRGBO(1, 1, 1, 0.5);
                _textColor = Colors.white;
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              _indicatorHidden = true;
              _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
              _textColor = Colors.black;
              _selectorIndex = -1;
              setState(() {});

            },

          )
        ],
      ),
    );
  }
}


const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
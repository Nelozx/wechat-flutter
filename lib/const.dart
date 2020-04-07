import 'package:flutter/material.dart';


// ignore: non_constant_identifier_names
final Color WeChatThemeColor = Color.fromRGBO(223, 223, 223, 1.0);

// 屏幕的宽高
// ignore: non_constant_identifier_names
double ScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
// ignore: non_constant_identifier_names
double ScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

// ignore: non_constant_identifier_names
String chat_list_url = 'http://rap2api.taobao.org/app/mock/224518/api/chat/list';
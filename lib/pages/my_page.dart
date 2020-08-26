import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class TweetPage extends StatefulWidget {
  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动弹'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

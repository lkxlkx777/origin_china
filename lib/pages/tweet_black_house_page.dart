import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class TweetBlackHouse extends StatefulWidget {
  @override
  _TweetBlackHouseState createState() => _TweetBlackHouseState();
}

class _TweetBlackHouseState extends State<TweetBlackHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动态小黑屋'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

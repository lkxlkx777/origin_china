import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class PublishTweet extends StatefulWidget {
  @override
  _PublishTweetState createState() => _PublishTweetState();
}

class _PublishTweetState extends State<PublishTweet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动态'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

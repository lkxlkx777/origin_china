import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('咨询'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

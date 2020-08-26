import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

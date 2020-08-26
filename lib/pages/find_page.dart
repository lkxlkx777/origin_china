import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

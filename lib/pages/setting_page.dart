import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        backgroundColor: Color(AppColors.APP_THEME),
      ),
    );
  }
}

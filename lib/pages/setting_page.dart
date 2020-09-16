import 'package:flutter/material.dart';
import 'package:origin_china/common/event_bus.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/pages/login_page.dart';
import 'package:origin_china/utils/login_util.dart';

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
      body: Container(
        alignment: Alignment.topCenter,
        child: RaisedButton(
          child:
            Text('退出登录'),
          onPressed: (){
            UserInfoUtil.isLogin().then((isLogin){
              if(isLogin){
                UserInfoUtil.clearLoginInfo();
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebLoginPage()));
                eventBus.fire(LogoutEvent);
              }
            });
          },
        ),
      ),
    );
  }
}

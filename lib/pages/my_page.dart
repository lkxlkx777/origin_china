import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:origin_china/bean/user_info_entity.dart';
import 'package:origin_china/common/event_bus.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/pages/login_page.dart';
import 'package:origin_china/pages/my_message_page.dart';
import 'package:origin_china/utils/login_util.dart';
import 'package:origin_china/utils/net_util.dart';

import 'my_detail_page.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List menuTitles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];
  List menuIcons = [
    Icons.message,
    Icons.print,
    Icons.error,
    Icons.phone,
    Icons.send,
    Icons.people,
    Icons.person,
  ];

  String userAvatar;
  String userName;
  UserInfo userInfo = new UserInfo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showUserInfo();
    eventBus.on<LoginEvent>().listen((event) {
      //获取用户信息
      _getUserInfo();
    });

    eventBus.on<LogoutEvent>().listen((event) {
      _showUserInfo();
    });
  }

  void _getUserInfo() {
    Map<String, dynamic> map = Map();
    UserInfoUtil.getAccessToken().then((value) {
      map['access_token'] = value;
      map['dataType'] = 'json';
      NetUtil.get(AppUrls.OPENAPI_USER, map).then((data) {
        print("--------get userInfo value=$data---------");
        Map userMap = json.decode(data);
        UserInfo userInfo = UserInfo().fromJson(userMap);
        if (userInfo != null) {
          setState(() {
            this.userInfo = userInfo;
          });
        }
        UserInfoUtil.saveUserInfo(userMap);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return buildListItem(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: menuTitles.length + 1);
  }

  StatelessWidget buildListItem(int index) {
    if (index == 0) {
      return Container(
        height: 180,
        color: Color(AppColors.APP_GREEN_COLOR),
        child: GestureDetector(
          onTap: () {
            print("点击了头布局");
            UserInfoUtil.isLogin().then((isLogin) {
              if (isLogin) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return MyDetailPage();
                    }));
              } else {
                _login(context);
              }
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                child: userInfo.avatar != null
                    ? CircleAvatar(
                    backgroundImage: NetworkImage(userInfo.avatar))
                    : Image.asset("assets/images/ic_avatar_default.png"),
                backgroundColor: Color(0xffffff),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                userInfo.name != null ? userInfo.name : '点击头像登录',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      index -= 1;
      return ListTile(
          leading: Icon(menuIcons[index]),
          title: Text(menuTitles[index]),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            UserInfoUtil.isLogin().then((isLogin){
              if(isLogin){
                switch(index){
                  case 0:
//                  //我的消息
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return MyMessagePage();
                        }));
                    break;
                }
              }
            });
          }
      );
    }
  }

//调用登录
  Future<void> _login(context) async {
    String result =
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return WebLoginPage();
    }));

    if (result != null && result == 'refresh') {
      //登录成功
      eventBus.fire(LoginEvent());
    }
  }

  void _showUserInfo() {
    UserInfoUtil.getUserInfo().then((value) {
      if (value != null) {
        setState(() {
          userInfo = value;
        });
      }
    });
  }
}

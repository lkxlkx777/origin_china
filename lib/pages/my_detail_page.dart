import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:origin_china/bean/user_detail_entity.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/utils/login_util.dart';
import 'package:origin_china/utils/net_util.dart';

class MyDetailPage extends StatefulWidget {
  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  UserDetail _userDetail;

  @override
  void initState() {
    super.initState();
    _getUserDetailInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的资料',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(AppColors.APP_BAR_COLOR),
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
      ),
      body: _userDetail == null
          ? Center(child: CupertinoActivityIndicator())
          : buildListChildren(),
    );
  }

  Widget buildListChildren() {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          //头像star
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '头像',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  _userDetail.portrait == null
                      ? Image.asset(
                          "assets/images/ic_avatar_default.png",
                          width: 50,
                          height: 50,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(_userDetail.portrait),
                        )
                ],
              ),
            ),
          ),

          Divider(
            height: 1.0,
          ),

          //昵称
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    '昵称',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                      _userDetail.name == null ? '艾特你' : '${_userDetail.name}'),
                ],
              ),
            ),
          ),

          Divider(
            height: 1.0,
          ),

          //加入时间
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    '加入时间',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(_userDetail.name == null
                      ? '1515/08/08'
                      : '${_userDetail.joinTime}')
                ],
              ),
            ),
          ),

          Divider(
            height: 1.0,
          ),

          //所在地区
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    '所在地区',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(_userDetail.city == null ? '北京' : '${_userDetail.city}'),
                ],
              ),
            ),
          ),

          Divider(
            height: 1.0,
          ),

          //开发平台
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    '开发平台',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(_userDetail.platforms == null
                      ? '<无>'
                      : '${_userDetail.platforms.toString()}'),
                ],
              ),
            ),
          ),

          Divider(
            height: 1.0,
          ),

          //个性签名
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    '个性签名',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text('这个人很懒，啥也没写'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getUserDetailInfo() async {
    Map<String, dynamic> map = Map();
    UserInfoUtil.getAccessToken().then((accessToken) {
      map['access_token'] = accessToken;
      map['dataType'] = 'json';
      NetUtil.post(AppUrls.USER_DETAIL_INFO, map).then((data) {
        if (data != null) {
          Map<String, dynamic> userDetailMap = json.decode(data);
          UserDetail userDetail = UserDetail().fromJson(userDetailMap);
          if (userDetail != null) {
            print(_userDetail.toString());
            setState(() {
              _userDetail = userDetail;
            });
          }
        }
      });
    });
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:origin_china/bean/message_bean_entity.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/utils/login_util.dart';
import 'package:origin_china/utils/net_util.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  List _tabTitles = ['@我', '评论', '私信'];
  int currentIndex;
  List<MessageList> messageList;
  int curPage = 1;

  @override
  void initState() {
    super.initState();
    _getMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabTitles.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("我的消息"),
            bottom: TabBar(
              tabs: _tabTitles.map((value) => Tab(text: value)).toList(),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text('没有更多数据'),
              ),
              Center(
                child: Text('没有更多数据'),
              ),
              _buildMessagePage(),
            ],
          ),
        ));
  }

  //创建我的私信页面
  Widget _buildMessagePage() {
    if (messageList == null) {
      return CupertinoActivityIndicator();
    } else {
      return _buildMessageList();
    }
  }

  //创建List列表
  Widget _buildMessageList() {
    return RefreshIndicator(
      child: ListView.separated(
          itemBuilder: (context, index) {
            MessageList message = messageList[index];
            return Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(message.portrait),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('${message.friendname}'),
                          Expanded(
                            child: Container(),
                          ),
                          Text('${message.pubDate}'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 230,
                            child: Text(
                              '${message.content}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: messageList.length),
      onRefresh: () {
        curPage = 1;
        return _getMessageList();
      },
    );
  }

  Future _getMessageList() async{
    UserInfoUtil.isLogin().then((isLogin) {
      if (isLogin) {
        UserInfoUtil.getAccessToken().then((accessToken) {
          Map<String, dynamic> params = Map<String, dynamic>();
          params['dataType'] = 'json';
          params['page'] = curPage;
          params['pageSize'] = 10;
          params['access_token'] = accessToken;
          NetUtil.get(AppUrls.USER_MESSAGE_LIST, params).then((data) {
            print('MY_INFORMATION: $data');
            if (data != null && data.isNotEmpty) {
              Map<String, dynamic> map = json.decode(data);
              MessageBean messageBean = MessageBean().fromJson(map);
              if (messageBean != null &&
                  messageBean.messageList != null &&
                  messageBean.messageList.isNotEmpty) {
                setState(() {
                  messageList = messageBean.messageList;
                });
              }
            }
          });
        });
      }
    });
  }
}

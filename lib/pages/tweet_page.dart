import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:origin_china/common/event_bus.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/pages/login_page.dart';
import 'package:origin_china/utils/login_util.dart';
import 'package:origin_china/utils/net_util.dart';
import 'package:origin_china/widgets/tweet_list_item.dart';

class TweetPage extends StatefulWidget {
  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = false;
  TabController _tabController;
  ScrollController _controller = ScrollController();
  bool isLoading = true;
  int curPage = 1;

  List hotTweetList;

  List latestTweetList;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels) {
        curPage++;
        _getTweetList(isLoadMore: false, isLoadHot: false);
      }
    });

    eventBus.on<LoginEvent>().listen((event) {
      if (!mounted) return;
      setState(() {
        this.isLogin = isLogin;
      });

      _getTweetList(isLoadMore: false, isLoadHot: false);
    });
    eventBus.on<LogoutEvent>().listen((event) {
//      _showUerInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动弹'),
        centerTitle: true,
        backgroundColor: Color(AppColors.APP_GREEN_COLOR),
        elevation: 0,
      ),
      body: _buildLayout(),
    );
  }

  Widget _buildLayout() {
//    if (isLoading) {
//      return Center(child: Container(
//          child: CupertinoActivityIndicator()
//      ));
//    }
    if (isLogin) {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(AppColors.APP_GREEN_COLOR),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xffffffff),
                tabs: [
                  Tab(
                    text: '最新',
                  ),
                  Tab(
                    text: '热门',
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [_buildLatestTweetList(), _buildHotTweetList()],
                ))
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('你还没有登录，请先登录'),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                String result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebLoginPage()));
                if (result != null && result == 'refresh') {
                  //登录成功
                  eventBus.fire(LoginEvent());
                }
                },
              child: Text(
                '点击登录',
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      );
    }
  }

  Future<void> _getTweetList({bool isLoadMore, bool isLoadHot}) async {
    UserInfoUtil.isLogin().then((isLogin) {
      if (isLogin) {
        UserInfoUtil.getAccessToken().then((accessToken) {
          if (accessToken == null || accessToken.length == 0) {
            return;
          }
          Map<String, dynamic> params = Map<String, dynamic>();
          params['access_token'] = accessToken;
          params['user'] = isLoadHot ? -1 : 0;
          params['page'] = curPage;
          params['pageSize'] = 10;
          params['dataType'] = 'json';

          NetUtil.get(AppUrls.TWEET_LIST, params).then((data) {
            print('TWEET_LIST: $data');
            if (data != null && data.isNotEmpty) {
              Map<String, dynamic> map = json.decode(data);
              List _tweetList = map['tweetlist'];
              if (!mounted) return;
              setState(() {
                if (isLoadMore) {
                  if (isLoadHot) {
                    latestTweetList.addAll(_tweetList);
                    hotTweetList.addAll(_tweetList);
                  }
                } else {
                  if (isLoadHot) {
                    hotTweetList = _tweetList;
                  } else {
                    latestTweetList = _tweetList;
                  }
                }
              });
            }
          });
        });
      }
    });
  }

  Widget _buildLatestTweetList() {
    if (latestTweetList == null) {
      _getTweetList(isLoadMore: false, isLoadHot: false);
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
      onRefresh: _pullToRefresh,
      child: ListView.separated(
          controller: _controller,
          itemBuilder: (context, index) {
            if (index == latestTweetList.length) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CupertinoActivityIndicator(),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text('正在加载...'),
                      ],
                    )),
              );
            }
            return TweetListItem(tweetData: latestTweetList[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10.0,
              color: Colors.grey[200],
            );
          },
          itemCount: latestTweetList.length + 1),
    );
  }

  Widget _buildHotTweetList() {
    if (hotTweetList == null) {
      _getTweetList(isLoadMore: false, isLoadHot: true);
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == hotTweetList.length) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(0xaaaaaaaa),
              child: Center(child: Text('没有更多数据了')),
            );
          }
          return TweetListItem(tweetData: hotTweetList[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.0,
            color: Color(0xaaaaaaaa),
          );
        },
        itemCount: hotTweetList.length + 1);
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    _getTweetList(isLoadMore: false, isLoadHot: false);
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _controller.dispose();
  }
}

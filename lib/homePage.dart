import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/pages/find_page.dart';
import 'package:origin_china/pages/my_page.dart';
import 'package:origin_china/pages/news_page.dart';
import 'package:origin_china/pages/tweet_page.dart';
import 'package:origin_china/widgets/lkx_drawer.dart';

class HomePager extends StatefulWidget {
  @override
  _HomePagerState createState() => _HomePagerState();
}

class _HomePagerState extends State<HomePager> {
  static List titles = ['咨询', '动弹', '发现', '我的'];
  List<Widget> pages = List();
  List<BottomNavigationBarItem> bottoms = List();
  List _iconPaths = [
    "assets/images/ic_nav_news_normal.png",
    'assets/images/ic_nav_tweet_normal.png',
    'assets/images/ic_nav_discover_normal.png',
    'assets/images/ic_nav_my_normal.png'
  ];
  List _activeIconPath = [
    "assets/images/ic_nav_news_actived.png",
    'assets/images/ic_nav_tweet_actived.png',
    'assets/images/ic_nav_discover_actived.png',
    'assets/images/ic_nav_my_pressed.png'
  ];

  List<IconData> drawerIcons = [
    Icons.send,
    Icons.home,
    Icons.error,
    Icons.settings
  ];
  List<String> drawerTiles = ['发布动弹', '动弹小黑屋', '关于', '设置'];

  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    initPage();
    initBottomItem();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
        backgroundColor: Color(AppColors.APP_THEME),
      ),
      body: PageView.builder(
        itemCount: titles.length,
        onPageChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return pages[currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottoms,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
      ),
      drawer: LkxDrawer(
        headImgPath:'assets/images/cover_img.jpg',
        menuIcons: drawerIcons,
        menuTitles: drawerTiles,
      ),
    );
  }

  void initPage() {
//    for (int i = 0; i < titles.length; i++) {
//      pages.add(Center(
//        child: Text(titles[i]),
//      ));
//    }
  pages.add(NewsPage());
  pages.add(TweetPage());
  pages.add(FindPage());
  pages.add(MyPage());
  }

  void initBottomItem() {
    for (int j = 0; j < titles.length; j++) {
      bottoms.add(BottomNavigationBarItem(
          icon: Image.asset(
            _iconPaths[j],
            width: 30,
            height: 30,
          ),
          activeIcon: Image.asset(
            _activeIconPath[j],
            width: 30,
            height: 30,
          ),
          title: Text(titles[j])));
    }
  }
}

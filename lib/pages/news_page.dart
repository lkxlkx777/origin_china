import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/widgets/lkx_drawer.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List<IconData> drawerIcons = [
    Icons.send,
    Icons.home,
    Icons.error,
    Icons.settings
  ];
  List<String> drawerTiles = ['发布动弹', '动弹小黑屋', '关于', '设置'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('咨询'),
        centerTitle: true,
        backgroundColor: Color(AppColors.APP_GREEN_COLOR),
      ),
      drawer: LkxDrawer(
        headImgPath:'assets/images/cover_img.jpg',
        menuIcons: drawerIcons,
        menuTitles: drawerTiles,
      ),
    );
  }
}

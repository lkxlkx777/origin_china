import 'package:flutter/material.dart';
import 'package:origin_china/common/event_bus.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/pages/login_page.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<LoginEvent>().listen((event) {

    });

    eventBus.on<LogoutEvent>().listen((event) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return buildListItem(index);
    },
        separatorBuilder: (BuildContext context, int index){
          return Divider();
        },
        itemCount: menuTitles.length+1);
  }

  StatelessWidget buildListItem(int index) {
     if(index == 0){
      return Container(
        height: 180,
        color: Color(AppColors.APP_THEME),
        child:GestureDetector(
          onTap: (){
            print("点击了头布局");
            _login(context);
          },
          child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Image.asset("assets/images/ic_avatar_default.png"),
              backgroundColor: Color(0xffffff),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '点击头像登录',
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
        ),
      );
    }else{
      index-=1;
      return ListTile(
        leading: Icon(menuIcons[index]),
        title: Text(menuTitles[index]),
        trailing: Icon(Icons.arrow_forward),
      );
    }
  }

  //调用登录
  Future<void> _login(context) async {
    String result = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return WebLoginPage();
    }));

    if(result!=null && result=='refresh'){
        //登录成功
      eventBus.fire(LoginEvent());
    }
  }
}

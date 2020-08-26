import 'package:flutter/material.dart';
import 'package:origin_china/pages/about_page.dart';
import 'package:origin_china/pages/setting_page.dart';
import 'package:origin_china/pages/publish_tweet_page.dart';
import 'package:origin_china/pages/tweet_black_house_page.dart';

class LkxDrawer extends StatelessWidget {

  final String headImgPath;
  final List menuTitles;
  final List menuIcons;


  LkxDrawer(
      {Key key,
        @required this.headImgPath,
        @required this.menuTitles,
        @required this.menuIcons})
      : assert(headImgPath != null),
        assert(menuTitles != null),
        assert(menuIcons != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext context, int index){
            if(index==0){
              return Image.asset(headImgPath,fit: BoxFit.contain,);
            }else{
              index -=1;
              return ListTile(
                leading: Icon(menuIcons[index]),
                trailing: Icon(Icons.arrow_forward),
                title: Text(menuTitles[index]),
                onTap: (){
                  switch(index){
                    case 0:
                      _navPush(context, PublishTweet());
                      break;
                    case 1:
                      _navPush(context, TweetBlackHouse());
                      break;
                    case 2:
                      _navPush(context, About());
                      break;
                    case 3:
                      _navPush(context, Setting());
                      break;
                    case 4:
                      break;
                  }
                },
              );
            }
          },
          separatorBuilder: (BuildContext context, int index){
            if(index==0){
              return Divider(height: 0.0);
            }else{
              return Divider(height: 1.0,);
            }
          },
          itemCount: menuTitles.length+1),
    );
  }

  _navPush(BuildContext context,Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return page;
    }));
  }

}

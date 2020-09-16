import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:origin_china/widgets/lkx_app_bar.dart';

class ShakePage extends StatefulWidget {
  @override
  _ShakePageState createState() => _ShakePageState();
}

class _ShakePageState extends State<ShakePage> {

  int currentIndex = 0;
  String text ="摇一摇抢礼品";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LkxAppBar(title: "摇一摇",),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Image.asset("assets/images/shake.png",
             width: 120,
             height: 120,),
           SizedBox(height: 20,),
           Text(text),
         ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.card_giftcard),
            title: Text('礼品'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.card_giftcard),
            title: Text('咨询'),
          )
        ],
        currentIndex: currentIndex,
        onTap: (currentIndex){
          if(currentIndex == 0){
            setState(() {
              text = "摇一摇抢礼品";
            });
          }else if(currentIndex == 1){
            setState(() {
              text = "摇一摇获取咨询";
            });
          }
        },
      ),
    );
  }
}

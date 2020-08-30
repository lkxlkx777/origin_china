import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/utils/net_util.dart';
import 'package:origin_china/utils/login_util.dart';

class WebLoginPage extends StatefulWidget {
  @override
  _WebLoginPageState createState() => _WebLoginPageState();
}

class _WebLoginPageState extends State<WebLoginPage> {

  FlutterWebviewPlugin _webviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;
  String reqUrl;

  @override
  void initState() {
    super.initState();
    initData();
    initListion(context);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> appBar = [
      Text('登录开源中国',style: TextStyle(color: Color(AppColors.APP_BAR_COLOR)),)
    ];

    if(isLoading){
      appBar.add(SizedBox(width: 10,));
      appBar.add(CupertinoActivityIndicator());
    }

    return WebviewScaffold(
      url: reqUrl,
      appBar: AppBar(
        title: Row(
          children: appBar,
        ),
      ),
      withJavascript: true,//允许执行js
      withLocalStorage: true,//允许本地存储
      withZoom: true,//允许网页缩放
    );
  }

  @override
  void dispose() {
    super.dispose();
    _webviewPlugin.close();
  }

  void initData() {
    StringBuffer sb = StringBuffer(AppUrls.OAUTH2_AUTHORIZE);
    sb..write("?")
      ..write("response_type=code&")
      ..write("client_id=")
      ..write(AppInfo.CLIENT_ID)
      ..write("&redirect_uri=")
      ..write(AppInfo.REDIRECT_URI);
    reqUrl = sb.toString();
  }

  void initListion(BuildContext context) {
    _webviewPlugin.onUrlChanged.listen((url) {
      print("***_webviewPlugin onUrlChanged event=$url ***");
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

      //https://www.dongnaoedu.com/?code=G7Nd1C&state= ***
      if(url!=null && url.length>0 && url.contains("code=")){
          //登录成功，获取token
        String code = url.split("code=")[1].split("&")[0].toString();
          print("******code=$code********");
        Map<String,dynamic> map = Map();
        map['client_id'] = AppInfo.CLIENT_ID;
        map['client_secret'] = AppInfo.CLIENT_SECRET;
        map['grant_type'] = "authorization_code";
        map['redirect_uri'] = AppInfo.REDIRECT_URI;
        map['code'] = code;
        map['dataType'] = "json";

        NetUtil.get(AppUrls.OAUTH2_TOKEN, map).then((value){
          print("---------获取成功token value=$value");
          if(value!=null && value.length>0){
            Map<String,dynamic> decode = json.decode(value);
            if(map!=null && map.isNotEmpty){
              UserInfoUtil.saveUserInfo(decode);
              Navigator.pop(context,"refresh");
            }
          }
        });
      }



    });
  }

}



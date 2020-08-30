import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetUtil{

  static Future<String> get(String url,Map<String,dynamic> map) async{
      if(url!=null) {
        StringBuffer sb = StringBuffer(url);
        String reqUrl = url;
        sb.write("?");
        if (map != null && map.isNotEmpty) {
          map.forEach((key, value) {
            sb.write("$key=$value&");
          });
          reqUrl = sb.toString().substring(0, sb.length - 1);
        }
        print("get reqUrl= $reqUrl");
        http.Response response = await http.get(reqUrl);
        return response.body;
      }
  }

  static Future<String> post(String url,Map<String,dynamic> map) async{
    if(url!=null && map!=null){
      http.Response response = await http.post(url,body: map);
      return response.body;
    }
  }

}
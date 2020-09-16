import 'package:origin_china/bean/user_info_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoUtil {
  static const String SP_ACCESS_TOKEN = 'access_token';
  static const String SP_REFRESH_TOKEN = 'refresh_token';
  static const String SP_UID = 'uid';
  static const String SP_TOKEN_TYPE = 'token_type';
  static const String SP_EXPIRES_IN = 'expires_in';
  static const String SP_IS_LOGIN = 'is_login';

  static const String SP_USER_ID = 'user_id';
  static const String SP_USER_NAME = 'user_name';
  static const String SP_AVATAR = 'avatar';
  static const String SP_EMAIL = 'email';
  static const String SP_GENDER = 'gender';
  static const String SP_LOCATION = 'location';
  static const String SP_URL = 'url';

  static Future<void> saveLoginInfo(Map<String, dynamic> map) async {
    if (map != null && map.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp
        ..setString(SP_ACCESS_TOKEN, map[SP_ACCESS_TOKEN])
        ..setString(SP_REFRESH_TOKEN, map[SP_REFRESH_TOKEN])
        ..setInt(SP_UID, map[SP_UID])
        ..setString(SP_TOKEN_TYPE, map[SP_TOKEN_TYPE])
        ..setInt(SP_EXPIRES_IN, map[SP_EXPIRES_IN])
        ..setBool(SP_IS_LOGIN, true);
    }
  }

  static Future<void> clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp
      ..setString(SP_ACCESS_TOKEN, '')
      ..setString(SP_REFRESH_TOKEN, '')
      ..setInt(SP_UID, -1)
      ..setString(SP_TOKEN_TYPE, '')
      ..setInt(SP_EXPIRES_IN, -1)
      ..setBool(SP_IS_LOGIN, false);
  }

  //是否登录
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool(SP_IS_LOGIN);
    return isLogin != null && isLogin;
  }

  //获取token
  static Future<String> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_ACCESS_TOKEN);
  }

  static Future<UserInfo> saveUserInfo(Map<String, dynamic> map) async {
    if (map != null && map.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      int id = map['id'];
      String email = map['email'];
      String name = map['name'];
      String gender = map['gender'];
      String avatar = map['avatar'];
      String location = map['location'];
      String url = map['url'];

      sp
        ..setString(SP_GENDER, gender)
        ..setString(SP_USER_NAME, name)
        ..setString(SP_LOCATION, location)
        ..setInt(SP_USER_ID, id)
        ..setString(SP_AVATAR, avatar)
        ..setString(SP_EMAIL, email)
        ..setString(SP_URL, url);

      UserInfo user = new UserInfo(
          id: id,
          name: name,
          gender: gender,
          avatar: avatar,
          email: email,
          location: location,
          url: url);
      return user;
    }
  }

  static Future<UserInfo> getUserInfo() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool(SP_IS_LOGIN);
    if(!isLogin){
      return null;
    }
    int id = sp.getInt(SP_USER_ID);
    String gender = sp.getString(SP_GENDER);
    String name = sp.getString(SP_USER_NAME);
    String location = sp.getString(SP_LOCATION);
    String email = sp.getString(SP_EMAIL);
    String url = sp.getString(SP_URL);
    String avatar = sp.getString(SP_AVATAR);

    UserInfo user = new UserInfo(
        id: id,
        name: name,
        gender: gender,
        avatar: avatar,
        email: email,
        location: location,
        url: url);
    return user;
  }

}

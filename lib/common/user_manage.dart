import 'package:origin_china/bean/user_info_entity.dart';
import 'package:origin_china/utils/login_util.dart';

class UserManage{

  static UserManage _userManage = UserManage();

  UserInfo userInfo;

  static UserManage getInstance(){
    return _userManage;
  }

  _setUserInfo(UserInfo userInfo){
    this.userInfo = userInfo;
//    UserInfoUtil.saveUserInfo(userInfo);
  }

  UserInfo _getUserInfo(){
//    if(userInfo!=null){
//      return userInfo;
//    }else{
//      userInfo;
//    }
  }

}
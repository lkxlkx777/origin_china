import 'package:origin_china/generated/json/base/json_convert_content.dart';

class UserInfo with JsonConvert<UserInfo> {
	int id;
	String email;
	String name;
	String gender;
	String avatar;
	String location;
	String url;


	UserInfo({this.id, this.email, this.name, this.gender, this.avatar,
      this.location, this.url});

  @override
  String toString() {
    return 'UserInfoEntity{id: $id, email: $email, name: $name, gender: $gender, avatar: $avatar, location: $location, url: $url}';
  }
}

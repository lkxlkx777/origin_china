import 'package:origin_china/generated/json/base/json_convert_content.dart';

class UserDetail with JsonConvert<UserDetail> {
	int uid;
	String name;
	String ident;
	int gender;
	int relation;
	String province;
	String city;
	List<String> platforms;
	List<String> expertise;
	String joinTime;
	String lastLoginTime;
	String portrait;
	UserDetailNotice notice;
}

class UserDetailNotice with JsonConvert<UserDetailNotice> {
	int replyCount;
	int msgCount;
	int fansCount;
	int referCount;
}

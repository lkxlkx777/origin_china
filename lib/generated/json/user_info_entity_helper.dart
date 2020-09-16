import 'package:origin_china/bean/user_info_entity.dart';

userInfoFromJson(UserInfo data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['location'] != null) {
		data.location = json['location']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> userInfoToJson(UserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['name'] = entity.name;
	data['gender'] = entity.gender;
	data['avatar'] = entity.avatar;
	data['location'] = entity.location;
	data['url'] = entity.url;
	return data;
}
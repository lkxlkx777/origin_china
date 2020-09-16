import 'package:origin_china/bean/user_detail_entity.dart';

userDetailFromJson(UserDetail data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['ident'] != null) {
		data.ident = json['ident']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['relation'] != null) {
		data.relation = json['relation']?.toInt();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['platforms'] != null) {
		data.platforms = json['platforms']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['expertise'] != null) {
		data.expertise = json['expertise']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['joinTime'] != null) {
		data.joinTime = json['joinTime']?.toString();
	}
	if (json['lastLoginTime'] != null) {
		data.lastLoginTime = json['lastLoginTime']?.toString();
	}
	if (json['portrait'] != null) {
		data.portrait = json['portrait']?.toString();
	}
	if (json['notice'] != null) {
		data.notice = new UserDetailNotice().fromJson(json['notice']);
	}
	return data;
}

Map<String, dynamic> userDetailToJson(UserDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['name'] = entity.name;
	data['ident'] = entity.ident;
	data['gender'] = entity.gender;
	data['relation'] = entity.relation;
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['platforms'] = entity.platforms;
	data['expertise'] = entity.expertise;
	data['joinTime'] = entity.joinTime;
	data['lastLoginTime'] = entity.lastLoginTime;
	data['portrait'] = entity.portrait;
	if (entity.notice != null) {
		data['notice'] = entity.notice.toJson();
	}
	return data;
}

userDetailNoticeFromJson(UserDetailNotice data, Map<String, dynamic> json) {
	if (json['replyCount'] != null) {
		data.replyCount = json['replyCount']?.toInt();
	}
	if (json['msgCount'] != null) {
		data.msgCount = json['msgCount']?.toInt();
	}
	if (json['fansCount'] != null) {
		data.fansCount = json['fansCount']?.toInt();
	}
	if (json['referCount'] != null) {
		data.referCount = json['referCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> userDetailNoticeToJson(UserDetailNotice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['replyCount'] = entity.replyCount;
	data['msgCount'] = entity.msgCount;
	data['fansCount'] = entity.fansCount;
	data['referCount'] = entity.referCount;
	return data;
}
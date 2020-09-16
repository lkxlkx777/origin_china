import 'package:origin_china/bean/message_bean_entity.dart';

messageBeanEntityFromJson(MessageBean data, Map<String, dynamic> json) {
	if (json['notice'] != null) {
		data.notice = new MessageBeanNotice().fromJson(json['notice']);
	}
	if (json['messageList'] != null) {
		data.messageList = new List<MessageList>();
		(json['messageList'] as List).forEach((v) {
			data.messageList.add(new MessageList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> messageBeanEntityToJson(MessageBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.notice != null) {
		data['notice'] = entity.notice.toJson();
	}
	if (entity.messageList != null) {
		data['messageList'] =  entity.messageList.map((v) => v.toJson()).toList();
	}
	return data;
}

messageBeanNoticeFromJson(MessageBeanNotice data, Map<String, dynamic> json) {
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

Map<String, dynamic> messageBeanNoticeToJson(MessageBeanNotice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['replyCount'] = entity.replyCount;
	data['msgCount'] = entity.msgCount;
	data['fansCount'] = entity.fansCount;
	data['referCount'] = entity.referCount;
	return data;
}

messageBeanMessageListFromJson(MessageList data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['senderid'] != null) {
		data.senderid = json['senderid']?.toInt();
	}
	if (json['sender'] != null) {
		data.sender = json['sender']?.toString();
	}
	if (json['friendid'] != null) {
		data.friendid = json['friendid']?.toInt();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['pubDate'] != null) {
		data.pubDate = json['pubDate']?.toString();
	}
	if (json['friendname'] != null) {
		data.friendname = json['friendname']?.toString();
	}
	if (json['messageCount'] != null) {
		data.messageCount = json['messageCount']?.toInt();
	}
	if (json['portrait'] != null) {
		data.portrait = json['portrait']?.toString();
	}
	return data;
}

Map<String, dynamic> messageBeanMessageListToJson(MessageList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['senderid'] = entity.senderid;
	data['sender'] = entity.sender;
	data['friendid'] = entity.friendid;
	data['id'] = entity.id;
	data['pubDate'] = entity.pubDate;
	data['friendname'] = entity.friendname;
	data['messageCount'] = entity.messageCount;
	data['portrait'] = entity.portrait;
	return data;
}
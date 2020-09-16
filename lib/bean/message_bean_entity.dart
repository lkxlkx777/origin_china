import 'package:origin_china/generated/json/base/json_convert_content.dart';

class MessageBean with JsonConvert<MessageBean> {
	MessageBeanNotice notice;
	List<MessageList> messageList;
}

class MessageBeanNotice with JsonConvert<MessageBeanNotice> {
	int replyCount;
	int msgCount;
	int fansCount;
	int referCount;
}

class MessageList with JsonConvert<MessageList> {
	String content;
	int senderid;
	String sender;
	int friendid;
	int id;
	String pubDate;
	String friendname;
	int messageCount;
	String portrait;
}

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:origin_china/bean/message_bean_entity.dart';
import 'package:origin_china/generated/json/message_bean_entity_helper.dart';
import 'package:origin_china/bean/user_detail_entity.dart';
import 'package:origin_china/generated/json/user_detail_entity_helper.dart';
import 'package:origin_china/bean/user_info_entity.dart';
import 'package:origin_china/generated/json/user_info_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case MessageBean:
			return messageBeanEntityFromJson(data as MessageBean, json) as T;			case MessageBeanNotice:
			return messageBeanNoticeFromJson(data as MessageBeanNotice, json) as T;			case MessageList:
			return messageBeanMessageListFromJson(data as MessageList, json) as T;			case UserDetail:
			return userDetailFromJson(data as UserDetail, json) as T;			case UserDetailNotice:
			return userDetailNoticeFromJson(data as UserDetailNotice, json) as T;			case UserInfo:
			return userInfoFromJson(data as UserInfo, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case MessageBean:
			return messageBeanEntityToJson(data as MessageBean);			case MessageBeanNotice:
			return messageBeanNoticeToJson(data as MessageBeanNotice);			case MessageList:
			return messageBeanMessageListToJson(data as MessageList);			case UserDetail:
			return userDetailToJson(data as UserDetail);			case UserDetailNotice:
			return userDetailNoticeToJson(data as UserDetailNotice);			case UserInfo:
			return userInfoToJson(data as UserInfo);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'MessageBeanEntity':
			return MessageBean().fromJson(json);			case 'MessageBeanNotice':
			return MessageBeanNotice().fromJson(json);			case 'MessageBeanMessageList':
			return MessageList().fromJson(json);			case 'UserDetail':
			return UserDetail().fromJson(json);			case 'UserDetailNotice':
			return UserDetailNotice().fromJson(json);			case 'UserInfo':
			return UserInfo().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'MessageBeanEntity':
			return List<MessageBean>();			case 'MessageBeanNotice':
			return List<MessageBeanNotice>();			case 'MessageBeanMessageList':
			return List<MessageList>();			case 'UserDetail':
			return List<UserDetail>();			case 'UserDetailNotice':
			return List<UserDetailNotice>();			case 'UserInfo':
			return List<UserInfo>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
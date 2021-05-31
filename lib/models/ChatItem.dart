/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the ChatItem type in your schema. */
@immutable
class ChatItem extends Model {
  static const classType = const _ChatItemModelType();
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final String imageUrl;
  final ChatItemTyp chatItemType;
  final String chatID;
  final TemporalTimestamp createdOn;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const ChatItem._internal(
      {@required this.id,
      @required this.senderId,
      @required this.receiverId,
      this.message,
      this.imageUrl,
      @required this.chatItemType,
      @required this.chatID,
      this.createdOn});

  factory ChatItem(
      {String id,
      @required String senderId,
      @required String receiverId,
      String message,
      String imageUrl,
      @required ChatItemTyp chatItemType,
      @required String chatID,
      TemporalTimestamp createdOn}) {
    return ChatItem._internal(
        id: id == null ? UUID.getUUID() : id,
        senderId: senderId,
        receiverId: receiverId,
        message: message,
        imageUrl: imageUrl,
        chatItemType: chatItemType,
        chatID: chatID,
        createdOn: createdOn);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatItem &&
        id == other.id &&
        senderId == other.senderId &&
        receiverId == other.receiverId &&
        message == other.message &&
        imageUrl == other.imageUrl &&
        chatItemType == other.chatItemType &&
        chatID == other.chatID &&
        createdOn == other.createdOn;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ChatItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("senderId=" + "$senderId" + ", ");
    buffer.write("receiverId=" + "$receiverId" + ", ");
    buffer.write("message=" + "$message" + ", ");
    buffer.write("imageUrl=" + "$imageUrl" + ", ");
    buffer.write("chatItemType=" +
        (chatItemType != null ? enumToString(chatItemType) : "null") +
        ", ");
    buffer.write("chatID=" + "$chatID" + ", ");
    buffer.write(
        "createdOn=" + (createdOn != null ? createdOn.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ChatItem copyWith(
      {String id,
      String senderId,
      String receiverId,
      String message,
      String imageUrl,
      ChatItemTyp chatItemType,
      String chatID,
      TemporalTimestamp createdOn}) {
    return ChatItem(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        message: message ?? this.message,
        imageUrl: imageUrl ?? this.imageUrl,
        chatItemType: chatItemType ?? this.chatItemType,
        chatID: chatID ?? this.chatID,
        createdOn: createdOn ?? this.createdOn);
  }

  ChatItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        senderId = json['senderId'],
        receiverId = json['receiverId'],
        message = json['message'],
        imageUrl = json['imageUrl'],
        chatItemType = enumFromString<ChatItemTyp>(
            json['chatItemType'], ChatItemTyp.values),
        chatID = json['chatID'],
        createdOn = json['createdOn'] != null
            ? TemporalTimestamp.fromSeconds(json['createdOn'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'senderId': senderId,
        'receiverId': receiverId,
        'message': message,
        'imageUrl': imageUrl,
        'chatItemType': enumToString(chatItemType),
        'chatID': chatID,
        'createdOn': createdOn?.toSeconds()
      };

  static final QueryField ID = QueryField(fieldName: "chatItem.id");
  static final QueryField SENDERID = QueryField(fieldName: "senderId");
  static final QueryField RECEIVERID = QueryField(fieldName: "receiverId");
  static final QueryField MESSAGE = QueryField(fieldName: "message");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField CHATITEMTYPE = QueryField(fieldName: "chatItemType");
  static final QueryField CHATID = QueryField(fieldName: "chatID");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ChatItem";
    modelSchemaDefinition.pluralName = "ChatItems";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.SENDERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.RECEIVERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.MESSAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.IMAGEURL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.CHATITEMTYPE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.CHATID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ChatItem.CREATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)));
  });
}

class _ChatItemModelType extends ModelType<ChatItem> {
  const _ChatItemModelType();

  @override
  ChatItem fromJson(Map<String, dynamic> jsonData) {
    return ChatItem.fromJson(jsonData);
  }
}

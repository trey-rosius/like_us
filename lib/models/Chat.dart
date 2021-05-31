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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Chat type in your schema. */
@immutable
class Chat extends Model {
  static const classType = const _ChatModelType();
  final String id;
  final String lastMessage;
  final String receiverId;
  final String senderId;
  final TemporalDateTime createdOn;
  final TemporalDateTime updatedOn;
  final List<ChatItem> ChatItems;
  final List<UserChat> users;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Chat._internal(
      {@required this.id,
      @required this.lastMessage,
      @required this.receiverId,
      @required this.senderId,
      this.createdOn,
      this.updatedOn,
      this.ChatItems,
      this.users});

  factory Chat(
      {String id,
      @required String lastMessage,
      @required String receiverId,
      @required String senderId,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      List<ChatItem> ChatItems,
      List<UserChat> users}) {
    return Chat._internal(
        id: id == null ? UUID.getUUID() : id,
        lastMessage: lastMessage,
        receiverId: receiverId,
        senderId: senderId,
        createdOn: createdOn,
        updatedOn: updatedOn,
        ChatItems: ChatItems != null ? List.unmodifiable(ChatItems) : ChatItems,
        users: users != null ? List.unmodifiable(users) : users);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Chat &&
        id == other.id &&
        lastMessage == other.lastMessage &&
        receiverId == other.receiverId &&
        senderId == other.senderId &&
        createdOn == other.createdOn &&
        updatedOn == other.updatedOn &&
        DeepCollectionEquality().equals(ChatItems, other.ChatItems) &&
        DeepCollectionEquality().equals(users, other.users);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Chat {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("lastMessage=" + "$lastMessage" + ", ");
    buffer.write("receiverId=" + "$receiverId" + ", ");
    buffer.write("senderId=" + "$senderId" + ", ");
    buffer.write("createdOn=" +
        (createdOn != null ? createdOn.format() : "null") +
        ", ");
    buffer.write(
        "updatedOn=" + (updatedOn != null ? updatedOn.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Chat copyWith(
      {String id,
      String lastMessage,
      String receiverId,
      String senderId,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      List<ChatItem> ChatItems,
      List<UserChat> users}) {
    return Chat(
        id: id ?? this.id,
        lastMessage: lastMessage ?? this.lastMessage,
        receiverId: receiverId ?? this.receiverId,
        senderId: senderId ?? this.senderId,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
        ChatItems: ChatItems ?? this.ChatItems,
        users: users ?? this.users);
  }

  Chat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        lastMessage = json['lastMessage'],
        receiverId = json['receiverId'],
        senderId = json['senderId'],
        createdOn = json['createdOn'] != null
            ? TemporalDateTime.fromString(json['createdOn'])
            : null,
        updatedOn = json['updatedOn'] != null
            ? TemporalDateTime.fromString(json['updatedOn'])
            : null,
        ChatItems = json['ChatItems'] is List
            ? (json['ChatItems'] as List)
                .map((e) => ChatItem.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        users = json['users'] is List
            ? (json['users'] as List)
                .map((e) => UserChat.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastMessage': lastMessage,
        'receiverId': receiverId,
        'senderId': senderId,
        'createdOn': createdOn?.format(),
        'updatedOn': updatedOn?.format(),
        'ChatItems': ChatItems?.map((e) => e?.toJson())?.toList(),
        'users': users?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "chat.id");
  static final QueryField LASTMESSAGE = QueryField(fieldName: "lastMessage");
  static final QueryField RECEIVERID = QueryField(fieldName: "receiverId");
  static final QueryField SENDERID = QueryField(fieldName: "senderId");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField CHATITEMS = QueryField(
      fieldName: "ChatItems",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ChatItem).toString()));
  static final QueryField USERS = QueryField(
      fieldName: "users",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserChat).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Chat";
    modelSchemaDefinition.pluralName = "Chats";

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
        key: Chat.LASTMESSAGE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Chat.RECEIVERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Chat.SENDERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Chat.CREATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Chat.UPDATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Chat.CHATITEMS,
        isRequired: false,
        ofModelName: (ChatItem).toString(),
        associatedKey: ChatItem.CHATID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Chat.USERS,
        isRequired: false,
        ofModelName: (UserChat).toString(),
        associatedKey: UserChat.CHAT));
  });
}

class _ChatModelType extends ModelType<Chat> {
  const _ChatModelType();

  @override
  Chat fromJson(Map<String, dynamic> jsonData) {
    return Chat.fromJson(jsonData);
  }
}

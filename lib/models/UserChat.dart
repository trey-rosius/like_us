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

/** This is an auto generated class representing the UserChat type in your schema. */
@immutable
class UserChat extends Model {
  static const classType = const _UserChatModelType();
  final String id;
  final User user;
  final Chat chat;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserChat._internal(
      {@required this.id, @required this.user, @required this.chat});

  factory UserChat({String id, @required User user, @required Chat chat}) {
    return UserChat._internal(
        id: id == null ? UUID.getUUID() : id, user: user, chat: chat);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserChat &&
        id == other.id &&
        user == other.user &&
        chat == other.chat;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserChat {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user=" + (user != null ? user.toString() : "null") + ", ");
    buffer.write("chat=" + (chat != null ? chat.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  UserChat copyWith({String id, User user, Chat chat}) {
    return UserChat(
        id: id ?? this.id, user: user ?? this.user, chat: chat ?? this.chat);
  }

  UserChat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user = json['user'] != null
            ? User.fromJson(new Map<String, dynamic>.from(json['user']))
            : null,
        chat = json['chat'] != null
            ? Chat.fromJson(new Map<String, dynamic>.from(json['chat']))
            : null;

  Map<String, dynamic> toJson() =>
      {'id': id, 'user': user?.toJson(), 'chat': chat?.toJson()};

  static final QueryField ID = QueryField(fieldName: "userChat.id");
  static final QueryField USER = QueryField(
      fieldName: "user",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (User).toString()));
  static final QueryField CHAT = QueryField(
      fieldName: "chat",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Chat).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserChat";
    modelSchemaDefinition.pluralName = "UserChats";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ]),
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: UserChat.USER,
        isRequired: true,
        targetName: "userID",
        ofModelName: (User).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: UserChat.CHAT,
        isRequired: true,
        targetName: "chatID",
        ofModelName: (Chat).toString()));
  });
}

class _UserChatModelType extends ModelType<UserChat> {
  const _UserChatModelType();

  @override
  UserChat fromJson(Map<String, dynamic> jsonData) {
    return UserChat.fromJson(jsonData);
  }
}

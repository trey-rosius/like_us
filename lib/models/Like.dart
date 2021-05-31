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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Like type in your schema. */
@immutable
class Like extends Model {
  static const classType = const _LikeModelType();
  final String id;
  final int count;
  final String postID;
  final String userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Like._internal(
      {@required this.id, this.count, this.postID, this.userID});

  factory Like({String id, int count, String postID, String userID}) {
    return Like._internal(
        id: id == null ? UUID.getUUID() : id,
        count: count,
        postID: postID,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Like &&
        id == other.id &&
        count == other.count &&
        postID == other.postID &&
        userID == other.userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Like {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("count=" + (count != null ? count.toString() : "null") + ", ");
    buffer.write("postID=" + "$postID" + ", ");
    buffer.write("userID=" + "$userID");
    buffer.write("}");

    return buffer.toString();
  }

  Like copyWith({String id, int count, String postID, String userID}) {
    return Like(
        id: id ?? this.id,
        count: count ?? this.count,
        postID: postID ?? this.postID,
        userID: userID ?? this.userID);
  }

  Like.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        count = json['count'],
        postID = json['postID'],
        userID = json['userID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'count': count, 'postID': postID, 'userID': userID};

  static final QueryField ID = QueryField(fieldName: "like.id");
  static final QueryField COUNT = QueryField(fieldName: "count");
  static final QueryField POSTID = QueryField(fieldName: "postID");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Like";
    modelSchemaDefinition.pluralName = "Likes";

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
        key: Like.COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Like.POSTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Like.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _LikeModelType extends ModelType<Like> {
  const _LikeModelType();

  @override
  Like fromJson(Map<String, dynamic> jsonData) {
    return Like.fromJson(jsonData);
  }
}

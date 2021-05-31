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

/** This is an auto generated class representing the Comments type in your schema. */
@immutable
class Comments extends Model {
  static const classType = const _CommentsModelType();
  final String id;
  final String comment;
  final String postID;
  final String userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Comments._internal(
      {@required this.id, this.comment, this.postID, this.userID});

  factory Comments({String id, String comment, String postID, String userID}) {
    return Comments._internal(
        id: id == null ? UUID.getUUID() : id,
        comment: comment,
        postID: postID,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comments &&
        id == other.id &&
        comment == other.comment &&
        postID == other.postID &&
        userID == other.userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Comments {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("comment=" + "$comment" + ", ");
    buffer.write("postID=" + "$postID" + ", ");
    buffer.write("userID=" + "$userID");
    buffer.write("}");

    return buffer.toString();
  }

  Comments copyWith({String id, String comment, String postID, String userID}) {
    return Comments(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        postID: postID ?? this.postID,
        userID: userID ?? this.userID);
  }

  Comments.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        comment = json['comment'],
        postID = json['postID'],
        userID = json['userID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'comment': comment, 'postID': postID, 'userID': userID};

  static final QueryField ID = QueryField(fieldName: "comments.id");
  static final QueryField COMMENT = QueryField(fieldName: "comment");
  static final QueryField POSTID = QueryField(fieldName: "postID");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comments";
    modelSchemaDefinition.pluralName = "Comments";

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
        key: Comments.COMMENT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comments.POSTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comments.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _CommentsModelType extends ModelType<Comments> {
  const _CommentsModelType();

  @override
  Comments fromJson(Map<String, dynamic> jsonData) {
    return Comments.fromJson(jsonData);
  }
}

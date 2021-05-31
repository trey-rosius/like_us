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

/** This is an auto generated class representing the Comment type in your schema. */
@immutable
class Comment extends Model {
  static const classType = const _CommentModelType();
  final String id;
  final String commentText;
  final TemporalDateTime createdOn;
  final TemporalDateTime updatedOn;
  final String userID;
  final String postID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Comment._internal(
      {@required this.id,
      @required this.commentText,
      this.createdOn,
      this.updatedOn,
      this.userID,
      this.postID});

  factory Comment(
      {String id,
      @required String commentText,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      String userID,
      String postID}) {
    return Comment._internal(
        id: id == null ? UUID.getUUID() : id,
        commentText: commentText,
        createdOn: createdOn,
        updatedOn: updatedOn,
        userID: userID,
        postID: postID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
        id == other.id &&
        commentText == other.commentText &&
        createdOn == other.createdOn &&
        updatedOn == other.updatedOn &&
        userID == other.userID &&
        postID == other.postID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Comment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("commentText=" + "$commentText" + ", ");
    buffer.write("createdOn=" +
        (createdOn != null ? createdOn.format() : "null") +
        ", ");
    buffer.write("updatedOn=" +
        (updatedOn != null ? updatedOn.format() : "null") +
        ", ");
    buffer.write("userID=" + "$userID" + ", ");
    buffer.write("postID=" + "$postID");
    buffer.write("}");

    return buffer.toString();
  }

  Comment copyWith(
      {String id,
      String commentText,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      String userID,
      String postID}) {
    return Comment(
        id: id ?? this.id,
        commentText: commentText ?? this.commentText,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
        userID: userID ?? this.userID,
        postID: postID ?? this.postID);
  }

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        commentText = json['commentText'],
        createdOn = json['createdOn'] != null
            ? TemporalDateTime.fromString(json['createdOn'])
            : null,
        updatedOn = json['updatedOn'] != null
            ? TemporalDateTime.fromString(json['updatedOn'])
            : null,
        userID = json['userID'],
        postID = json['postID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'commentText': commentText,
        'createdOn': createdOn?.format(),
        'updatedOn': updatedOn?.format(),
        'userID': userID,
        'postID': postID
      };

  static final QueryField ID = QueryField(fieldName: "comment.id");
  static final QueryField COMMENTTEXT = QueryField(fieldName: "commentText");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField POSTID = QueryField(fieldName: "postID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comment";
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
        key: Comment.COMMENTTEXT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comment.CREATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comment.UPDATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comment.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Comment.POSTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();

  @override
  Comment fromJson(Map<String, dynamic> jsonData) {
    return Comment.fromJson(jsonData);
  }
}

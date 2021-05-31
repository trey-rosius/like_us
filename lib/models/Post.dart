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

/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final String content;
  final String postImageUrl;
  final PostTyp postType;
  final PostStatus postStatus;
  final String userID;
  final TemporalDateTime createdOn;
  final TemporalDateTime updatedOn;
  final List<Comment> Comments;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Post._internal(
      {@required this.id,
      @required this.content,
      this.postImageUrl,
      @required this.postType,
      this.postStatus,
      this.userID,
      this.createdOn,
      this.updatedOn,
      this.Comments});

  factory Post(
      {String id,
      @required String content,
      String postImageUrl,
      @required PostTyp postType,
      PostStatus postStatus,
      String userID,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      List<Comment> Comments}) {
    return Post._internal(
        id: id == null ? UUID.getUUID() : id,
        content: content,
        postImageUrl: postImageUrl,
        postType: postType,
        postStatus: postStatus,
        userID: userID,
        createdOn: createdOn,
        updatedOn: updatedOn,
        Comments: Comments != null ? List.unmodifiable(Comments) : Comments);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        content == other.content &&
        postImageUrl == other.postImageUrl &&
        postType == other.postType &&
        postStatus == other.postStatus &&
        userID == other.userID &&
        createdOn == other.createdOn &&
        updatedOn == other.updatedOn &&
        DeepCollectionEquality().equals(Comments, other.Comments);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("content=" + "$content" + ", ");
    buffer.write("postImageUrl=" + "$postImageUrl" + ", ");
    buffer.write("postType=" +
        (postType != null ? enumToString(postType) : "null") +
        ", ");
    buffer.write("postStatus=" +
        (postStatus != null ? enumToString(postStatus) : "null") +
        ", ");
    buffer.write("userID=" + "$userID" + ", ");
    buffer.write("createdOn=" +
        (createdOn != null ? createdOn.format() : "null") +
        ", ");
    buffer.write(
        "updatedOn=" + (updatedOn != null ? updatedOn.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Post copyWith(
      {String id,
      String content,
      String postImageUrl,
      PostTyp postType,
      PostStatus postStatus,
      String userID,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      List<Comment> Comments}) {
    return Post(
        id: id ?? this.id,
        content: content ?? this.content,
        postImageUrl: postImageUrl ?? this.postImageUrl,
        postType: postType ?? this.postType,
        postStatus: postStatus ?? this.postStatus,
        userID: userID ?? this.userID,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
        Comments: Comments ?? this.Comments);
  }

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        postImageUrl = json['postImageUrl'],
        postType = enumFromString<PostTyp>(json['postType'], PostTyp.values),
        postStatus =
            enumFromString<PostStatus>(json['postStatus'], PostStatus.values),
        userID = json['userID'],
        createdOn = json['createdOn'] != null
            ? TemporalDateTime.fromString(json['createdOn'])
            : null,
        updatedOn = json['updatedOn'] != null
            ? TemporalDateTime.fromString(json['updatedOn'])
            : null,
        Comments = json['Comments'] is List
            ? (json['Comments'] as List)
                .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'postImageUrl': postImageUrl,
        'postType': enumToString(postType),
        'postStatus': enumToString(postStatus),
        'userID': userID,
        'createdOn': createdOn?.format(),
        'updatedOn': updatedOn?.format(),
        'Comments': Comments?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField POSTIMAGEURL = QueryField(fieldName: "postImageUrl");
  static final QueryField POSTTYPE = QueryField(fieldName: "postType");
  static final QueryField POSTSTATUS = QueryField(fieldName: "postStatus");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField COMMENTS = QueryField(
      fieldName: "Comments",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Comment).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";

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
        key: Post.CONTENT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.POSTIMAGEURL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.POSTTYPE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.POSTSTATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.CREATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.UPDATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Post.COMMENTS,
        isRequired: false,
        ofModelName: (Comment).toString(),
        associatedKey: Comment.POSTID));
  });
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();

  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}

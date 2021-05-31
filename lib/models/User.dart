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

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final String profilePicUrl;
  final String email;
  final List<Post> Posts;
  final List<UserChat> UserChats;
  final TemporalDateTime createdOn;
  final TemporalDateTime updatedOn;
  final List<Comment> Comments;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      @required this.username,
      this.firstName,
      this.lastName,
      @required this.isVerified,
      this.profilePicUrl,
      @required this.email,
      this.Posts,
      this.UserChats,
      this.createdOn,
      this.updatedOn,
      this.Comments});

  factory User(
      {String id,
      @required String username,
      String firstName,
      String lastName,
      @required bool isVerified,
      String profilePicUrl,
      @required String email,
      List<Post> Posts,
      List<UserChat> UserChats,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      List<Comment> Comments}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        isVerified: isVerified,
        profilePicUrl: profilePicUrl,
        email: email,
        Posts: Posts != null ? List.unmodifiable(Posts) : Posts,
        UserChats: UserChats != null ? List.unmodifiable(UserChats) : UserChats,
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
    return other is User &&
        id == other.id &&
        username == other.username &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        isVerified == other.isVerified &&
        profilePicUrl == other.profilePicUrl &&
        email == other.email &&
        DeepCollectionEquality().equals(Posts, other.Posts) &&
        DeepCollectionEquality().equals(UserChats, other.UserChats) &&
        createdOn == other.createdOn &&
        updatedOn == other.updatedOn &&
        DeepCollectionEquality().equals(Comments, other.Comments);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$username" + ", ");
    buffer.write("firstName=" + "$firstName" + ", ");
    buffer.write("lastName=" + "$lastName" + ", ");
    buffer.write("isVerified=" +
        (isVerified != null ? isVerified.toString() : "null") +
        ", ");
    buffer.write("profilePicUrl=" + "$profilePicUrl" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("createdOn=" +
        (createdOn != null ? createdOn.format() : "null") +
        ", ");
    buffer.write(
        "updatedOn=" + (updatedOn != null ? updatedOn.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String username,
      String firstName,
      String lastName,
      bool isVerified,
      String profilePicUrl,
      String email,
      List<Post> Posts,
      List<UserChat> UserChats,
      TemporalDateTime createdOn,
      TemporalDateTime updatedOn,
      List<Comment> Comments}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isVerified: isVerified ?? this.isVerified,
        profilePicUrl: profilePicUrl ?? this.profilePicUrl,
        email: email ?? this.email,
        Posts: Posts ?? this.Posts,
        UserChats: UserChats ?? this.UserChats,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
        Comments: Comments ?? this.Comments);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        isVerified = json['isVerified'],
        profilePicUrl = json['profilePicUrl'],
        email = json['email'],
        Posts = json['Posts'] is List
            ? (json['Posts'] as List)
                .map((e) => Post.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        UserChats = json['UserChats'] is List
            ? (json['UserChats'] as List)
                .map((e) => UserChat.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
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
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'isVerified': isVerified,
        'profilePicUrl': profilePicUrl,
        'email': email,
        'Posts': Posts?.map((e) => e?.toJson())?.toList(),
        'UserChats': UserChats?.map((e) => e?.toJson())?.toList(),
        'createdOn': createdOn?.format(),
        'updatedOn': updatedOn?.format(),
        'Comments': Comments?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField ISVERIFIED = QueryField(fieldName: "isVerified");
  static final QueryField PROFILEPICURL =
      QueryField(fieldName: "profilePicUrl");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField POSTS = QueryField(
      fieldName: "Posts",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Post).toString()));
  static final QueryField USERCHATS = QueryField(
      fieldName: "UserChats",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserChat).toString()));
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField COMMENTS = QueryField(
      fieldName: "Comments",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Comment).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

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
        key: User.USERNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.FIRSTNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.LASTNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.ISVERIFIED,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PROFILEPICURL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.EMAIL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.POSTS,
        isRequired: false,
        ofModelName: (Post).toString(),
        associatedKey: Post.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.USERCHATS,
        isRequired: false,
        ofModelName: (UserChat).toString(),
        associatedKey: UserChat.USER));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.CREATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.UPDATEDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.COMMENTS,
        isRequired: false,
        ofModelName: (Comment).toString(),
        associatedKey: Comment.USERID));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post_adoption{
  static const String collectionName = 'Post_adoption';
  String? id;
  String? caption ;
  String? username ;
  String?   userId;
  String? imageUrl;
  String? postimage;

  Post_adoption({
    this.id ,
    this.caption,
    this.username,
    this.  userId,
    this.postimage,
    this.imageUrl,

  });

  Post_adoption.fromJson(Map<String, dynamic> json){
    id=json['id'];
    caption=json['caption'];
    username=json['username'];
    userId= json['  userId'];
    imageUrl= json['imageUrl'];
    postimage= json['postimage'];
  }

  Map<String,dynamic> toJson() {
    final Map<String , dynamic> data = new Map<String , dynamic>();

    data['id'] = this.id;
    data['caption'] = this.caption;
    data['username'] = this.username;
    data['  userId'] = this.  userId;
    data['imageUrl'] = this.imageUrl;
    data['postimage'] = this.postimage;

    return data;
  }
}


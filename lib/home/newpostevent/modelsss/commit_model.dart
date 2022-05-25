import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post_commit{
  static const String collectionName = 'Post_commit';

  String? id;
  String? name;
  String? caption ;
  String? userId;
  String? imageUrl;
  String? postimage;

  Post_commit({
    this.id ,
    this.name,
    this.caption,
    this.userId,
    this.imageUrl,
    this. postimage,
  });

  Post_commit.fromJson(Map<String, dynamic> json){
    id=json['id'];
    name=json['name'];
    caption=json['caption'];
    userId= json['userId'];
    imageUrl= json['imageUrl'];
    postimage= json['postimage'];
  }

  Map<String,dynamic> toJson() {
    final Map<String , dynamic> data = new Map<String , dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['userId'] = this.userId;
    data['imageUrl'] = this.imageUrl;
    data['postimage'] = this.postimage;

    return data;
  }
}



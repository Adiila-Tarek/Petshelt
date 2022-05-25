import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post_homeless{
  static const String collectionName = 'Post_homeless';
  String? id;
  String? username;
  String? caption ;
  String? ownerId;
  String? imageUrl;
  String? postimage;

  Post_homeless({
     this.id ,
    this.username,
     this.caption,
     this.ownerId,
     this.imageUrl,
     this.postimage,
  });

  Post_homeless.fromJson(Map<String, dynamic> json){
    id=json['id'];
    username=json['username'];
    caption=json['caption'];
    ownerId= json['ownerId'];
    imageUrl= json['imageUrl'];
    postimage= json['postimage'] ;
}

  Map<String,dynamic> toJson() {
    final Map<String , dynamic> data = new Map<String , dynamic>();

      data['id'] = this.id;
      data['username'] = this.username;
      data['caption'] = this.caption;
      data['ownerId'] = this.ownerId;
      data['imageUrl'] = this.imageUrl;
      data['postimage'] = this.postimage;

      return data;
    }
}


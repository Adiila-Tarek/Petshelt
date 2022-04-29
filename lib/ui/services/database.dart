import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{
  final String pid;
  //collection references
  final CollectionReference Petsheltcollection = FirebaseFirestore.instance.collection("petshelt");

  DatabaseServices({required this.pid});

  Future UpdatePost(String userName, String imageUrl , String caption, String _image, String time)async{
    return await Petsheltcollection.doc(pid).set({
      'userName': userName,
      'imageUrl': imageUrl,
      'caption': caption,
      '_image': _image,
      'time': time,
    });

  }
}
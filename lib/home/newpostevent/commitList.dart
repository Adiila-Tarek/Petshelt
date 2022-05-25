import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/home/newpostevent/commit_widget.dart';

import 'firestoreUtils.dart';
import 'modelsss/commit_model.dart';

class CommitPostList extends StatelessWidget {
  const CommitPostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: StreamBuilder<QuerySnapshot<Post_commit>>(
            stream : getPostcommitCollectionWithConverter()
                .snapshots(),
            builder: (BuildContext buildContext, AsyncSnapshot<QuerySnapshot<Post_commit>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                log("Waiting");
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                log("error");
                print('there is a error');
              }
              else if(snapshot.hasData) {
                List<Post_commit>post= snapshot.data!.docs.map((doc) => doc.data()).toList();

                return ListView.builder(itemBuilder: (buildContext,index){
                  return CommitWidget(post[index]);
                },itemCount: post.length ,
                  shrinkWrap: true,
                );
              }
              return Text('nooo');
            }
        )
        ,
      )
      ,

    );
  }
}
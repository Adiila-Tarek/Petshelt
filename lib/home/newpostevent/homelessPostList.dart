import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/home/newpostevent/homeless_widget.dart';
import 'firestoreUtils.dart';
import 'homelessPostWidget.dart';
import 'modelsss/post_homeless_model.dart';

class HomelessPostList extends StatelessWidget {
  const HomelessPostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: StreamBuilder<QuerySnapshot<Post_homeless>>(
            stream : getPosthomelessCollectionWithConverter()
                .snapshots(),
            builder: (BuildContext buildContext,
                AsyncSnapshot<QuerySnapshot<Post_homeless>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                log("Waiting");
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                log("error");
                print('there is a error');
              }
              else if(snapshot.hasData) {
                List<Post_homeless>items = snapshot.data!.docs.map((doc) => doc.data()).toList();

                return ListView.builder(itemBuilder: (buildContext,index){
                  return HomelessWidget(items[index]);
                },itemCount: items.length ,
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
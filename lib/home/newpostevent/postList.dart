import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'adoption_widget.dart';
import 'adoptionpostWidget.dart';
import 'firestoreUtils.dart';
import 'modelsss/post-adopt-model.dart';

class AdoptionPostList extends StatelessWidget {
  const AdoptionPostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded( child: StreamBuilder<QuerySnapshot<Post_adoption>>(
          stream : getPostadoptionCollectionWithConverter()
          //  .where('time',isEqualTo: TimeOfDay.now())
              .snapshots(),
          builder: (BuildContext buildContext,
              AsyncSnapshot<QuerySnapshot<Post_adoption>> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              // log("Waiting");
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              log("error");
              print('there is a error');
            }
            else if(snapshot.hasData) {
              List<Post_adoption>items = snapshot.data!.docs.map((doc) => doc.data()).toList();

              return ListView.builder(itemBuilder: (buildContext,index){
                return AdoptionWidget(items[index]);
              },itemCount: items.length ,
                shrinkWrap: true,
              );
            }
            return Text('nooo');
          }
      )
      ));
  }}



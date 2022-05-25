//related functions to firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/data/User.dart';

import '../Utils.dart';
import '../home-screeens/saved.dart';
import 'modelsss/commit_model.dart';
import 'modelsss/post-adopt-model.dart';
import 'modelsss/post_homeless_model.dart';



CollectionReference<Post_adoption> getPostadoptionCollectionWithConverter(){

  return FirebaseFirestore.instance.collection(Post_adoption.collectionName).
  withConverter<Post_adoption>(fromFirestore:(snapshot, _) => Post_adoption.fromJson(snapshot.data()!),
    toFirestore:(post_adoption, _) => post_adoption.toJson(), );
}

CollectionReference<Post_homeless> getPosthomelessCollectionWithConverter(){

  return FirebaseFirestore.instance.collection(Post_homeless.collectionName).
  withConverter<Post_homeless>(fromFirestore:(snapshot, _) => Post_homeless.fromJson(snapshot.data()!),
    toFirestore:(post_homeless, _) => post_homeless.toJson(), );
}


CollectionReference<Post_commit> getPostcommitCollectionWithConverter(){
  return FirebaseFirestore.instance.collection(Post_commit.collectionName).
  withConverter<Post_commit>(fromFirestore:(snapshot, _) => Post_commit.fromJson(snapshot.data()!),
    toFirestore:(post_commit, _) => post_commit.toJson(), );
}

/*
CollectionReference<Saved > savedpostCollectionWithConverter(){

  return FirebaseFirestore.instance.collection( Saved.collectionName).
  withConverter<Saved >(fromFirestore:(snapshot, _) =>Saved .fromJson(snapshot.data()!),
    toFirestore:(Saved , _) => Saved .toJson(), );
}
*/




/*
 Future<void> addPostadoptionToFirestore(String caption,String imageUrl)async {
  CollectionReference collectionReference = getPostadoptionCollectionWithConverter();

  DocumentSnapshot docs =
  await usersRef.doc(firebaseAuth.currentUser?.uid).get();

  DocumentReference<Object?> docRef = collectionReference.doc();
  var user = Post_adoption.fromJson(doc.data());
  Post_adoption item = Post_adoption(
      id: docRef.id,
      postId : docRef.id,
      username : user.username,
      caption: caption,
      imageUrl: imageUrl,
      ownerId: '',

  );
  return docRef.set(item);
}
*/


/*
Future<void> addSavedpostsToFirestore(String caption,String imageUrl)async {
  CollectionReference<Saved > collectionReference = savedpostCollectionWithConverter();

  DocumentReference<Saved > docRef = collectionReference.doc();
  Saved unit =Saved (
    id: docRef.id,
    caption: caption,
    imageUrl: imageUrl,
  );
  return docRef.set(unit);
}
*/

/*
Future<void> addPosthomelessToFirestore(String caption,String imageUrl)async {
  CollectionReference<Post_homeless> collectionReference = getPosthomelessCollectionWithConverter();

  DocumentReference<Post_homeless> docRef = collectionReference.doc();
  Post_homeless opject = Post_homeless(
    id: docRef.id,
    caption: caption,
    imageUrl: imageUrl,
    ownerId: ownerId,
    postId: '',
    timestamp: '',

  );
  return docRef.set(opject);
}
*/


/*
Future<void> DeleteAdoptionPost(Post_adoption item){
  CollectionReference<Post_adoption> collectionReference = getPostadoptionCollectionWithConverter();
  DocumentReference<Post_adoption> itemdoc =collectionReference.doc(item.id);
  return itemdoc.delete();
}
*/
Future<void> DeleteHomelessPost(Post_homeless opject){
  CollectionReference<Post_homeless> collectionReference = getPosthomelessCollectionWithConverter();
  DocumentReference<Post_homeless> opjectdoc =collectionReference.doc(opject.id);
  return opjectdoc.delete();
}
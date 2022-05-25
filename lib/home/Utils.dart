import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

// Collection refs

CollectionReference postRef = firestore.collection('posts');
CollectionReference usersRef = firestore.collection('users');
CollectionReference favUsersRef = firestore.collection('saved');



// Storage refs
Reference profilePic =storage.ref().child('profilePic');
Reference posts =storage.ref().child('posts');


import 'package:flutter/material.dart';
import 'package:graduation_projectt/ui/home/adoption.dart';
import 'package:graduation_projectt/ui/home/HomeScreen.dart';
import 'package:graduation_projectt/ui/home/all-in-one.dart';
import 'package:graduation_projectt/ui/home/commitment.dart';
import 'package:graduation_projectt/ui/home/homeless.dart';
import 'package:graduation_projectt/ui/home/knowing.dart';
import 'package:graduation_projectt/ui/home/menu_body.dart';
import 'package:graduation_projectt/ui/home/newpostevent/newpost.dart';
import 'package:graduation_projectt/ui/home/saved.dart';
import 'package:graduation_projectt/ui/home/shop.dart';
import 'package:graduation_projectt/ui/home/edit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp() ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.routeName:(buildContext)=>HomeScreen(),
        Adoption.routeName:(buildContext)=>Adoption(),
        Homeless.routeName:(buildContext)=>Homeless(),
        Knowing.routeName:(buildContext)=>Knowing(),
        Commitment.routeName:(buildContext)=>Commitment(),
        Shopping.routeName:(buildContext)=>Shopping(),
        All.routeName:(buildContext)=>All(),
        Saved.routeName:(buildContext)=>Saved(),
        menu.routeName:(buildContext)=>menu(),
        New_post.routeName:(buildContext)=>New_post(),
      },
    //initialRoute:HomeScreen.routeName,
      home: FutureBuilder(
        future: _fbApp ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            print('you have error ! ${snapshot.error.toString()}');
            return Text('something went wrong');
          }else if (snapshot.hasData){
            return HomeScreen();
          }else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      ),
    );
  }
}

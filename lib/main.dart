// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/homeScreen.dart';
import 'package:petshelt/info_shelters_screens/info_ui.dart';
import 'package:petshelt/login_screen/loginScreen.dart';
import 'package:petshelt/provider/authenticationProvider.dart';
import 'package:petshelt/provider/locationProvider.dart';
import 'package:petshelt/signup_screen/signupScreen.dart';
import 'package:petshelt/splash_screen.dart';
import 'package:provider/provider.dart';

import 'DidYouKnow/DidYouKnow.dart';
import 'DidYouKnow/bird.dart';
import 'DidYouKnow/cat.dart';
import 'DidYouKnow/dog.dart';
import 'DidYouKnow/fish.dart';
import 'DidYouKnow/hamster.dart';
import 'DidYouKnow/turtle.dart';
import 'breeds_screen/DetectBreed.dart';
import 'chat/chatScreen.dart';
import 'home/home-screeens/HomeScreen.dart';
import 'home/home-screeens/adoption.dart';
import 'home/home-screeens/all-in-one.dart';
import 'home/home-screeens/commitment.dart';
import 'home/home-screeens/homeless.dart';
import 'home/home-screeens/knowing.dart';
import 'home/home-screeens/saved.dart';
import 'home/home-screeens/shop.dart';
import 'home/menu_body.dart';
import 'home/newpostevent/newpost.dart';
import 'home/profile.dart';
import 'info_shelters_screens/shelters_ui.dart';
import 'map/mapScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (buildContext) => AuthProvider()),
      ChangeNotifierProvider(create: (buildContext) => locationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet\$helt',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(color: Color(0xFF76BDB2), centerTitle: true)),
      // home: loginScreen(),
      routes: {
        ChatScreen.routeName: (buildContext) => ChatScreen(),
        splashScreen.routeName: (buildContext) => splashScreen(),
        loginScreen.routeName: (buildContext) => loginScreen(),
        SignUpScreen.routeName: (buildContext) => SignUpScreen(),
        infoScreen.routeName: (buildContext) => infoScreen(),
        sheltersScreen.routeName: (buildContext) => sheltersScreen(),
        mapScreen.routeName: (buildContext) => mapScreen(),
        homeScreen.routeName: (buildContext) => homeScreen(),
        DetectBreed.routeName: (buildContext) => DetectBreed(),
        Bird.routeName: (buildContext) => Bird(),
        Fish.routeName: (buildContext) => Fish(),
        Hamster.routeName: (buileContext) => Hamster(),
        Turtle.routeName: (buildContext) => Turtle(),
        Dog.routeName: (buildContext) => Dog(),
        Cat.routeName: (buildContext) => Cat(),
        DidYouKnow.routeName: (buildContext) => DidYouKnow(),
        HomeeScreen.routeName:(buildContext)=>HomeeScreen(),
        Adoption.routeName:(buildContext)=>Adoption(),
        Homeless.routeName:(buildContext)=>Homeless(),
        Knowing.routeName:(buildContext)=>Knowing(),
        Commitment.routeName:(buildContext)=>Commitment(),
        Shopping.routeName:(buildContext)=>Shopping(),
        All.routeName:(buildContext)=>All(),
        Saved.routeName:(buildContext)=>Saved(),
        menu.routeName:(buildContext)=>menu(),
        profile.routeName:(buildContext)=> profile(),
        AdoptNewpost.routeName:(buildContext)=>AdoptNewpost(),
      },
      initialRoute: splashScreen.routeName,
    );
  }
}

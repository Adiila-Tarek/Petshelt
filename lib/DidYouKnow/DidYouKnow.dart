// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petshelt/DidYouKnow/PetType.dart';
import 'package:petshelt/DidYouKnow/bird.dart';
import 'package:petshelt/DidYouKnow/cat.dart';
import 'package:petshelt/DidYouKnow/dog.dart';
import 'package:petshelt/DidYouKnow/fish.dart';
import 'package:petshelt/DidYouKnow/hamster.dart';
import 'package:petshelt/DidYouKnow/turtle.dart';
import 'package:petshelt/home/home-screeens/HomeScreen.dart';

class DidYouKnow extends StatelessWidget {
  static const String routeName = 'DidYouKnow';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(118, 189, 178, 1),
              title: const Text(
                'Did You Know ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context,HomeeScreen.routeName);
                },
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Cat()));
                      },
                      child: PetType('CAT', 'images/catInfo.png')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Dog()));
                      },
                      child: PetType('DOG', 'images/dogInfo.png')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Turtle()));
                      },
                      child: PetType('TURTLE', 'images/turtInfo.png')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Hamster()));
                       },
                      child: PetType('HAMSTER', 'images/hamster.jpg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Fish()));
                      },
                      child: PetType('FISH', 'images/fishInfo.png')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Bird()));
                      },
                      child: PetType('BIRD', 'images/birdInfo.png'))
                ],
              ),
            )));
  }
}

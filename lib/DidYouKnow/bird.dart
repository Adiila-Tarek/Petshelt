import 'dart:ui';

import 'package:flutter/material.dart';

import 'DidYouKnow.dart';

class Bird extends StatefulWidget {
  static const String routeName = 'Bird';

  @override
  State<Bird> createState() => sew();
}

class sew extends State<Bird> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(118, 189, 178, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(118, 189, 178, 1),
          title: const Text(
            'Bird',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, DidYouKnow.routeName);
            },
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(228, 242, 240, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'SELECT THE RIGHT CAGE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Your bird’s cage shouldn’t feel like a prison. Selecting the largest cage that you can afford and fit in your home ensures maximum comfort and freedom for your bird.Carefully choose a good quality cage that won’t bend or break easily and isn’t too difficult to clean. It’s best to find one that is made of non-toxic materials.\n'),
                            TextSpan(
                                text: 'BUY ESSENTIAL ACCESSORIES.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'After you’ve selected the right cage, you will need to add a few items to it. Those items include: Food bowls, Water bowls or bottles, Perch, Bedding, Nest.\n'),
                            TextSpan(
                                text: 'KEEP THE CAGE CLEAN',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'A large part of basic bird care involves cleaning the cage. Tackle the floor and bowls each day. You will need to do a more thorough cleaning about once per week.\n'),
                            TextSpan(
                                text: 'FEEDING YOUR BIRD.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'When feeding your bird, you could either buy food created for pet birds or you could make homemade meals for your feathery friend.Whichever option you choose, speak with your avian veterinarian to make sure the diet you provide meets your bird’s nutritional needs.\n'),
                            TextSpan(
                                text: 'PROVIDING ENTERTAINMENT.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'A bored bird will quickly become depressed. You can prevent depression and other health issues by letting your bird play with toys.There are many bird toys on the market. But keep in mind that some of them are made of toxic materials. You should avoid those options.\n'),
                            TextSpan(
                                text: 'TRIMMING YOUR BIRD.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Trim your bird’s nails whenever they feel too sharp. You should consider having your veterinarian do this for you, especially if you can’t see the quick in your bird’s nails.\n'),
                            TextSpan(
                                text: 'GIVE YOUR BIRD PRIVACY.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'We all need some time to ourselves. Your bird is no different. That’s why you should give your bird access to privacy.The Woven Bird Nest Cage is the perfect hideaway for your small pet. It’s cozy, private, and made of bird-safe, non-toxic materials.\n'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

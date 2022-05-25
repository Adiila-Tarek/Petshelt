import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petshelt/DidYouKnow/DidYouKnow.dart';

class Turtle extends StatefulWidget {
  static const String routeName = 'Turtle';

  @override
  State<Turtle> createState() => slow();
}

class slow extends State<Turtle> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(118, 189, 178, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(118, 189, 178, 1),
          title: const Text(
            'Turtle',
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
                                text: 'SET UP A TANK.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'A turtle’s indoor habitat should be at least 40 gallons to allow for growth to adult size. It should also include a heat lamp for basking. The tank must include land area or dry area and swimming area or wet area. Make sure you read about the turtle you plan to buy so you can provide the right living environment.\n'),
                            TextSpan(
                                text: 'SET UP TEMPERATURE CONTROL.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Turtles are cold-blooded critters who need a fairly constant temperature in order to do well. Turtles prefer to live in a temperature between 60 and 90 degrees Fahrenheit. Some turtles do all right if the temperature drops down to 50 degrees at night, but anything lower than that can cause a turtle to go into hibernation or get sick. It is best to heat water for aquatic turtles, and include a basking light to heat the air in the tank.\n'),
                            TextSpan(
                                text:
                                    'FIND OUT HOW MUCH YOUR TURTLE SHOULD HIBERNATE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Since turtles have varying lengths of hibernation time, you should know how long to expect your turtle to be inactive and how to provide the best environment for it in the meantime. More experienced turtle owners allow their turtles to hibernate in the refrigerator or bury them in their yards.\n'),
                            TextSpan(
                                text: 'PROVIDE FOOD.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Turtle foods are varied for a healthy diet, often including fresh and flaked food, live bugs, and vitamin A to help them thrive. Food for turtles can be found at fish food stores and pet stores, or at Pisces Pros. Fresh foods like lettuce, bugs, worms, fish, and other plants and veggies can be good to offer your turtle, too.\n'),
                            TextSpan(
                                text: 'CLEAN TANK AND CHANGE WATER FREQUENTLY.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Turtles need fresh food and water every day (when they aren’t hibernating). The cage, aquarium, or enclosure should be cleaned regularly, even if you have filtration systems or other regular maintenance devices. Filtration in a water aquarium is a must, and if the tank starts smelling it is because the water is dirty and needs to be changed.\n'),
                            TextSpan(
                                text: 'DO NOT PLAY WITH YOUR TURTLE OFTEN.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Turtles get stressed easily when handled. They aren’t very good playmates and are better treated as something to look at rather than touch. Never drop or throw your turtle as they can get hurt easily, even with their hard shells.\n'),
                            TextSpan(
                                text: 'WASH YOUR HANDS.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'If you do touch your turtle or anything in its cage, you need to wash your hands thoroughly, otherwise you risk getting salmonella.\n'),
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

import 'dart:ui';

import 'package:flutter/material.dart';

import 'DidYouKnow.dart';

class Hamster extends StatefulWidget {
  static const String routeName = 'Hamster';

  @override
  State<Hamster> createState() => small();
}

class small extends State<Hamster> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(118, 189, 178, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(118, 189, 178, 1),
          title: const Text(
            'Hamster',
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
                                text: 'CHOOSE A HABITAT.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Your little dude needs a safe home in which to explore and feel comfortable. Explore colors, tubes, accessories, and add-ons to create a unique habitat with plenty of places to tunnel, hide and burrow. Use different Crittertrail® tubes to connect two or more habitats and create endless configurations.  Pick bedding they can burrow in, and make sure to choose the right-sized water bottle like a 6-ounce chew proof water bottle.\n'),
                            TextSpan(
                                text: 'PUT THEIR HABITAT IN THE RIGHT PLACE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'As is the case with many small animals, placement is essential to a happy pet. Put your hamster’s home near the sounds of your family, but not right in the thick of things. They’ll be comforted by your day-to-day sounds, but will be stressed out by loud noises and lots of hubbub right outside their space. Do also be sure to keep your pets habitat away from any vents or drafty windows to ensure they are in a safe temperature controlled environment.\n'),
                            TextSpan(
                                text:
                                    'COVER THEIR HABITAT WITH A LIGHT CLOTH FOR THE FIRST FEW DAYS. ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'When you bring your new hamster home, everything is new to them. Give them the headspace to get to know their new habitat for a few days – without the distractions of your home – by placing a light cloth over their space. Feel free to take this cover off for bonding time!\n'),
                            TextSpan(
                                text:
                                    'WAIT A FEW DAYS BEFORE TRYING TO PICK THEM UP',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Like any new friendship, it takes time to get to know someone and feel comfortable with them. That said, wait a while to handle your hamster or pick them up. After a few days of giving them food and water, they’ll start to trust you!\n'),
                            TextSpan(
                                text:
                                    'ONCE THEY’RE ACCLIMATED, THINK OUTSIDE THE BOX FOR FEEDING TIME.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'You don’t eat the same things every day, do you? Your hammie will appreciate a varied diet as much as humans do. In addition to their normal, everyday food, try giving them small amounts of carrots, squash, broccoli, cucumbers, apples, pears, or berries. Ask your vet about the best foods to feed your new friend. Remember, treats should always be given in moderation.\n'),
                            TextSpan(
                                text:
                                    'CLEAN AND WASH YOUR HAMSTER’S SPACE REGULARLY.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'There’s a happy medium between keeping your hamster’s home clean and comfy and creating undue stress by cleaning it too much. In general:Clean the toilet area daily, Spot change bedding as needed (when soiled/wet), Wipe out their food dish weekly, Change water daily , Empty their entire habitat weekly or twice a week, Place all new bedding weekly. Every week or every other week, take soap and water and wipe down the entire habitat once it’s empty of bedding, toys, and other pieces. That extra step will keep your hamster’s space smelling good.\n'),
                            TextSpan(
                                text:
                                    'GIVE THEM PLENTY OF OUT-OF-HABITAT TIME.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'A great way to give your hamster exercise and get some needed bonding time is to provide ample playtime outside their habitat each week. We suggest setting up a small gated area with lots of toys and some treats so they can explore and say hi to their human family! Remember to always supervise your hamster when he or she is out of their habitat.\n'),
                            TextSpan(
                                text: 'TAKE TIME TO BOND WITH YOUR HAMSTER',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Patience, regular feeding, lots of out-of-habitat playtime, and soft talk will go a long way in helping you bond with your hamster. Make sure to always approach your pet slowly and talk to them in a conversational manner. They’ll learn to recognize your scent and voice and see you as a source of comfort.\n'),
                            TextSpan(
                                text: 'HANDLE YOUR PET WITH CARE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Unlike other small animals, hamsters and gerbils need to be picked up with both hands and cradled in cupped hands. The same goes for putting them down, but use extra caution so they don’t accidentally escape from or slip through your hands. Because these pets are naturally nocturnal, be sensitive to the time of day you are trying to handle your hamster. You wouldn’t want someone snatching you up out of your sweet dreams!\n'),
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

import 'dart:ui';

import 'package:flutter/material.dart';

import 'DidYouKnow.dart';

class Cat extends StatefulWidget {
  static const String routeName = 'Cat';

  @override
  State<Cat> createState() => Meaw();
}

class Meaw extends State<Cat> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(118, 189, 178, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(118, 189, 178, 1),
          title: Text(
            'Cat',
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
              decoration: BoxDecoration(
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
                                text: 'GROOM YOUR CAT REGULARLY.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Whether your cat has short or long fur, he will benefit greatly from regular brushing or combing. This helps remove the dead hair from his coat so he does not ingest it while self-grooming. It also gives you the chance to notice any changes to his body. Irregularities such as lumps, bumps or sore spots can then be investigated right away by your veterinarian.\n'),
                            TextSpan(
                                text: 'PROVIDE FRESH WATER DAILY.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Clean, fresh water is essential for your cats good health. If your cat doesnot seem to drink from a bowl, consider providing her with a tall glass (some cats donot like to bend down to drink) or a cat fountain. Be sure to replenish the water with a fresh supply every day.\n'),
                            TextSpan(
                                text: 'MAKE SURE YOU HAVE ENOUGH LITTER BOXES.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'A general rule of thumb for litter boxes is one for each cat plus one more. So if you have 2 cats, you should have 3 litter boxes. To encourage good litter box habits, keep the litter boxes clean. This may mean scooping more than once per day. Regular cleaning will also help you notice any changes in your cats urine or stool, which could indicate a health issue.\n'),
                            TextSpan(
                                text:
                                    'NOTICE IF YOUR CAT STARTS URINATING OUTSIDE ITS LITTER BOX.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Sometimes a cat will urinate outside his litter box if the box is dirty. But before you blame the accident on the state of the litter box or your cats naughty behavior, schedule a visit to the veterinarian. A change in litter box habits sometimes means that a cat has a urinary tract infection or other medical issue.\n'),
                            TextSpan(
                                text:
                                    'TRAIN YOUR CAT TO USE A SCRATCHING POST.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Not only will this help prevent damage to your furniture, it will help your cat stretch her muscles and keep her claws in top condition. Regular scratching on an appropriate surface such as carpet, sisal, or cardboard helps remove the old layers from your cat’s claws.\n'),
                            TextSpan(
                                text: 'USE A CAT CARRIER IN THE CAR.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Does your cat need to visit the vet? Or are you moving to a new home? Transport your cat in an appropriate carrier designed for pets. Allowing your cat to roam freely in the car can distract you from driving safely, which can lead to accidents that may harm both you and your cat.\n'),
                            TextSpan(
                                text: 'KEEP YOUR CATS TEETH CLEAN.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Like humans, cats can develop tartar on their teeth, which can lead to gum disease and tooth decay. The bacteria that collect on your cat’s teeth also can enter her bloodstream, contributing to other feline diseases. Unlike humans, however, cats can’t brush their teeth. And many cats will not let their owners brush their teeth for them. To keep your cats teeth in top condition, schedule a cleaning with your veterinarian at least once every year.\n'),
                            TextSpan(
                                text: 'CHOOSE A CAT-FRIENDLY VET.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'It seems to go without saying that cats are not smaller versions of dogs. That said, it follows that cats have different veterinary requirements than dogs do. A veterinarian specializing in feline health and anatomy can be a valuable ally in keeping your cat in her best possible health. You can find a feline vet in your area by visiting the American Association of Feline Practitioners.\n'),
                            TextSpan(
                                text: ' SCHEDULE REGULAR VETERINARY VISITS.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Annual visits give the vet a chance to catch any potential feline diseases in their early stages, administer vaccines, and clean the cats teeth. Your vet can also tell you if your cat is at a healthy weight.\n'),
                            TextSpan(
                                text: 'SPAY OR NEUTER YOUR CAT.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Reproductive diseases can affect cats of both genders, both male and female. Spaying prevents uterine infections, ovarian cancers and breast tumors in female cats, while neutering prevents testicular cancer and some prostate problems in males. The surgeries also reduce a male cats urge to roam and if done soon enough in his life, may eliminate his urge to spray to mark territory. The best benefit? Your cat will not contribute to the pet overpopulation situation.\n'),
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

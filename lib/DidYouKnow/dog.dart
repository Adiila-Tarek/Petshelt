import 'dart:ui';

import 'package:flutter/material.dart';

import 'DidYouKnow.dart';

class Dog extends StatefulWidget {
  static const String routeName = 'Dog';

  @override
  State<Dog> createState() => Haw();
}

class Haw extends State<Dog> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(118, 189, 178, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(118, 189, 178, 1),
          title: Text(
            'Dog',
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
                                text:
                                    'PROVIDE A PROTECTED AND CLEAN LIVING ENVIRONMENT FOR YOUR DOG.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Shelter from the elements and hazards, as well as good hygiene, are basic to a quality life.\n'),
                            TextSpan(
                                text: 'ALWAYS KEEP FRESH WATER AVAILABLE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Maintaining optimal hydration is important for health and energy.\n'),
                            TextSpan(
                                text:
                                    'FEED A QUALITY DIET AND PREVENT OBESITY. ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Overweight humans and animals can adversely affect health in many ways. Follow the dietary recommendations that your veterinarian will make according to the nutritional needs of your dog, based on size, age, level of activity and breed. Remember to provide healthy treats rather than table scraps, as rewards.\n'),
                            TextSpan(
                                text:
                                    'HAVE YOUR PET EXAMINED BY A VETERINARIAN ON A REGULAR BASIS.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Your veterinarian will provide you with the information on vaccination schedules, deworming and external parasite control. Keep a copy of your pet’s vaccination records in your home or with you when you travel. Contact your veterinarian if you believe that your pet may be ill, injured, or if something just doesn’t seem right. Your veterinarian is the expert on keeping your dog healthy.  Work as a team with him or her.\n'),
                            TextSpan(
                                text:
                                    'PROVIDE AMPLE OPPORTUNITIES TO EXERCISE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Make sure your dog gets the regular exercise needed to enable it to be fit.  By being in shape, your dog will be more capable of participating in the activities that it enjoys.\n'),
                            TextSpan(
                                text:
                                    'COMMUNICATE WITH YOUR DOG AND DEVELOP A RELATIONSHIP.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Dogs are social creatures and they need to interact with their owner. Quality time will help you get to know your dog and understand  particular needs that it might have, as well enhance your ability to recognize early signs of an illness that could be developing. In addition, time spent in developing a relationship will help prevent many undesirable behavioral patterns.\n'),
                            TextSpan(
                                text:
                                    'TRAIN YOUR DOG TO FOLLOW THE SIMPLE COMMANDS.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Puppy and dog training classes can be very helpful. The better your dog is at following basic and necessary commands, the greater the chances are that your dog will live a safe and long life.\n'),
                            TextSpan(
                                text: 'PRACTICE REPRODUCTIVE CONTROL.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'If you do not intend to create puppies, spaying or neutering is a certain option. If you plan to breed your dog or are opposed to spaying and neutering for other reasons, take appropriate measures to prevent mismatings. Consult with your veterinarian in regard to other options that are available.\n'),
                            TextSpan(
                                text: 'DENTAL CARE IS VERY IMPORTANT.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Many breeds are prone to gum disease, which can have serious implications. Infection resulting from this condition leads to premature tooth loss, and can commonly cause infections in major organs, including the heart valves.\n'),
                            TextSpan(
                                text:
                                    'DON’T OVERLOOK GROOMING AND NAIL TRIMMING.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Long coated dogs are prone to developing matts and ice balls in their hair. Overgrown nails are common in elderly dogs and can make it more difficult for them to walk. In addition, such nails are much more prone to breaking, which can be quite painful. \n'),
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

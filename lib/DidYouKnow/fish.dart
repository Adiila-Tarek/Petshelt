import 'dart:ui';

import 'package:flutter/material.dart';

import 'DidYouKnow.dart';

class Fish extends StatefulWidget {
  static const String routeName = 'Fish';

  @override
  State<Fish> createState() => water();
}

class water extends State<Fish> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(118, 189, 178, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(118, 189, 178, 1),
          title: Text(
            'Fish',
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
                                text: 'BUY A TANK.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Goldfish can be housed in bowls. Keep in mind that they will outgrow it. If you intend buying more than one, buying a tank is the better option. It should be a good size – make sure that there is enough surface area for oxygen to be absorbed. The fish should have space to swim around in. Keep in mind that you will need to add some accessories.\n'),
                            TextSpan(
                                text: 'ACCESSORISE THE TANK.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'There are essentials that need to be included when buying a tank. One of these is a hood, which prevents the fish from jumping out and dust falling in. An airstone or pump keeps the water oxygenated by putting bubbles in it. A filter keeps the water purified by removing harmful chemicals and waste. Gravel lines the bottom of the tank and is a breeding place for good bacteria. Real plants assist in the breakdown of toxins and reduce algae growth. Add some decorations. Goldfish are lively and energetic. Choose a decoration that the fish can swim through and use to hide. Don’t buy sharp objects that could harm your goldfish.\n'),
                            TextSpan(
                                text: 'CREATE A HOME.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Before buying your goldfish, spend time on setting up its home. The tank should be placed where it can get enough indirect sunlight during the day. It should be a level, strong surface. Prepare the water – this should be done days before you buy your fish. Tap water can be used – let it stand for a few days as this will give the chlorine enough time to dissolve. Prepare the tank – clean the tank and all accessories with a mild detergent. Add all the accessories and then the water. The water should be left for a few days in order to reach a constant temperature.\n'),
                            TextSpan(
                                text: 'MAINTAIN THE WATER.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Your fish needs water to survive. Water maintenance is crucial in keeping your fish healthy. A filter makes it much easier to maintain. Do a partial water change weekly by removing and replacing water. About one-third of the water must be replaced. Remember to let replacement water stand for at least a day to dissolve chlorine.\n'),
                            TextSpan(
                                text: 'KEEP THE TANK CLEAN.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Goldfish are fairly messy. Clean the tank regularly. Remove all accessories, clean off all slime, waste and algae.\n'),
                            TextSpan(
                                text: 'FEEDING.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Unlike us they only need to be fed once daily. Food can be bought at a pet shop. Consult your vet if you don’t know what to buy. Give the fish some variety by feeding it both the flakes and granules. They will eat until they kill themselves – feed them only amounts that they can finish.\n'),
                            TextSpan(
                                text: 'KEEP YOUR FISH SAFE.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Don’t spray insect repellants in the room where your fish tank is. Doing this can poison your fish. Don’t use metals in your tank – metal dissolves and could poison your fish. Objects from beaches and ponds carry bacteria causing diseases – be weary of them. Tapping on the glass and sudden loud noises could stress out your fish.\n'),
                            TextSpan(
                                text: 'SIGNS THAT YOUR FISH IS ILL.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Pay close attention to your fish. Become familiar with its normal behaviour this will make it easy to notice when something is wrong. A shaky body, constant scratching against objects in the tank, gasping at the surface and swimming abnormally are signs that your fish may be ill.\n'),
                            TextSpan(
                                text: 'COMMON AILMENTS.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'The most common afflictions are: constipation, fungus, fin rot, anchor worm, popeye and lice. These can be treated with medicine bought from a pet shop. Contact your vet if you are unsure.\n'),
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

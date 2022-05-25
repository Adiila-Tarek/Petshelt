import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/info_shelters_screens/shelters_ui.dart';
import 'package:petshelt/map/mapScreen.dart';

import 'DidYouKnow/DidYouKnow.dart';
import 'breeds_screen/DetectBreed.dart';
import 'chat/chatScreen.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);
  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/pattern.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    iconSize: 57,
                    icon: const Icon(Icons.home),
                    color: const Color(0xFF6EC9B1),
                    onPressed: () {
                      Navigator.pushNamed(context, sheltersScreen.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 57,
                    icon: Image.asset('images/location_paw.png'),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, mapScreen.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 57,
                    icon: Image.asset('images/breeds.png'),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, DetectBreed.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 57,
                    icon: const Icon(Icons.chat),
                    color: const Color(0xFF6EC9B1),
                    onPressed: () {
                      Navigator.pushNamed(context, ChatScreen.routeName);
                    },
                  ),
                ),
/*
                Expanded(
                  child: IconButton(
                    iconSize: 57,
                    icon: Image.asset('images/info.png'),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, DidYouKnow.routeName);
                    },
                  ),
                ),
*/
              ],
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:petshelt/home/home-screeens/HomeScreen.dart';
import 'package:petshelt/homeScreen.dart';

class infoScreen extends StatelessWidget {
  static const String routeName = "infoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/pattern.png'))),
        child: Center(
            child: SingleChildScrollView(
          //will be removed
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text('Welcome To Pet\$helt',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: 'inter')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: infodata(),
              ),
              test_button(), //will be removed
            ],
          ),
        )),
      ),
    );
  }
}

class infodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/adopt.png',
                    width: 64,
                    height: 75,
                  ),
                  const Expanded(
                    child: Text(
                      ' For the user who want to adopt a pet ',
                      style: TextStyle(
                          fontFamily: 'inter', fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/info.png',
                    width: 64,
                    height: 80,
                  ),
                  const Expanded(
                    child: Text(
                      ' All you want to know about anything\n related to the pets  ',
                      style: TextStyle(
                          fontFamily: 'inter', fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/shop.png',
                    width: 65,
                    height: 74,
                  ),
                  const Expanded(
                    child: Text(
                      ' You will find anything you want to \n buy here  ',
                      style: TextStyle(
                          fontFamily: 'inter', fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/homless.png',
                    width: 64,
                    height: 72,
                  ),
                  Expanded(
                    child: const Text(
                      ' For the one who want to put or take \n a homeless pet ',
                      style: TextStyle(
                          fontFamily: 'inter', fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/social.png',
                    width: 68,
                    height: 77,
                  ),
                  const Expanded(
                    child: Text(
                      ' For a user who wants to leave his pet for a little time for a specific '
                          'purpose, whether to mate or travel for a period ',
                      style: TextStyle(
                          fontFamily: 'inter', fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/allinone.png',
                    width: 66,
                    height: 74,
                  ),
                  const Expanded(
                    child: Text(
                      ' You will find all this option here ',
                      style: TextStyle(
                          fontFamily: 'inter', fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class test_button extends StatelessWidget {
  //will be removed
  const test_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 25,
      icon: Icon(Icons.login),
      color: Colors.black,
      onPressed: () {
        Navigator.pushNamed(context, HomeeScreen.routeName);
      },
    );
  }
}

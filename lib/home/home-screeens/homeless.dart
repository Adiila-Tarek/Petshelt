import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/home/home-screeens/adoption.dart';
import 'package:petshelt/home/home-screeens/commitment.dart';
import 'package:petshelt/home/home-screeens/knowing.dart';
import 'package:petshelt/home/home-screeens/shop.dart';

import '../home_navigator_cubit.dart';
import '../newpostevent/homelessNewpost.dart';
import '../newpostevent/homelessPostList.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Homeless extends StatefulWidget {
  const Homeless({Key? key}) : super(key: key);
  static const String routeName = 'homeless';

  @override
  State<Homeless> createState() => _HomelessState();
}

class _HomelessState extends State<Homeless> {
  get current_user => null;

  void initState() {
    // TODO: implement initState
    getusers();
    super.initState();
  }

  getusers() {
    usersRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 189, 178),
        leading: IconButton(
          icon: Icon(Icons.menu),
          hoverColor: Colors.black,
          onPressed: () {
            print('hello');
          },
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            'homeless',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontFamily: 'Inter',
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
          //Pet\$helt
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 197, 225, 208),
          actions: [
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Adoption()));
                    },
                    icon: Image.asset(
                      'assets/images/adopt.png',
                    ))),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homeless()));
                    },
                    icon: Image.asset(
                      'assets/images/catt.png',
                    ))),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Commitment()));
                    },
                    icon: Image.asset(
                      'assets/images/commit.png',
                    ))),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Knowing()));
                    },
                    icon: Image.asset(
                      'assets/images/know.png',
                    ))),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Shopping()));
                    },
                    icon: Image.asset(
                      'assets/images/shop.png',
                    ))),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            HomelessPostList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 197, 225, 208),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeNewpost()));
        },
      ),
    );
  }
}

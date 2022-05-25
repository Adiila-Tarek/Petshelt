
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class profile extends StatelessWidget{
  static const String routeName = 'profile';


  FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: IconButton(
                icon: Icon(Icons.pets_rounded),
                onPressed: (){
                },
                iconSize: 30,
                color: Colors.white70,
              ),
            ) ,
          ],
          backgroundColor: Color(0xff76BDB2),
          title: Center(child: Text('Profile')),
        ),
        body:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius:80 ,
                        backgroundColor: Color(0xffe6eeed),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/test.png'),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(icon: Icon(Icons.edit, color: Colors.black), onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Edit() ));

                            },),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                               // width: 2,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  50,
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 5),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('UserName',style: new TextStyle(fontSize: 22,
                fontWeight: FontWeight.w400,fontFamily: 'Inter',),),
            ),
            Spacer(),
            Container(
              width: 200,
              decoration: BoxDecoration(
                border:Border.all(style: BorderStyle.none)
              ),
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>
                    (Color.fromARGB(255, 118, 189, 178)),
                  ),
                  onPressed: () {
                    signOut();
                    Navigator.of(context).pop();
                  }
                  , child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.login_outlined,
                        size: 30.0,
                      ),
                    ),
                    Text('Log Out',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,fontFamily: 'Inter',),)
                  ],
                ),
              )),
            ),
            Spacer(),
          ],
        ),);
  }


  }
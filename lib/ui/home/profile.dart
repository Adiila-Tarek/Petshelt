import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_projectt/ui/home/HomeScreen.dart';
import 'package:graduation_projectt/ui/home/edit.dart';

class profile extends StatelessWidget{
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
                        radius: 93,
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
              child: Text('UserName',style: new TextStyle(fontSize: 18,
                fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,fontFamily: 'Inter',),),
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
                  onPressed: (){}, child: Expanded(
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
        ),
/*
        Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: 165,
                     height: 130,
                     decoration: BoxDecoration(border: Border.all(width:4 , color: Color(0xffC5E1D0)),
                      boxShadow :[
                        BoxShadow(
                          spreadRadius: 2,
                         blurRadius: 10,
                          color: Colors.white.withOpacity(0.1),
                        )
                      ],
                       shape: BoxShape.circle,
                       image: DecorationImage(
                         fit: BoxFit.cover,
                           image: AssetImage('assets/images/test.png'),
                       )
                  ),
              ),
            ),
            )],
    )
*/ /*child:  RaisedButton(
        child: Text("Save",
        style: TextStyle(color: Colors.white
        ),
      ),
        color: new Color(0xff76BDB2),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => home()),
              );
            }
    ),*/


    );
  }

}

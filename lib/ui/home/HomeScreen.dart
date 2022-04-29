import 'package:flutter/material.dart';
import 'package:graduation_projectt/ui/home/adoption.dart';
import 'package:graduation_projectt/ui/home/commitment.dart';
import 'package:graduation_projectt/ui/home/homeless.dart';
import 'package:graduation_projectt/ui/home/knowing.dart';
import 'package:graduation_projectt/ui/home/menu_body.dart';
import 'package:graduation_projectt/ui/home/shop.dart';
import 'all-in-one.dart';
import 'menu_body.dart';


class HomeScreen extends StatefulWidget {
static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 String dropdownvalue  =  'shelters';

var items = [
  'shelters',
  'Veterinary'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
      actions: [
        Container(
          width: 75,
          height: 75,
          child: IconButton(onPressed: (){},
            icon:  SizedBox(
                child: Image.asset(
                  'assets/images/shopdogicon1.png',fit: BoxFit.fill,)
            ),),
        ),
          ],

/*
          leading: Row(
            children: [
*/
/*
          Expanded(
            child: IconButton(
                icon:Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => menu()));
                },
                color: Colors.black,
             ),
          ),
*//*


        ],
      ),
*/
        elevation: 10,
      ),
        drawer:Drawer(
          child: menu(),
        ),

      body: Container(
        color: Color.fromARGB(255, 229, 229, 229),
        child: Column(
          children: [
           Container(
             alignment: Alignment.center,
               padding: EdgeInsets.only(top:15),
               child: Image.asset('assets/images/petshelt.png'),
           ),
            Container(
              padding: EdgeInsets.all(5),
              child: Center(child: Text('We love what we do and so will you',style: new TextStyle(fontSize: 14,
                fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter',
              ),)),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                margin: EdgeInsets.only(top:20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 118, 189, 178),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child:Image.asset('assets/images/adopt.png',fit: BoxFit.cover),
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(top: 40),
                                  width: 99.25,
                                  height: 97.53,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 197, 225, 208),
                                    borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Text('Adoption',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter'),)),
                              ],
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, Adoption.routeName);
                            },
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child:Image.asset('assets/images/catt.png',fit: BoxFit.cover,),
                                 padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(top: 40),
                                  width: 99.25,
                                  height: 97.53,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 197, 225, 208),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Text('Homeless',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter'),)),
                              ],

                            ),
                            onTap: (){
                              Navigator.pushNamed(context,Homeless.routeName);
                            },
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child:Image.asset('assets/images/know.png',fit: BoxFit.cover),
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(top: 10),
                                  width: 99.25,
                                  height: 97.53,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 197, 225, 208),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Text('Did you know?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter'),)),
                              ],
                            ),
                            onTap: (){
                              Navigator.pushNamed(context,Knowing.routeName);
                            },
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child:Image.asset('assets/images/commit.png',fit: BoxFit.cover),
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(top: 10),
                                  width: 99.25,
                                  height: 97.53,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 197, 225, 208),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Text('Commitment',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter'),)),
                              ],

                            ),
                            onTap: (){
                              Navigator.pushNamed(context,Commitment.routeName);
                            },
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child:Image.asset('assets/images/iconlocation.png',fit: BoxFit.fill),
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(top: 10),
                                  width: 99.25,
                                  height: 97.53,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 197, 225, 208),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Text('Location',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter'),)),
                              ],
                            ),
                            onTap: (){
                              Navigator.pushNamed(context,Shopping.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
             ),

          ],
        ),
      )

    );
  }
}


import 'package:flutter/material.dart';
import 'modelsss/post_homeless_model.dart';

import '../home-screeens/saved.dart';
class HomelessWidget extends StatelessWidget {
  Post_homeless object ;
 HomelessWidget( this.object );
  static const String routeName = 'all';

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Card(child: Column(
        children: [
          Row(children: [
            Container(
              // padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                height: 50,
                width: 46,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/catt.png"),
                      //post.imageUrl!
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(40)
                )
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(object.username.toString(),style: TextStyle(fontFamily:'Inter' ,fontWeight: FontWeight.w500,fontSize: 15),),
                  Row(
                    children: [
                      Text('10:30',style: TextStyle(fontFamily: 'Roboto',
                          fontSize: 13,fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),),
                      Icon(Icons.public,
                        color: Colors.grey[600],
                        size: 12.0,
                      ),
                    ],)],
              ),
            ),

          ],),
          const SizedBox(height: 4.0,),
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(object.caption!),
              Container(
                padding: EdgeInsets.all(20),
                //child: Image.asset(post.postimage!)
              ),
            ],
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),

                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Saved()));

                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  child: Text('Message'),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ),
            ),


          ],)

        ],
      )),
    ) ;

  }}

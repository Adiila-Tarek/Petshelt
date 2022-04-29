import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  static const String routeName = 'saved';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromARGB(255, 118, 189, 178),


          title : Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text('Saved',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter',color: Color.fromARGB(255,250, 250, 250),),),
          ),
        ),
        body: TabBarView(
          children: [_contentListView()],
        ),
      ),
    );
  }


  Widget _contentListView(){
    return ListView.builder(
        itemCount :5,
        scrollDirection: Axis.vertical,
        reverse: false,
        primary: true,
        itemBuilder: (BuildContext context, int index) {
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
                            image: new AssetImage("assets/images/test.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User_Name',style: TextStyle(fontFamily:'Inter' ,fontWeight: FontWeight.w500,fontSize: 15),),
                        Row(
                          children: [
                            Text('Sponserd',style: TextStyle(fontFamily: 'Roboto',
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
                    Text('insert text here '),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset('assets/images/post.png')),
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),

                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Saved()));

                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Message'),
                      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),


                ],)

              ],
            )),
          ) ;

        });
  }
}



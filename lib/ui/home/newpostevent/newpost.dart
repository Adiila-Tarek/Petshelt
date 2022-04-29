import 'package:flutter/material.dart';
import 'package:graduation_projectt/ui/models/users-models.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';


class New_post extends StatefulWidget {
 // final User current_user;
  //const New_post({Key? key, required this.current_user}) : super(key: key);
  static const String routeName = 'newpost';
  bool value =false ;
  //create new object

  @override
  _New_postState createState() => _New_postState();

  void setState(Null Function() param0) {}
}

class _New_postState extends State<New_post> {

  bool? checkBoxValue= false;
  bool ?checkBoxValue1= false;
  bool? checkBoxValue2= false;

   File? _image;
//create image_picker object
  final imagePicker =ImagePicker();
//create function to get image
  Future<void>getImage() async{
    final image =await imagePicker.getImage(source: ImageSource.camera);
    setState((){
      //assign image path to image file
      _image=File(image!.path);
    });
  }

  Future<void>getImageg() async{
    final image =await imagePicker.getImage(source: ImageSource.gallery);
    setState((){
      //assign image path to image file
      _image=File(image!.path);
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
       appBar:AppBar(
        backgroundColor:  Color.fromARGB(255, 118, 189, 178),
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text('New Post ',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,fontFamily: 'Inter',color: Color.fromARGB(255,250, 250, 250),)),
        ),
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
      ),
      body: Column(
        children: [
          Row(
            children: [

              Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 25),
                child: Image.asset('assets/images/test.png'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),),
              Text('user_name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,fontFamily: 'Inter',)),
            ],
          ),
          Container(
              decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
              BoxShadow(
              color: Color.fromARGB(255, 118, 189, 178),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
              ),
              ],
              ),
              height: 200,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              //color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                    maxLines: null,
                    cursorHeight: 25,
                    cursorColor: Color.fromARGB(255, 118, 189, 178),
                    decoration: InputDecoration.collapsed(
                    hintText: 'write here ...',
                    )
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 50,
                        child: _image==null ? Text(' ') : Image.file(_image!)),
                  )
                ],
              ),
              ),
          Container(
            child: Column(
                 children: [
                   Container(
                     alignment: Alignment.topLeft,
                     padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                     child: Text('your post related to ...',
                         style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,fontFamily: 'Inter',color: Color.fromARGB(80, 0, 0, 0),)),
                   ),
                   Row(
                 children: [
                 Checkbox(
                 value: checkBoxValue,
                 onChanged: (bool? value){
                 print(value);
                 setState(() {
                 checkBoxValue = value;
                 });
                 },
                 ),
                 Text("Adoption", style: TextStyle(fontSize: 18),),
                 ],
                 ),

                 Row(
                 children: [
                 Checkbox(
                 value: checkBoxValue1,
                 onChanged: (bool? value1){
                 print(value1);
                 setState(() {
                 checkBoxValue1 = value1;
                 });
                 },
                 ),
                 Text("Homeless", style: TextStyle(fontSize: 18),),

                 ],
                 ),
                 Row(
                 children: [
                 Checkbox(
                 value: checkBoxValue2,
                 onChanged: (bool? value2){
                 print(value2);
                 setState(() {
                 checkBoxValue2 = value2;
                 });
                 },
                 ),
                 Text("Commitment", style: TextStyle(fontSize: 18),),
                 ],
                 )
                 ],
                 ),
          ),
          Spacer(),

          Column(
            children: [
              Wrap(
                children: [

                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>
                        (Color.fromARGB(255, 118, 189, 178)),
                      ),
                      onPressed: getImage , child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.camera_alt_outlined,
                            size: 30.0,
                          ),
                        ),
                        Text('Camera',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,fontFamily: 'Inter',),)
                      ],
                    ),
                  )),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>
                        (Color.fromARGB(255, 118, 189, 178)),
                      ),
                      onPressed: getImageg , child: Expanded(
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.photo_camera_back,
                            size: 30.0,
                          ),
                        ),
                        Text('Photo',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,fontFamily: 'Inter',),)
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}

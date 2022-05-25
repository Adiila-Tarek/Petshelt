import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as s ;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petshelt/data/User.dart';
import 'package:path/path.dart' as path;
import '../Utils.dart';
import 'modelsss/post_homeless_model.dart';

class HomeNewpost extends StatefulWidget {

  @override
  State<HomeNewpost> createState() => _HomeNewpostState();
}

class _HomeNewpostState extends State<HomeNewpost> {
  var formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  var user = FirebaseAuth.instance.currentUser;
  //Post_homeless loginUser = Post_homeless(imageUrl: '', id: '', caption: '', username: '',postId: '', ownerId: '');


  String caption = '';

  var  _image;

  String imageUrl ='';
  String ownerId = '';
  String postId = '';
  UploadTask? uploadTask;
  s.User? loggedInUser ;


  @override
  void initState(){
    super.initState();
    getcurrentuser();
  }

  getcurrentuser()async{
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  getimagefromcamera()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera) ;
    if(image!=null){
      setState(() {
        _image =File(image.path);
        print( _image);
      });
    }
  }

  getimagefromgallery()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery) ;
    if(image!=null){
      setState(() {
        _image =File(image.path);
        print( _image);
      });
    }
  }

  uploadImage( ) async {
    final path = 'homeless /${_image!.path}';
    final file = File(_image!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);

    });
    final snapshshot = await uploadTask!.whenComplete(() {});

    final urlDownload= await snapshshot.ref.getDownloadURL();
    print('Download link : $urlDownload');

    setState(() {
      uploadTask = null;
    });

  }


  CollectionReference<Post_homeless> getPosthomelessCollectionWithConverter(){

    return FirebaseFirestore.instance.collection(Post_homeless.collectionName).
    withConverter<Post_homeless>(fromFirestore:(snapshot, _) => Post_homeless.fromJson(snapshot.data()!),
      toFirestore:(post_homeless, _) => post_homeless.toJson(), );
  }

  void addpost(String caption, File imageUrl) {

    uploadImage();

    if (!formkey.currentState!.validate()) {
      return;
    }
    //if valid insert new post
    addPosthomelessToFirestore(caption, _image ).then((value) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (buildContext) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(true);
            });
            return const AlertDialog(
              title: Text(
                'Added successfully',
                style: TextStyle(color: Colors.blueGrey),
              ),
            );
          });

      //add post successfully
    }).onError((error, stackTrace) {
      print('error adding post'); //show dialog
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      //show dialog //cannot connect to server
    });
  }

  @override
  Widget build(BuildContext context) {
    currentUserId() {
      return firebaseAuth.currentUser!.uid;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 189, 178),
        title: const Padding(
          padding: EdgeInsets.all(50.0),
          child: Text('New Post ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'Inter',
                color: Color.fromARGB(255, 255, 255, 255),
              )),
        ),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.pets_rounded),
              onPressed: ()async {
                uploadImage();
                addpost(caption, _image);
                },
              iconSize: 30,
              color: Colors.white70,
            ),
          ),
        ],


      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration:const BoxDecoration(
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
                height: 300,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Form(
                        key: formkey,
                        child: TextFormField(
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return 'please enter the caption ';
                              }
                              return null;
                            },
                            onChanged: (text) {
                              caption = text;
                            },
                            maxLines: null,
                            cursorHeight: 25,
                            cursorColor: Color.fromARGB(255, 118, 189, 178),
                            decoration: const InputDecoration.collapsed(
                              hintText: 'write here ...',
                            )),
                      ),
                    ),
                    Expanded(
                        child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            width: 140,
                            height: 140,
                            color: Colors.grey[300],
                            child: _image!= null
                                ? Image.file( _image, fit: BoxFit.fill)
                                : const Text('Please select an image'),
                          )
                        ],))
                  ],
                ),),
            ),


          ],
        ),
        Spacer(),
        Column(
          children: [
            Wrap(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 118, 189, 178)),
                    ),
                    onPressed:(){
                      getimagefromcamera();
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Inter',
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 118, 189, 178)),
                    ),
                    onPressed: () {
                      getimagefromgallery();
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.photo_camera_back,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                'Photo',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Inter',
                                ),
                              )
                            ],
                          ),
                        ),

                        buildProgress(),

                      ],
                    ))
              ],
            )
          ],
        ),


      ],),
    );
  }

  addPosthomelessToFirestore(String caption, File _image)async {
    CollectionReference<Post_homeless> collectionReference = getPosthomelessCollectionWithConverter();

    DocumentReference<Post_homeless> docRef = collectionReference.doc();
    Post_homeless opject = Post_homeless(
      id: docRef.id,
      caption: caption,
      username: loggedInUser!.email,
      ownerId: loggedInUser!.uid,
      postimage : _image.path,

    );
    return docRef.set(opject);
  }

  Widget buildProgress()=> StreamBuilder<TaskSnapshot>(
      stream:uploadTask?.snapshotEvents,
      builder: (context , snapshot){
        if(snapshot.hasData){
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Color.fromARGB(255, 118, 189, 178)
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(color: Colors.white ),
                  ),
                )
              ],
            ),
          );
        }
        return Text('') ;
      });

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }}



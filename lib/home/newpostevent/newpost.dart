
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:petshelt/home/newpostevent/firestoreUtils.dart';
import 'package:petshelt/home/newpostevent/modelsss/post-adopt-model.dart';
import '../Utils.dart';
import 'modelsss/commit_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class AdoptNewpost extends StatefulWidget {
  //final User current_user ;
  static const String routeName = 'newpost';
  bool value = false;

  //create new object

  @override
  _New_postState createState() => _New_postState( );

  void setState(Null Function() param0) {}
}

class _New_postState extends State<AdoptNewpost> {

  final _auth = FirebaseAuth.instance;

  var formkey = GlobalKey<FormState>();

//create image_picker object
  final imagePicker = ImagePicker();

//create function to get image

  var  _image;

  String caption = '';
  String imageUrl = '';
  String ownerId = '';
  String postId = '';
  UploadTask? uploadTask;
  User? loggedInUser ;


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
    final path = 'adoptionimages /${_image!.path}';
    final file = File(_image!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);

    });
    final snapshshot = await uploadTask!.whenComplete(() {
      // addpost(caption, imageUrl);
    });

    final urlDownload= await snapshshot.ref.getDownloadURL();
    print('Download link : $urlDownload');

    setState(() {
      uploadTask = null;
    });

  }


  CollectionReference<Post_adoption> getPostAdoptionCollectionWithConverter(){

    return FirebaseFirestore.instance.collection(Post_adoption.collectionName).
    withConverter<Post_adoption>(fromFirestore:(snapshot, _) => Post_adoption.fromJson(snapshot.data()!),
      toFirestore:(Post_adoption, _) => Post_adoption.toJson(), );
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                color: Color.fromARGB(255, 250, 250, 250),
              )),
        ),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.pets_rounded),
              onPressed: () {
                uploadImage();
                addpost(caption, _image);
              },
              iconSize: 30,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      body: Column(
        children: [

          Container(
            decoration: const BoxDecoration(
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
                        decoration: InputDecoration.collapsed(
                          hintText: 'write here ...',
                        )),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child:_image == null ? Text(' no image ') :
                    Image.file(File(_image!.path!),fit: BoxFit.cover,),
                    //Image.file(_image!)
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Divider(),
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
                      onPressed: getimagefromcamera,
                      child: Expanded(
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
                      )
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 118, 189, 178)),
                      ),
                      onPressed: getimagefromgallery,
                      child: Expanded(
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
                      )),
                  buildProgress(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void addpost(String caption, File imageUrl) {

    uploadImage();

    if (!formkey.currentState!.validate()) {
      return;
    }
    //if valid insert new post
    addPostAdoptToFirestore(caption, _image ).then((value) {
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

  addPostAdoptToFirestore(String caption,File _image )async {
    CollectionReference<Post_adoption> collectionReference = getPostadoptionCollectionWithConverter();

    DocumentReference<Post_adoption> docRef = collectionReference.doc();
    Post_adoption item = Post_adoption(
      id: docRef.id,
      caption: caption,
      postimage : _image.path,
      //imageUrl: loggedInUser!.photoURL!,
      userId :loggedInUser!.uid,
      username: loggedInUser!.email,
    );
    return docRef.set(item);
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
}
































/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:petshelt/data/User.dart' as u;
import 'modelsss/post-adopt-model.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
FirebaseStorage storage = FirebaseStorage.instance;

class New_post extends StatefulWidget {
 // final User currentUser;
  //New_post({required this.currentUser});
  static const String routeName = 'newpost';
  bool value = false;

  @override
  _New_postState createState() => _New_postState();

 // void setState(Null Function() param0) {}
}

class _New_postState extends State<New_post> {
 // User? user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  var formkey = GlobalKey<FormState>();
  var _image;
  String caption = '';
  String imageUrl = '';
  var file;
  String ownerId = '';
  String postId = '';
  var imagepicker = ImagePicker();
  String? downloadURL;
  UploadTask? uploadTask;
 u.User? loggedInUser ;


  @override
  void initState(){
    super.initState();
    getcurrentuser();
  }

  getcurrentuser()async{
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user as u.User?;
      }
    } catch (e) {
      print(e);
    }
  }

  getImagefromcamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera) ;
    if(image!=null){
      setState(() {
        _image =File(image.path);
        print( _image);
      });
    }
  }

  getImagefromgallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery) ;
    if(image!=null){
      setState(() {
        _image =File(image.path);
        print( _image);
      });
    }}

    // uploading the image to firebase cloudstore
  CollectionReference<Post_adoption> getPostadoptionCollectionWithConverter(){

    return FirebaseFirestore.instance.collection(Post_adoption.collectionName).
    withConverter<Post_adoption>(fromFirestore:(snapshot, _) => Post_adoption.fromJson(snapshot.data()!),
      toFirestore:(post_adoption, _) => post_adoption.toJson(), );
  }

  uploadImage( ) async {
    final path = 'adoptionImages /${_image!.path}';
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




  void addpost(String caption, String imageUrl) {

    //uploadImage();

    if (!formkey.currentState!.validate()) {
      return;
    }
    //if valid insert new post
    addPostadoptionToFirestore(caption, _image).then((value) {
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
                  color: Color.fromARGB(255, 250, 250, 250),
                )),
          ),
          actions: [
            Container(
              child: IconButton(
                icon: Icon(Icons.pets_rounded),
                onPressed: () {
                  addpost(caption,_image);
                },
                iconSize: 30,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        body: Column(
          children: [

            Container(
              decoration: const BoxDecoration(
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
              //color: Colors.white,
              child: Column(
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
                      child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 130,
                        height: 140,
                        color: Colors.grey[300],
                        child: _image == null ? Text(' no image ') :
                        Image.file(File(_image!.path!),fit: BoxFit.cover,),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            //Divider(),
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
                        onPressed: getImagefromcamera,
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
                        onPressed: getImagefromgallery,
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
                          ],
                        )),
                    buildProgress(),

                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    addPostadoptionToFirestore(String caption, File _image)async {
    CollectionReference<Post_adoption> collectionReference = getPostadoptionCollectionWithConverter();

    DocumentReference<Post_adoption> docRef = collectionReference.doc();
    Post_adoption item = Post_adoption(
      id: docRef.id,
      caption: caption,
      username: loggedInUser!.email,
      imageUrl: imageUrl,
      ownerId: loggedInUser!.id,

    );
    return docRef.set(item);
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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


}
*/

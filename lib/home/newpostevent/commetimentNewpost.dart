import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:path/path.dart' as path;
import '../Utils.dart';
import 'modelsss/commit_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class CommitNewpost extends StatefulWidget {
  //final User current_user ;
  static const String routeName = 'newpost';
  bool value = false;

  //create new object

  @override
  _New_postState createState() => _New_postState( );

  void setState(Null Function() param0) {}
}

class _New_postState extends State<CommitNewpost> {

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
   final path = 'test /${_image!.path}';
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


 CollectionReference<Post_commit> getPostcommitCollectionWithConverter(){

    return FirebaseFirestore.instance.collection(Post_commit.collectionName).
    withConverter<Post_commit>(fromFirestore:(snapshot, _) => Post_commit.fromJson(snapshot.data()!),
      toFirestore:(post_commit, _) => post_commit.toJson(), );
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
/*
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                child: Image.asset('assets/images/test.png'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              Text(post.name!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Inter',
                  )),
            ],
          ),
*/
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                      )),
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
    addPostcommitToFirestore(caption, _image ).then((value) {
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

  addPostcommitToFirestore(String caption,File _image )async {
    CollectionReference<Post_commit> collectionReference = getPostcommitCollectionWithConverter();

    DocumentReference<Post_commit> docRef = collectionReference.doc();
    Post_commit post = Post_commit(
      id: docRef.id,
      caption: caption,
      postimage: _image.path,
      //imageUrl: loggedInUser!.photoURL!,
      userId :loggedInUser!.uid,
      name: loggedInUser!.email,
    );
    return docRef.set(post);
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



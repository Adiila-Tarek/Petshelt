import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class DetectBreed extends StatefulWidget {
  static const String routeName = "DetectBreed";

  @override
  State<DetectBreed> createState() => _DetectBreedState();
}

class _DetectBreedState extends State<DetectBreed> {
  String _image = '';

  var file;

  var imagepicker = ImagePicker();

  late String result2 = '';

  void showSnackBar(String s, Duration duration) {}

  Future<dynamic> _uploadFile(filePath) async {
    String fileName = Path.basename(filePath.path);
    // print("file base name: $fileName");
    try {
      FormData formData = new FormData.fromMap({
        "image":
            await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Dio dio = new Dio();
      dio.options.contentType = 'multipart/form-data';
      Response response = await dio.post(
        'https://pet-breed.herokuapp.com/predict',
        data: formData,
      );
      print(
          "File Uploaded response: $response"); // where are remaining of data ?
      // _showSnackbarMsg(response.data['message']);
      // print(response.data);
      return response.data;
    } catch (e) {
      print("exception : $e");
      return null;
    }
  }

  getImagefromcamera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      _image = image.path;
      _uploadFile(file);
      Map<String, dynamic> result = await _uploadFile(file);
      if (result != null) {
        print(result["breed"]);
        result2 = result["breed"];

        setState(() {
          result2 = result["breed"];
        });
      }
    } else {
      showSnackBar("No File selected", Duration(milliseconds: 400));
    }
  }

  getImagefromgallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      _image = image.path;
      Map<String, dynamic> result = await _uploadFile(file);
      if (result != null) {
        print(result["breed"]);
        result2 = result["breed"];

        setState(() {
          result2 = result["breed"];
        });
      }
    } else {
      showSnackBar("No File selected", Duration(milliseconds: 400));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeds Detection'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: _image == null
                  ? Text('data')
                  : Image.file(
                      File(_image),
                      fit: BoxFit.cover,
                    ),
            )

/*
              Padding(
                padding: const EdgeInsets.all(40.0),
                child:
                Image.file(File(_image),fit: BoxFit.cover,),

                //
*/
/*
                Image.asset(
                  'images/shop.png',
                )
*/ /*

                //Text('')   :
              ),
*/
                ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 118, 189, 178),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    )),
                child: Container(
                  height: 100,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Breeds : ${result2}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                                onPressed: () {
                                  getImagefromcamera();
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black54,
                                  size: 35,
                                ),
                                label: const Text(
                                  'Camera',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "inter",
                                      color: Colors.black54),
                                )),
                          ),
                          Expanded(
                            child: TextButton.icon(
                                onPressed: () {
                                  getImagefromgallery();
                                },
                                icon: const Icon(
                                  Icons.image,
                                  color: Colors.black54,
                                  size: 35,
                                ),
                                label: const Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "inter",
                                      color: Colors.black54),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

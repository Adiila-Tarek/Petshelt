import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/data/User.dart' as AppUser;
import 'package:petshelt/data/firestore_utlis.dart';
import 'package:petshelt/homeScreen.dart';
import 'package:petshelt/info_shelters_screens/info_ui.dart';
import 'package:petshelt/provider/authenticationProvider.dart';
import 'package:provider/provider.dart';

import 'utils_format.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '',
      name = '',
      phoneNumber = '',
      password = '',
      confirmPassword = '';

  var formKey = GlobalKey<FormState>();
  late AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: signupText(),
            backgroundColor: Colors.transparent,
            elevation: 0),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: .2, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: .2,
                                color: Color.fromRGBO(118, 189, 178, 100)),
                          )),
                      onChanged: (text) {
                        email = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!isvalidemail(email)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: .2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: .2,
                              color: Color.fromRGBO(118, 189, 178, 100)),
                        )),
                    onChanged: (text) {
                      name = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'phone Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: .2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: .2,
                              color: Color.fromRGBO(118, 189, 178, 100)),
                        )),
                    onChanged: (text) {
                      phoneNumber = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter phone number';
                      }
                      if (text.length != 11) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: .2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: .2,
                              color: Color.fromRGBO(118, 189, 178, 100)),
                        )),
                    onChanged: (text) {
                      password = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter password ';
                      }
                      if (text.length < 6) {
                        return 'Please enter at least 6 charters ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: .2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: .2,
                              color: Color.fromRGBO(118, 189, 178, 100)),
                        )),
                    onChanged: (text) {
                      confirmPassword = text;
                    },
                    validator: (text) {
                      if (text != password) {
                        return 'Confirmation password does not match the entered password';
                      }
                      if (text == null || text.trim().isEmpty) {
                        return 'Enter confirmation password';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        createAccountWithFirebase();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(118, 189, 178, 100),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 165, vertical: 20),
                    )),

                test_button() //will be removed
              ],
            ),
          ),
        ));
  }

  void createAccountWithFirebase() async {
    try {
      showLoading(context);
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      hideLoading(context);
      if (result.user != null) {
        var MyUser = AppUser.User(
            id: result.user!.uid,
            name: name,
            phoneNumber: phoneNumber,
            email: email);
        addUserToFireStore(MyUser).then((value) {
          //showMessage('User registered Successful', context);
          provider.updateUser(MyUser);
          Navigator.pushReplacementNamed(context, homeScreen.routeName);
        }).onError((error, stackTrace) {
          showMessage(error.toString(), context);
        });
      }
    } catch (error) {
      hideLoading(context);
      showMessage(error.toString(), context);
    }
  }
}

class signupText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            style: TextStyle(
                fontSize: 50,
                fontFamily: "inter/fonts/Inter-SemiBold.ttf",
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
          TextSpan(text: 'S', style: TextStyle(color: Color(0xFFF182F0))),
          TextSpan(text: 'i', style: TextStyle(color: Color(0xFF81D9C4))),
          TextSpan(text: 'g', style: TextStyle(color: Color(0xFFFF9436))),
          TextSpan(text: 'n', style: TextStyle(color: Color(0xFF0DFFFF))),
          TextSpan(text: ' U', style: TextStyle(color: Color(0xFFA591D9))),
          TextSpan(text: 'p', style: TextStyle(color: Color(0xFF6EC9B1)))
        ]));
  }
}

class test_button extends StatelessWidget {
  //will be removed

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 15,
      icon: Icon(Icons.login),
      color: Colors.black,
      onPressed: () {
        Navigator.pushNamed(context, infoScreen.routeName);
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petshelt/data/firestore_utlis.dart';
import 'package:petshelt/homeScreen.dart';
import 'package:petshelt/info_shelters_screens/info_ui.dart';
import 'package:petshelt/provider/authenticationProvider.dart';
import 'package:petshelt/signup_screen/signupScreen.dart';
import 'package:provider/provider.dart';
import '../signup_screen/utils_format.dart';

class loginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String email = '', password = '';

  var formKey = GlobalKey<FormState>();
  late AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: loginText(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ElevatedButton(
                      child: const Text('Login',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          LoginWithFirebase();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(118, 189, 178, 100),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 165, vertical: 20),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 57,
                        icon: const Icon(Icons.facebook_outlined),
                        color: Colors.blue,
                        onPressed: () {
                          _logInWithFacebook();
                        },
                      ),
                      IconButton(
                        iconSize: 47,
                        icon: Image.asset('images/google.png'),
                        color: Colors.white,
                        onPressed: () {
                          _loginWithGoogle();
                        },
                      ),
                    ],
                  ),
                  const Text('Don\'t have an account ? ',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "inter",
                          color: Colors.black38)),
                  signUpButton()
                ],
              ),
            ),
          ),
        ));
  }

  void _logInWithFacebook() async {
    try {
      showLoading(context);
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
        'id': userData['id']
      });
      hideLoading(context);
      showMessage('User logged in Successful', context);
    } on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'Account-exists-with-different-credential':
          title = 'this accounts exits with a different sign in provider';
          break;
        case 'invalid-credential':
          title = 'Unknown error has accrued ';
          break;
        case 'operation-not-allowed':
          title = 'This operation not allowed';
          break;
        case 'user-disabled':
          title = 'The user you tried to log into is disabled ';
          break;
        case 'user-not-found':
          title = 'The user you tried to log into was not found';
          break;
      }
      hideLoading(context);
      showMessage(title, context);
    }
  }

  void LoginWithFirebase() async {
    try {
      showLoading(context);
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      hideLoading(context);
      if (result.user != null) {
        //showMessage('User logged in Successful', context);
        var fireStoreUser = await getUserById(result.user!.uid);
        if (fireStoreUser != null) {
          provider.updateUser(fireStoreUser);
          Navigator.pushReplacementNamed(context, infoScreen.routeName);
        }
      }
    } catch (error) {
      hideLoading(context);
      showMessage(error.toString(), context);
    }
  }

  void _loginWithGoogle() async {
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      showLoading(context);
      final googleSignInAccount = await googleSignIn.signIn();

      final googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': googleSignInAccount?.email,
        'imageUrl': googleSignInAccount?.photoUrl,
        'name': googleSignInAccount?.displayName,
        'id': googleSignInAccount?.id
      });
      hideLoading(context);
      showMessage('User logged in Successful', context);
    } on FirebaseAuthException catch (e) {
      var titleError = '';
      switch (e.code) {
        case 'Account-exists-with-different-credential':
          titleError = 'this accounts exits with a different sign in provider';
          break;
        case 'invalid-credential':
          titleError = 'Unknown error has accrued ';
          break;
        case 'operation-not-allowed':
          titleError = 'This operation not allowed';
          break;
        case 'user-disabled':
          titleError = 'The user you tried to log into is disabled ';
          break;
        case 'user-not-found':
          titleError = 'The user you tried to log into was not found';
          break;
      }
      hideLoading(context);
      showMessage(titleError, context);
    }
  }
}

class loginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            style: TextStyle(
                fontSize: 50,
                fontFamily: "inter/fonts/Inter-SemiBold.ttf",
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
          TextSpan(text: 'L', style: TextStyle(color: Color(0xFFA591D9))),
          TextSpan(text: 'o', style: TextStyle(color: Color(0xFFFF9436))),
          TextSpan(text: 'g', style: TextStyle(color: Color(0xFF6EC9B1))),
          TextSpan(text: 'i', style: TextStyle(color: Color(0xFFF5E482))),
          TextSpan(text: 'n', style: TextStyle(color: Color(0xFF0DFFFF))),
        ]));
  }
}

class signUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Sign Up', style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.pushNamed(context, infoScreen.routeName);
      },
    );
  }
}

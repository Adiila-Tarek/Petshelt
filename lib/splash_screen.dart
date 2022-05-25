import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login_screen/loginScreen.dart';

class splashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";

  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: loginScreen(),
      duration: 5000,
      speed: 50,
      text: "Pet\$helt",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
          fontSize: 64.0,
          fontFamily: "inter/fonts/Inter-SemiBold.ttf",
          fontWeight: FontWeight.bold),
      colors: const [
        Color(0xFF68D3FF),
        Color(0xFFFD94D2),
        Color(0xFF6EAFA5),
        Color(0xFFCE8A5F),
        Color(0xFFF5CC84),
        Color(0xFF51A4C6),
        Color(0xFFBD77CE),
        Color(0xFF73B7AC),
      ],
      backgroundColor: Colors.white,
    );
  }
}

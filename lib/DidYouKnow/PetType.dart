import 'package:flutter/material.dart';

class PetType extends StatelessWidget {
  String type;
  String imagePath;

  PetType(this.type, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.center, //text
          children: [
            Opacity(
              opacity: 0.6,
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              type,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class menuitems extends StatelessWidget {
  const menuitems({Key? key, required this.name, required this.icon, required this.onPressed,}) : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height:55,
        width: 250,
        child: Row(
          children: [
            Icon(icon, size: 25, color: Colors.black),
            const SizedBox(width: 30,),
            Text(name, style: TextStyle(fontSize: 18, color: Colors.black),)
          ],

        ),
      ) ,
    );

  }
}


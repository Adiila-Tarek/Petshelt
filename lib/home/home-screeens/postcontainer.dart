import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final List post;
  const PostContainer(
      {Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          postheader( post: post),
          postcontent(  post: post),
        ],
      ),
    );
  }
}
class postheader extends StatelessWidget {
  final List post;

  const postheader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/shop.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(40)
            )
        ),
        Column(
          children: [
            Text('user_name'),
          ],
        )

      ],
    );
  }
}

class postcontent extends StatelessWidget {
  final List post;

  const postcontent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text('amani') ,
    );
  }
}

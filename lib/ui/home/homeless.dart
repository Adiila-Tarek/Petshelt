
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_projectt/ui/home/adoption.dart';
import 'package:graduation_projectt/ui/home/HomeScreen.dart';
import 'package:graduation_projectt/ui/home/commitment.dart';
import 'package:graduation_projectt/ui/home/knowing.dart';
import 'package:graduation_projectt/ui/home/newpostevent/newpost.dart';
import 'package:graduation_projectt/ui/home/saved.dart';
import 'package:graduation_projectt/ui/home/shop.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'home_navigator_cubit.dart';


class Homeless extends StatelessWidget {
  const Homeless({Key? key}) : super(key: key);
  static const String routeName = 'homeless';
  final _dummyAvatar = 'https://picsum.photos/250?image=9';
  final _dummyImage = 'https://picsum.photos/250?image=9';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 118, 189, 178),

        leading: IconButton(
          icon:Icon(Icons.menu),
          hoverColor: Colors.black,
          onPressed: () {
            print('hello');
          },
          color: Colors.white,
        ),
        title : Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text('homeless',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter',color: Color.fromARGB(255,250, 250, 250),),),
        //Pet\$helt
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 197, 225, 208),
          actions: [
            Expanded(child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Adoption()));
            }, icon: Image.asset('assets/images/adopt.png',))),
            Expanded(child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homeless()));
            }, icon: Image.asset('assets/images/catt.png',))),
            Expanded(child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Knowing()));
            }, icon: Image.asset('assets/images/know.png',))),
            Expanded(child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Commitment()));
            }, icon: Image.asset('assets/images/commit.png',))),
            Expanded(child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Shopping()));
            }, icon: Image.asset('assets/images/shop.png',))),
          ],
        ),
      ),
      body: _postslistview(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 197, 225, 208),
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => New_post()));

        },
      ),
    );
  }
  Widget _postAuthorRow(BuildContext context){
    const double avatarDiameter = 44 ;
    return GestureDetector(
      onTap: ()=>BlocProvider.of<HomeNavigatorCubit>(context).Showprofile(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color:Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: CachedNetworkImage(
                  imageUrl: _dummyAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'User Name',
              style: TextStyle(
                fontSize: 16,fontFamily: 'Inter',
              )
              ),
              Icon(Icons.public,size: 18,color: Colors.grey,)
            ],
          ),
        ],
      ),
    );
  }
  Widget _postImage(){
    return AspectRatio(
        aspectRatio: 1,
    child: Container(
      padding: EdgeInsets.all(20),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: _dummyImage,
      ),
    ),
    );
  }

  Widget _postCaption(){
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical:4 ,
        horizontal:8 ,
      ),
      child: Text('caption is here'),
    );
  }

   Widget _savedmsgbutton(BuildContext context){
    return GestureDetector(
      onTap: ()=>BlocProvider.of<HomeNavigatorCubit>(context).Showsaved(),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ElevatedButton(
                child: Text('Save'),
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),

                onPressed: () {

                },),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: ()=>BlocProvider.of<HomeNavigatorCubit>(context).Showsaved(),
                child: ElevatedButton(
                  child: Text('Message'),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),

                  onPressed: () {

                  },),
              ),
            ),
          )
        ],
      ),
    );
   }

  Widget _postview(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(context) , _postCaption() ,_postImage(),_savedmsgbutton(context),
      ],
    );
  }


  Widget _postslistview(BuildContext context){
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index){
          return _postview(context);

        });
  }


}


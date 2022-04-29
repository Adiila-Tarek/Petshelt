import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_projectt/ui/home/home_navigator_cubit.dart';
import 'package:graduation_projectt/ui/home/homeless.dart';
import 'package:graduation_projectt/ui/home/newpostevent/newpost.dart';
import 'package:graduation_projectt/ui/home/profile.dart';
import 'package:graduation_projectt/ui/home/saved.dart';
class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeNavigatorCubit(HomeNavigatorState.home),
        child:BlocBuilder<HomeNavigatorCubit,HomeNavigatorState>(
            builder: (context,state){
          return Navigator(
          pages: [
          MaterialPage(child: (Homeless())),
            if(state==HomeNavigatorState.saved)
              MaterialPage(child: Saved()),
            if(state==HomeNavigatorState.profile)
              MaterialPage(child: profile()),
            //if(state==HomeNavigatorState.message)
            //  MaterialPage(child: Message()),
          ],
        );}
      ));

  }
}

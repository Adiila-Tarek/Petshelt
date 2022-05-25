/*
import 'package:flutter/material.dart';
import 'package:petshelt/home/home-screeens/saved.dart';
import '';
import '../home_navigator_cubit.dart';
import '../profile.dart';
import 'homeless.dart';
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
*/

import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeNavigatorState { saved , message ,home,profile }

class HomeNavigatorCubit extends Cubit<HomeNavigatorState>{
  HomeNavigatorCubit(HomeNavigatorState initialState) : super(HomeNavigatorState.home);

  void Showsaved() => emit(HomeNavigatorState.saved);
  void Showmessage() => emit(HomeNavigatorState.message);
  void Showhome() => emit(HomeNavigatorState.home);
  void Showprofile() => emit(HomeNavigatorState.profile);

}

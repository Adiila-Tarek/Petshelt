import 'package:flutter/material.dart';
import 'package:petshelt/data/User.dart' as AppUser;

class AuthProvider extends ChangeNotifier {
  AppUser.User? user = null;

  void updateUser(AppUser.User user) {
    this.user = user;
    notifyListeners();
  }
}

// providers/user_provider.dart
import 'package:flutter/material.dart';
import 'package:formulario_multiplas_etapas/model/user.dart';

class UserProvider extends ChangeNotifier {
  late User user;

  void updateUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}

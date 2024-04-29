import 'dart:io';

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:practical/model/user_model.dart';


abstract class AuthScreenViewModel extends ChangeNotifier {
  void login(String email, String password);
    void loadDetails();
  void register(
      String name, String email, String password, String password_confirmation);
   CurrentUser get currentUser;
}

import 'dart:io';

import 'package:practical/model/user_model.dart';


abstract class AuthRepository {
  Future<String?> login(
    String email,
    String password,
  );
  Future<String?> register(
      String name, String email, String password, String password_confirmation);
        Future<CurrentUser?> getCurrentUser();
}

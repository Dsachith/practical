import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:practical/constants/enums.dart';
import 'package:practical/general/shared_preference_helper.dart';

import 'package:practical/repository/auth_repository.dart';

import '../constants/config.dart';
import '../general/secure_storage.dart';

import '../model/user_model.dart';
import '../service/error_services.dart';
import '../service/navigation_service.dart';
import '../service/network_servce.dart';
import 'package:http/http.dart' as http;

class AuthDelegate extends AuthRepository {
  final NetworkService networkService;
  final ErrrorService errorService;
  final NavigationService navigationService;

  AuthDelegate({
    required this.networkService,
    required this.errorService,
    required this.navigationService,
  });
  @override
  Future<String?> login(String email, String password) async {
    try {
      var response = await networkService
          .performRequest(Config.signIn, HttpAction.POST, body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        SecureStorage.writeValue('basicAuth', response.body);
        SharedPreferenceHelper.saveToPref("token", response.body);
        Fluttertoast.showToast(
          msg: "Login Successfully", // message
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white, // Also possible "TOP" and "CENTER"
        );
      }

      if (response.statusCode == 422) {
        Fluttertoast.showToast(
          msg: "Sorry, the login details you provided are incorrect", // message
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        return null;
      }
      if (response.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Sorry, the login details you provided are incorrect", // message
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        return null;
      } else {}

      return response.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> register(String name, String email, String password,
      String password_confirmation) async {
    try {
      var response = await networkService
          .performRequest(Config.signUp, HttpAction.POST, body: {
        "name": name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
      });
      if (response.statusCode == 200) {
        SecureStorage.writeValue('basicAuth', response.body);
        SharedPreferenceHelper.saveToPref("token", response.body);
        Fluttertoast.showToast(
          msg:
              "Welcome. You have successfully registered to the App.", // message
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
        );
        Future.delayed(Duration(seconds: 2), () {
          navigationService.pushReplacement("/bottom");
        });
      } else {
        Fluttertoast.showToast(
          msg: "Registration Failed , Try Again", // message
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      return response.body;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<CurrentUser?> getCurrentUser() async {
    CurrentUser currentUser = CurrentUser.empty();

    try {
      var response = await networkService.performRequest(
          Config.currentUser, HttpAction.GET);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;

        return await compute(currentUserFromJson, jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

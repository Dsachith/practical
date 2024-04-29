import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practical/general/shared_preference_helper.dart';
import 'package:practical/service/error_services.dart';
import 'package:practical/view_model/auth/auth_view_model.dart';
import '../../general/secure_storage.dart';
import '../../model/user_model.dart';
import '../../repository/auth_repository.dart';
import '../../service/navigation_service.dart';

class IAuthScreenViewModel extends AuthScreenViewModel {
  final AuthRepository authRepository;
  final NavigationService navigationService;
  final ErrrorService errorService;
  CurrentUser _currentUser = CurrentUser.empty();

  IAuthScreenViewModel({
    required this.authRepository,
    required this.navigationService,
    required this.errorService,
  });

  @override
  void loadDetails() {
    authRepository.getCurrentUser().then((currentUser) {
      if (currentUser != null) {
        _currentUser = currentUser;
        notifyListeners();
      }
    });
  }

  @override
  void login(String email, String password) {
    authRepository.login(email, password).then((token) {
      if (token != null) {
        Future.delayed(Duration(seconds: 2), () {
          navigationService.pushReplacement("/fav");
        });
      }
    });
  }

  @override
  void register(String name, String email, String password,
      String password_confirmation) {
    authRepository
        .register(name, email, password, password_confirmation)
        .then((token) {
      if (token != null) {
        Future.delayed(Duration(seconds: 2), () {
          navigationService.pushReplacement("/fav");
        });
      } else {}
    });
  }

  @override
  CurrentUser get currentUser => _currentUser;
}

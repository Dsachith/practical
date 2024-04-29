import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:practical/service/error_services.dart';
import 'package:practical/service/navigation_service.dart';
import 'package:practical/view_model/services/services_view_model.dart';

import '../../model/fav_model.dart';

import '../../repository/services_repository.dart';

class IServicesViewModel extends ServicesScreenViewModel {
  final ServicesRepository servicesRepository;
  final NavigationService navigationService;
  final ErrrorService errorService;

  List<int> favList = [];

  FavModel _favModel = FavModel.empty();

  IServicesViewModel({
    required this.servicesRepository,
    required this.navigationService,
    required this.errorService,
  });

  @override
  void loadFavList() {
    servicesRepository.getFavList().then((favModel) {
      if (favModel != null) {
        _favModel = favModel;
        notifyListeners();
      }
    });
  }

  @override
  FavModel? get favModel => _favModel;
}

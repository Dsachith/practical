import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practical/constants/config.dart';
import 'package:practical/constants/enums.dart';
import 'package:practical/model/fav_model.dart';
import 'package:practical/repository/services_repository.dart';
import 'package:practical/service/error_services.dart';
import 'package:http/http.dart' as http;

import '../service/network_servce.dart';

class ServicesDelegate extends ServicesRepository {
  final NetworkService networkService;
  final ErrrorService errorService;

  ServicesDelegate({
    required this.networkService,
    required this.errorService,
  });

  @override
  Future<FavModel> getFavList() async {
    FavModel favModel = FavModel();
    String fileName = "fav.json";
    var dir = await getTemporaryDirectory();
    File file = new File("${dir.path}/$fileName");
    if (file.existsSync()) {
      try {
        var response =
            await networkService.performRequest(Config.favList, HttpAction.GET);

        if (response.statusCode == 200) {
          var jsonResponse = response.body;
          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);

          favModel = FavModel.fromJson(jsonDecode(jsonResponse));
        } else {
          print(response.body);
        }
      } catch (e) {
        print(e);
      }
      var jsonData = file.readAsStringSync();
      var response = await compute(favModelFromJson, jsonData);
      return response;
    } else {
      try {
        var response =
            await networkService.performRequest(Config.favList, HttpAction.GET);

        if (response.statusCode == 200) {
          var jsonResponse = response.body;
          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);

          favModel = FavModel.fromJson(jsonDecode(jsonResponse));
        } else {
          print(response.body);
        }
      } catch (e) {
        print(e);
      }
    }

    return favModel;
  }
}

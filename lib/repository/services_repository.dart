import 'dart:io';
import '../model/fav_model.dart';


abstract class ServicesRepository {
  Future<FavModel?> getFavList();
}

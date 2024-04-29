import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:practical/model/fav_model.dart';

abstract class ServicesScreenViewModel extends ChangeNotifier {
  void loadFavList();

  FavModel? get favModel;
}

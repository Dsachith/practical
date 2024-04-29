import 'package:flutter/material.dart';
import 'package:practical/injection.dart' as di;
import 'head.dart';
import 'package:device_preview/device_preview.dart';
import 'package:rename/rename.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  di.init();
  runApp(const Head());
}

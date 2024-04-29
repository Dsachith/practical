//package
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  //create storage
  static const _storage = FlutterSecureStorage();

  //read all values from storage
  static Future<String?> readValue(String key) async => _storage.read(key: key);

//read all values from storage
  static Future<Map<String, String>> readValues() async => _storage.readAll();

  //delete keys
  static Future<void> deleteAllValues() async {
    await _storage.deleteAll();

  }

  //write key value to _storage
  static Future<void>writeValue(String key,dynamic value)async{
    await _storage.write(key: key, value: value);
  }
}

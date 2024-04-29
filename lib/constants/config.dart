import 'dart:io';

class Config {

  static const String _baseUrl = "https://rentavan.axcertro.dev";
  static String get signIn => "$_baseUrl/api/login";

  static String get signUp => "$_baseUrl/api/register";

  static String get currentUser => "$_baseUrl/api/user";
 
  static String get favList => "$_baseUrl/api/fav/list";

 
}

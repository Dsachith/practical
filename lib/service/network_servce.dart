import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:practical/general/secure_storage.dart';

import '../constants/app_error.dart';
import '../constants/enums.dart';

import '../injection.dart';
import 'error_services.dart';

class NetworkService {
  late Client _client;

  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Response> performRequest(
    String url,
    HttpAction action, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool noToken = false,
  }) async {
    try {
      _client = Client();
      late Response response;

      String? bearerToken = await SecureStorage.readValue("basicAuth");
      log(bearerToken ?? "No token found");
      if (bearerToken != null && !noToken) {
        _headers.addAll({'Authorization': 'Bearer $bearerToken'});
      }

      if (noToken) {
        _headers.remove('Authorization');
      }

      if (headers != null && headers.isNotEmpty) {
        _headers.addAll(headers);
      }

      switch (action) {
        case HttpAction.GET:
          response = await _client.get(Uri.parse(url), headers: _headers);
          break;
        case HttpAction.POST:
          response = await _client
              .post(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.MultipartRequest:
          response = await _client
              .post(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;

        case HttpAction.PUT:
          response = await _client
              .put(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.PATCH:
          response = await _client
              .patch(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.DELETE:
          response =
              await _client.delete(Uri.parse(url), headers: _headers).timeout(
                    const Duration(seconds: 8),
                  );
          break;
      }

      log("Network Call: $url");
      log("StatusCode: ${response.statusCode} Result: ${response.body}");

      return response;
    } on SocketException {
      sl<ErrrorService>().showError(NetworkFailure());
      return Future.error(NetworkFailure());
    } on TimeoutException {
      sl<ErrrorService>().showError(TimeoutFailure());
      return Future.error(TimeoutFailure());
    } on FormatException {
      sl<ErrrorService>().showError(FormatFailure());
      return Future.error(FormatFailure());
    } on HttpException {
      sl<ErrrorService>().showError(HttpFailure());
      return Future.error(HttpFailure());
    }
  }

  void dispose() {
    _client.close();
  }
}

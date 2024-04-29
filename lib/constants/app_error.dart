import 'package:practical/constants/app_strings.dart';

abstract class Failure {}

class NetworkFailure extends Failure {
  @override
  String toString() => NO_INTERNET_CONNECTION;
}

class TimeoutFailure extends Failure {
  @override
  String toString() => TIMEOUT_ERROR;
}

class FormatFailure extends Failure {
  @override
  String toString() => FORMAT_ERROR;
}

class HttpFailure extends Failure {
  @override
  String toString() => HTTP_ERROR;
}

class UnknownFailure extends Failure {
  final String? message;

  UnknownFailure([this.message]);

  @override
  String toString() => message ?? UNKNOWN_ERROR;
}

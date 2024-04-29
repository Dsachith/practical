class ErrorModel {
  final String message;

  const ErrorModel(this.message);

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      json['message'] as String,
    );
  }
}

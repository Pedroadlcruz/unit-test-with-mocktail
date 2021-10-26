class ResponseModel<T> {
  String message;
  bool success;
  T? result;
  ResponseModel({
    required this.message,
    required this.success,
    this.result,
  });

  ResponseModel.fromJson(dynamic json)
      : message = json["message"] as String,
        success = json["success"] as bool,
        result = json["result"] as T?;
}

class BaseResponse {
  bool isSuccess;
  String? message;
  dynamic data;
  BaseResponse({this.isSuccess = false, this.message, this.data});
}

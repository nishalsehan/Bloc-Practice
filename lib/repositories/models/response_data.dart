

class ResponseData {
  bool status;
  List? data;
  String? message;
  String? error;

  ResponseData(this.status,{this.data, this.message, this.error});
}
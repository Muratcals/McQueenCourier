class ResponseErrorModel {
  int? statusCode;
  String? statusTitle;
  String? statusMessage;
  String? incoming;

  ResponseErrorModel(
      {this.statusCode,this.statusTitle,this.statusMessage, this.incoming});
}
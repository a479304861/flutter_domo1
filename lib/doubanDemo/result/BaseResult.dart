class BaseResult {
  String message;
  bool success;
  int code;
  dynamic data;

  BaseResult({this.message, this.success, this.code, this.data});

  BaseResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}
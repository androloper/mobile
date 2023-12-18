class ChatResponse {
  String? status;
  String? message;
  ChatUser? data;

  ChatResponse({this.status, this.message, this.data});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ChatUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChatUser {
  String? token;
  String? sid;
  String? name;

  ChatUser({this.token, this.sid, this.name});

  ChatUser.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    sid = json['sid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['sid'] = this.sid;
    data['name'] = this.name;
    return data;
  }
}
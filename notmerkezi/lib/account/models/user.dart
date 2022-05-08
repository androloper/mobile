class UserModel {
  int? id;
  String? email;
  String? password;
  String? name;
  int? schoolId;
  String? phone;

  UserModel(
      {this.id,
        this.email,
        this.password,
        this.name,
        this.schoolId,
        this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    schoolId = json['schoolId'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['schoolId'] = this.schoolId;
    data['phone'] = this.phone;
    return data;
  }
}
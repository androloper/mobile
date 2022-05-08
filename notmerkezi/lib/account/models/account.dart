class Account {
  int? id;
  String? email;
  String? password;
  String? name;
  int? schoolId;
  String? createdDate;
  String? updatedDate;
  String? phoneNo;

  Account({this.id, this.email, this.password, this.name, this.schoolId, this.createdDate, this.updatedDate, this.phoneNo});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    schoolId = json['schoolId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['schoolId'] = this.schoolId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['phoneNo'] = this.phoneNo;
    return data;
  }
}
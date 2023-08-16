class User {
  int? id;
  String? fullname;
  String? firstLetters;
  String? studentNo;
  int? universityId;
  int? departmentId;
  String? email;
  String? password;
  String? phone;
  String? createdDate;
  String? updatedDate;

  User(
      {this.id,
        this.fullname,
        this.firstLetters,
        this.studentNo,
        this.universityId,
        this.departmentId,
        this.email,
        this.password,
        this.phone,
        this.createdDate,
        this.updatedDate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    firstLetters = json['firstLetters'];
    studentNo = json['studentNo'];
    universityId = json['universityId'];
    departmentId = json['departmentId'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['firstLetters'] = this.firstLetters;
    data['studentNo'] = this.studentNo;
    data['universityId'] = this.universityId;
    data['departmentId'] = this.departmentId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
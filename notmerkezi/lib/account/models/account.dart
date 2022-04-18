class Account {
  int? id;
  String? fullName;
  String? birthDate;
  String? phoneNo;
  String? university;
  String? department;
  String? studentNo;

  Account({this.id, this.fullName, this.birthDate, this.phoneNo, this.university, this.department, this.studentNo});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    birthDate = json['birthDate'];
    phoneNo = json['phoneNo'];
    university = json['university'];
    department = json['department'];
    studentNo = json['studentNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['birthDate'] = this.birthDate;
    data['phoneNo'] = this.phoneNo;
    data['university'] = this.university;
    data['department'] = this.department;
    data['studentNo'] = this.studentNo;
    return data;
  }
}
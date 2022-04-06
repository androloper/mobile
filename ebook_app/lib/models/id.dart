class Id {
  String? t;

  Id({this.t});

  Id.fromJson(Map<String, dynamic> json) {
    t = json[r'$t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[r'$t'] = this.t;
    return data;
  }
}
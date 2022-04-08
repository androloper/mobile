class Copyright {
  int? year;
  String? url;

  Copyright({this.year, this.url});

  Copyright.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['url'] = this.url;
    return data;
  }
}
class Category {
  String? label;
  String? term;
  String? scheme;

  Category({this.label, this.term, this.scheme});

  Category.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    term = json['term'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['label'] = this.label;
    data['term'] = this.term;
    data['scheme'] = this.scheme;
    return data;
  }
}
class Link1 {
  String? type;
  String? rel;
  String? title;
  String? href;

  Link1({this.type, this.rel, this.title, this.href});

  Link1.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    rel = json['rel'];
    title = json['title'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['rel'] = this.rel;
    data['title'] = this.title;
    data['href'] = this.href;
    return data;
  }
}
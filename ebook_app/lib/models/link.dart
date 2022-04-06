class Link {
  String? rel;
  String? type;
  String? href;
  String? title;
  String? opdsActiveFacet;
  String? opdsFacetGroup;
  String? thrCount;

  Link(
      {this.rel,
        this.type,
        this.href,
        this.title,
        this.opdsActiveFacet,
        this.opdsFacetGroup,
        this.thrCount});

  Link.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
    title = json['title'];
    opdsActiveFacet = json['opds:activeFacet'];
    opdsFacetGroup = json['opds:facetGroup'];
    thrCount = json['thr:count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rel'] = this.rel;
    data['type'] = this.type;
    data['href'] = this.href;
    data['title'] = this.title;
    data['opds:activeFacet'] = this.opdsActiveFacet;
    data['opds:facetGroup'] = this.opdsFacetGroup;
    data['thr:count'] = this.thrCount;
    return data;
  }
}

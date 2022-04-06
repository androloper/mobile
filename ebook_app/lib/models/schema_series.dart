class SchemaSeries {
  String? schemaPosition;
  String? schemaName;
  String? schemaUrl;

  SchemaSeries({this.schemaPosition, this.schemaName, this.schemaUrl});

  SchemaSeries.fromJson(Map<String, dynamic> json) {
    schemaPosition = json[r'schema:position'];
    schemaName = json[r'schema:name'];
    schemaUrl = json[r'schema:url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[r'schema:position'] = this.schemaPosition;
    data[r'schema:name'] = this.schemaName;
    data[r'schema:url'] = this.schemaUrl;
    return data;
  }
}
class Version {
  String? appVersion;
  String? appVersion2;
  String? appVersion3;
  String? appVersion4;

  Version(
      {this.appVersion, this.appVersion2, this.appVersion3, this.appVersion4});

  Version.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    appVersion2 = json['appVersion2'];
    appVersion3 = json['appVersion3'];
    appVersion4 = json['appVersion4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appVersion'] = this.appVersion;
    data['appVersion2'] = this.appVersion2;
    data['appVersion3'] = this.appVersion3;
    data['appVersion4'] = this.appVersion4;
    return data;
  }
}
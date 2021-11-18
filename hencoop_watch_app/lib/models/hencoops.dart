class Hencoop {
  List<dynamic>? alarms;
  int? deviceId;
  String? humidity;
  bool? isOnline;
  String? lastDate;
  String? lastTime;
  int? lat;
  String? licensePlate;
  int? lng;
  bool? powerStatus;
  int? reason;
  String? reasonStr;
  int? sensorCount;
  String? systemDate;
  String? temperature;

  Hencoop({this.alarms,
    this.deviceId,
    this.humidity,
    this.isOnline,
    this.lastDate,
    this.lastTime,
    this.lat,
    this.licensePlate,
    this.lng,
    this.powerStatus,
    this.reason,
    this.reasonStr,
    this.sensorCount,
    this.systemDate,
    this.temperature});

  factory Hencoop.fromJson(Map<String, dynamic> json) {
    return Hencoop(
      alarms: json['Alarms'],
      deviceId: json['DeviceID'],
      humidity: json['Humudity'],
      isOnline: json['IsOnline'],
      lastDate: json['LastDate'],
      lastTime: json['LastTime'],
      lat: json['Lat'],
      licensePlate: json['LicensePlate'],
      lng: json['Lng'],
      powerStatus: json['PowerStatus'],
      reason: json['Reason'],
      reasonStr: json['ReasonStr'],
      sensorCount: json['SensorCount'],
      systemDate: json['SystemDate'],
      temperature: json['Temperature'],
    );
  }
}
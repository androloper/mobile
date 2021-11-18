class Config {
  List<Alarms>? alarms;
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

  Config({ this.alarms,
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

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      alarms: List<Alarms>.from(json["Alarms"].map((x) => Alarms.fromJson(x)).toList()),
      deviceId: json['DeviceId'],
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
  Map<String, dynamic> toJson() {
    return {
      'Alarms': alarms,
      'DeviceId': deviceId,
      'Humudity': humidity,
      'IsOnline': isOnline,
      'LastTime': lastTime,
      'LastDate': lastDate,
      'Lat': lat,
      'LicensePlate': licensePlate,
      'Lng': lng,
      'PowerStatus': powerStatus,
      'Reason': reason,
      'ReasonStr': reasonStr,
      'SensorCount': sensorCount,
      'SystemDate': systemDate,
      'Temperature': temperature,
    };
  }
}

class Alarms {
  int? lowerLimit;
  int? type;
  int? upperLimit;

  Alarms({this.lowerLimit,
    this.type,
    this.upperLimit});

  factory Alarms.fromJson(Map<String, dynamic> json) {
    return Alarms(
      lowerLimit: json['LowerLimit'],
      type: json['Type'],
      upperLimit: json['UpperLimit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LowerLimit': lowerLimit,
      'Type': type,
      'UpperLimit': upperLimit
    };
  }
}

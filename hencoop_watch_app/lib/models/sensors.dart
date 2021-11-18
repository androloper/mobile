class Sensor {
  String? deviceDate;
  int? deviceId;
  String? humidity;
  String? imei;
  int? id;
  bool? isOnline;
  String? lastDate;
  String? lastTime;
  String? licensePlate;
  int? sensorId;
  String? sensorName;
  String? serverDate;
  int? signalLevel;
  String? temperature;
  String? voltage;

  Sensor({this.deviceDate,
    this.deviceId,
    this.humidity,
    this.imei,
    this.id,
    this.isOnline,
    this.lastDate,
    this.lastTime,
    this.licensePlate,
    this.sensorId,
    this.sensorName,
    this.serverDate,
    this.signalLevel,
    this.temperature,
    this.voltage});

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      deviceDate: json['DeviceDate'],
      deviceId: json['DeviceId'],
      humidity: json['Humudity'],
      imei: json['IMEI'],
      id: json['Id'],
      isOnline: json['IsOnline'],
      lastDate: json['LastDate'],
      lastTime: json['LastTime'],
      licensePlate: json['LicensePlate'],
      sensorId: json['SensorId'],
      sensorName: json['SensorName'],
      serverDate: json['ServerDate'],
      signalLevel: json['SignalLevel'],
      temperature: json['Temperature'],
      voltage: json['Voltage'],
    );
  }
}
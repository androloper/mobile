class Alarm {
  String? createDate;
  int? deviceId;
  String? humidity;
  String? humidityLowerLimit;
  String? humidityUpperLimit;
  String? licensePlate;
  String? temperature;
  String? temperatureLowerLimit;
  String? temperatureUpperLimit;
  int? type;

  Alarm({this.createDate,
    this.deviceId,
    this.humidity,
    this.humidityLowerLimit,
    this.humidityUpperLimit,
    this.licensePlate,
    this.temperature,
    this.temperatureLowerLimit,
    this.temperatureUpperLimit,
    this.type});

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      createDate: json['CreateDate'],
      deviceId: json['DeviceId'],
      humidity: json['Humudity'],
      humidityLowerLimit: json['HumudityLowerLimit'],
      humidityUpperLimit: json['HumudityUpperLimit'],
      licensePlate: json['LicensePlate'],
      temperature: json['Temperature'],
      temperatureLowerLimit: json['TemperatureLowerLimit'],
      temperatureUpperLimit: json['TemperatureUpperLimit'],
      type: json['Type'],
    );
  }
}

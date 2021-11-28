import 'dart:convert';
import 'package:hencoop_watch_app/models/alarms.dart';
import 'package:hencoop_watch_app/models/configs.dart';
import 'package:hencoop_watch_app/models/hencoops.dart';
import 'package:hencoop_watch_app/models/sensors.dart';
import 'package:hencoop_watch_app/models/login_request.dart';
import 'package:hencoop_watch_app/services/webpages.dart';
import 'package:http/http.dart' as http;

class APIService {
  var wp = new Webpages();
  static late LoginRequestModel lrm;

  Future<http.Response> login(LoginRequestModel? loginRequestModel) async {
    lrm = loginRequestModel!;
    Map<String, String> headers = new Map();
    headers["Content-Type"] =
    "application/x-www-form-urlencoded; charset=UTF-8";
    var data = {"UserName": '${loginRequestModel!.username}', "Password": '${loginRequestModel.password}'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    return await http.get(Uri.parse('${wp.wpLogin}$formData'),
        headers: headers);
  }

  Future<List<Hencoop>> fetchData() async {
    Map<String, String> headers = new Map();
    headers["Content-Type"] =
    "application/x-www-form-urlencoded; charset=UTF-8";
    var data = {"UserName": '${lrm.username}', "Password": '${lrm.password}'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    final response = await http.get(Uri.parse(
        '${wp.wpHencoop}$formData'),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body)['HencoopsByUserResult'].cast<Map<String, dynamic>>();
      List<Hencoop> hencList = jsonItems.map<Hencoop>((json) {
        return Hencoop.fromJson(json);
      }).toList();
      return hencList;
    } else {
      throw Exception('Veri alınamadı. Fonksiyonunu servislerden kontrol et.');
    }
  }

  Future<List<Alarm>> fetchAlarm() async {
    Map<String, String> headers = new Map();
    headers["Content-Type"] =
    "application/x-www-form-urlencoded; charset=UTF-8";
    var data = {"UserName": '${lrm.username}', "Password": '${lrm.password}'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    final response = await http.get(Uri.parse(
        '${wp.wpAlarm}$formData'),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body)['LastAlarmsByUserResult'].cast<Map<String, dynamic>>();
      List<Alarm> alarmList = jsonItems.map<Alarm>((json) {
        return Alarm.fromJson(json);
      }).toList();
      return alarmList;
    } else {
      throw Exception('Veri alınamadı. Fonksiyonunu servislerden kontrol et.');
    }
  }

  Future<List<Sensor>> fetchCensor() async {
    Map<String, String> headers = new Map();
    headers["Content-Type"] =
    "application/x-www-form-urlencoded; charset=UTF-8";
    var data = {"UserName": '${lrm.username}', "Password": '${lrm.password}'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    final response = await http.get(Uri.parse(
        '${wp.wpCensor}$formData'),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body)['LastValuesByUserResult'].cast<Map<String, dynamic>>();
      List<Sensor> censorList = jsonItems.map<Sensor>((json) {
        return Sensor.fromJson(json);
      }).toList();
      return censorList;
    } else {
      throw Exception('Veri alınamadı. Fonksiyonunu servislerden kontrol et.');
    }
  }

  Future<List<Config>> fetchConfig() async {
    Map<String, String> headers = new Map();
    headers["Content-Type"] =
    "application/x-www-form-urlencoded; charset=UTF-8";
    var data = {"UserName": '${lrm.username}', "Password": '${lrm.password}'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    final response = await http.get(Uri.parse(
        '${wp.wpAyarlar}$formData'),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body)['HencoopsWithLimitByUserResult'].cast<Map<String, dynamic>>();
      List<Config> configList = jsonItems.map<Config>((json) {
        return Config.fromJson(json);
      }).toList();
      return configList;
    } else {
      throw Exception('Veri alınamadı. Fonksiyonunu servislerden kontrol et.');
    }
  }

  Future<List<Config>> updateConfig(Config cfg) async {
    Map<String, String> headers = new Map();
    headers["Content-Type"] =
    "application/x-www-form-urlencoded; charset=UTF-8";
    Map data = {'DeviceId': '${cfg.deviceId}',
      'LLT': '${cfg.alarms![0].lowerLimit}',
      'ULT': '${cfg.alarms![0].upperLimit}',
      'LLH': '${cfg.alarms![1].lowerLimit}',
      'ULH': '${cfg.alarms![1].upperLimit}'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    final http.Response response = await http.get(Uri.parse('${wp.wpConfig}$formData'),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},);
    if (response.statusCode == 200) {
      var sth = json.decode(response.body)['SaveAlarmSettingsResult'];
      return sth;
    }
    else throw Exception('Veri alınamadı. Fonksiyonunu servislerden kontrol et.');
  }

}
import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
  // Box which will use to store the things
  static final userBox = Hive.box("hiveBox");

  // Create or add single data in hive
  static createUser(Map data) {
    userBox.add(data);
  }

  // Create or add multiple data in hive
  static addAllUser(List data) {
    userBox.addAll(data);
  }

  // Get All data  stored in hive
  static List getAllUsers() {
    final data = userBox.keys.map((key) {
      final value = userBox.get(key);
      return {"key": key, "name": value["name"], "email": value['email']};
    }).toList();

    return data.reversed.toList();
  }

  // Get data for particular user in hive
  static Map getUser(int key) {
    return userBox.get(key);
  }

  // update data for particular user in hive
  static updateUser(int key, Map data) {
    userBox.put(key, data);
  }

  // delete data for particular user in hive
  static deleteUser(int key) {
    return userBox.delete(key);
  }

  // delete data for particular user in hive
  static deleteAllUser() {
    return userBox.deleteAll(userBox.keys);
  }

}
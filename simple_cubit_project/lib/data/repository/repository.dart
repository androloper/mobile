import 'package:simple_cubit_project/data/models/user.dart';
import 'package:simple_cubit_project/data/services/api.dart';

class Repository {
  final Api? api;

  Repository({this.api});

  Future<List<User>> fetchUsers() async {
    final raw = await api!.fetchUsers();
    return raw;
  }

  Future fetchUserInfo(int id) async {
    final raw = await api!.fetchUserInfo(id);
    return raw;
  }

}

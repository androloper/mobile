import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_cubit_project/data/models/user.dart';
import 'package:simple_cubit_project/data/repository/repository.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final Repository? repository;

  UsersCubit({this.repository}) : super(UsersInitial());

  void fetchUsers() {
    Timer(Duration(seconds: 2), () {
      repository!.fetchUsers().then((users) {
        emit(UsersLoaded(users: users));
      });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_project/ui/screens/users/users_list_screen.dart';
import 'cubit/users/users_cubit.dart';
import 'data/repository/repository.dart';
import 'data/services/api.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Repository? repository;
  UsersCubit? usersCubit;

  MyApp({Key? key}) : super(key: key) {
    repository = Repository(api: Api());
    usersCubit = UsersCubit(repository: repository);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => UsersCubit(repository: repository),
        child: UserListScreen(),
      ),
    );
  }
}
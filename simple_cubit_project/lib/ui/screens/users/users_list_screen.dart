import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_project/cubit/details/details_cubit.dart';
import 'package:simple_cubit_project/cubit/users/users_cubit.dart';
import 'package:simple_cubit_project/data/repository/repository.dart';
import 'package:simple_cubit_project/data/services/api.dart';
import 'package:simple_cubit_project/ui/screens/details/details_screen.dart';
import 'package:simple_cubit_project/ui/widgets/loading_screen.dart';

class UserListScreen extends StatelessWidget {
  Repository? repository;
  DetailsCubit? detailsCubit;

  UserListScreen({Key? key}) : super(key: key){
    repository = Repository(api: Api());
    detailsCubit = DetailsCubit(repository: repository);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UsersCubit>(context).fetchUsers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users List'),
        ),
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is! UsersLoaded) {
              return LoadingScreen();
            }
            final users = (state as UsersLoaded).users;
            return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ListTile(
                          leading: CircleAvatar(
                            child: Center(
                              child: Text(users[index].name.toString()[0]),
                            ),
                          ),
                          title: Text("${users[index].name}"),
                          subtitle: Text("${users[index].phone}"),
                          trailing: Icon(Icons.info_sharp, color: Colors.green,),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                BlocProvider(
                                  create: (context) => DetailsCubit(repository: repository),
                                  child: DetailsScreen(id: users[index].id),
                              ),
                            ));
                          }),
                    ),
                  );
                });
          },
        ));
  }
}

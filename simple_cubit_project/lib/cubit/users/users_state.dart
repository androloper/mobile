part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<User>? users;

  UsersLoaded({this.users});
}
class UsersError extends UsersState {
  final err;

  UsersError({this.err});
}

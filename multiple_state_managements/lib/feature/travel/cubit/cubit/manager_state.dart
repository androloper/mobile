part of 'manager_cubit.dart';

abstract class ManagerState extends Equatable {
  const ManagerState();
  @override
  List<Object> get props => [];
}

class ManagerInitial extends ManagerState {
  final String data;
  const ManagerInitial(this.data);
}
